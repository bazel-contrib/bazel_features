def _version_repo_impl(mctx):
    mctx.file("BUILD.bazel")
    mctx.file("version.bzl", "version = '" + native.bazel_version + "'")

version_repo = repository_rule(_version_repo_impl)
