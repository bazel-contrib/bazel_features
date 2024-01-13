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

        maybe(
            http_archive,
            name = "io_bazel_stardoc",
            sha256 = "62bd2e60216b7a6fec3ac79341aa201e0956477e7c8f6ccc286f279ad1d96432",
            urls = [
                "https://mirror.bazel.build/github.com/bazelbuild/stardoc/releases/download/0.6.2/stardoc-0.6.2.tar.gz",
                "https://github.com/bazelbuild/stardoc/releases/download/0.6.2/stardoc-0.6.2.tar.gz",
            ],
        )
