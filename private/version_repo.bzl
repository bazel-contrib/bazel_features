def _version_repo_impl(rctx):
    rctx.file("BUILD.bazel", "exports_files([\"version.bzl\"])")
    rctx.file("version.bzl", "version = '" + native.bazel_version + "'")

version_repo = repository_rule(_version_repo_impl)
