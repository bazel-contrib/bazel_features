"""Internal module extensions."""

load("@bazel_skylib//lib:modules.bzl", "modules")
load("//private:repos.bzl", "bazel_features_repos")

# Skylib does not yet ship a type for modules.as_extension.
version_extension = modules.as_extension(bazel_features_repos)  # ty: ignore[non-static-type]
