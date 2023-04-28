def _version_repo_impl(rctx):
    rctx.file("BUILD.bazel")
    rctx.file("version.bzl", "version = '" + native.bazel_version + "'")

version_repo = repository_rule(_version_repo_impl)
