load("//private:version_repo.bzl", "version_repo")
load("//private:globals_repo.bzl", "globals_repo")
load(":globals.bzl", "GLOBALS")

def bazel_features_deps():
    version_repo(name = "bazel_features_version")
    globals_repo(
        name = "bazel_features_globals",
        globals = GLOBALS,
    )
