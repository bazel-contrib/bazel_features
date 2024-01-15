load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("//private:globals.bzl", "GLOBALS")
load("//private:globals_repo.bzl", "globals_repo")
load("//private:version_repo.bzl", "version_repo")

def bazel_features_deps(legacy = False):
    version_repo(name = "bazel_features_version")
    globals_repo(
        name = "bazel_features_globals",
        globals = GLOBALS,
    )

    if legacy:
        maybe(
            http_archive,
            name = "bazel_skylib",
            sha256 = "cd55a062e763b9349921f0f5db8c3933288dc8ba4f76dd9416aac68acee3cb94",
            urls = [
                "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.5.0/bazel-skylib-1.5.0.tar.gz",
                "https://github.com/bazelbuild/bazel-skylib/releases/download/1.5.0/bazel-skylib-1.5.0.tar.gz",
            ],
        )
