"""Contains the internal repository rule version_repo."""

# TODO(https://github.com/bazelbuild/bazel/issues/32020): Use a native repository context
# annotation when supported Bazel versions expose it.
def _version_repo_impl(rctx):
    # type: (repository_ctx) -> repo_metadata | None
    rctx.file(
        "BUILD.bazel",
        """
load("@bazel_skylib//:bzl_library.bzl", "bzl_library")

exports_files(["version.bzl"])

bzl_library(
    name = "version",
    srcs = ["version.bzl"],
    visibility = ["//visibility:public"],
)
""",
    )
    rctx.file("version.bzl", "version = '" + native.bazel_version + "'")
    if hasattr(rctx, "repo_metadata"):
        return rctx.repo_metadata(reproducible = False)
    return None

version_repo = repository_rule(
    _version_repo_impl,
    # Force reruns on server restarts to keep native.bazel_version up-to-date.
    local = True,
)
