"""Contains the macro bazel_features_repos to install internal repositories."""

load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load(":globals.bzl", "GLOBALS")
load(":globals_repo.bzl", "globals_repo")
load(":version_repo.bzl", "version_repo")

# TODO(https://github.com/bazelbuild/bazel/pull/30373): Use native annotations
# once the supported versions all parse them (Bazel 6 does not).
def bazel_features_repos():
    # type: () -> None
    maybe(
        version_repo,
        name = "bazel_features_version",
    )
    maybe(
        globals_repo,
        name = "bazel_features_globals",
        globals = GLOBALS,
    )
