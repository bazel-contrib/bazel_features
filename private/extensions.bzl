load("//:deps.bzl", "bazel_features_deps")

def _version_extension_impl(mctx):
    bazel_features_deps(legacy = False)

version_extension = module_extension(_version_extension_impl)
