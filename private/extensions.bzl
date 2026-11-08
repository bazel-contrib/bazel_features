"""Internal module extensions."""

load("@bazel_skylib//lib:modules.bzl", "modules")
load("//private:repos.bzl", "bazel_features_repos")

# TODO(https://github.com/bazelbuild/bazel-skylib/pull/641): Drop this ignore
# when the selected Skylib release types modules.as_extension.
version_extension = modules.as_extension(bazel_features_repos)  # ty: ignore[non-static-type]
