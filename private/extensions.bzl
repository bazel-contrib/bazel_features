"""Internal module extensions."""

load("//private:repos.bzl", "bazel_features_repos")

def _version_extension_impl(_):
    bazel_features_repos()

version_extension = module_extension(_version_extension_impl)
