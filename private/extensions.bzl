load(":repo.bzl", "version_repo")

def _version_extension_impl(mctx):
    version_repo(name = "bazel_version")

version_extension = module_extension(_version_extension_impl)
