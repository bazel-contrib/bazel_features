load("//private:repo.bzl", "version_repo")

def bazel_features_deps():
    version_repo(name = "bazel_version")
