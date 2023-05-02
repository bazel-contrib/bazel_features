load("//:deps.bzl", "bazel_features_deps")
load(":version_repo.bzl", "version_repo")
load(":globals_repo.bzl", "globals_repo")

def _version_extension_impl(mctx):
    bazel_features_deps()

version_extension = module_extension(_version_extension_impl)
