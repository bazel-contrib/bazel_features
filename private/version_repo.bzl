"""Contains the internal repository rule version_repo."""

# Environment variables that toggle incompatible changes tracked as features.
INCOMPATIBLE_ENV_VARS = [
    # If enabled, the toolchain types in @bazel_tools are aliases of the types
    # in rules_cc, rules_java and rules_python.
    "BAZEL_INCOMPATIBLE_TOOLCHAIN_TYPES_IN_RULES",
]

def _version_repo_impl(rctx):
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
    incompatible_env = {
        name: rctx.os.environ[name]
        for name in INCOMPATIBLE_ENV_VARS
        if name in rctx.os.environ
    }
    rctx.file("version.bzl", "\n".join([
        "version = '" + native.bazel_version + "'",
        "incompatible_env = " + repr(incompatible_env),
    ]))
    if hasattr(rctx, "repo_metadata"):
        return rctx.repo_metadata(reproducible = False)
    return None

version_repo = repository_rule(
    _version_repo_impl,
    # Rerun when an incompatible change is toggled with --repo_env.
    environ = INCOMPATIBLE_ENV_VARS,
    # Force reruns on server restarts to keep native.bazel_version up-to-date.
    local = True,
)
