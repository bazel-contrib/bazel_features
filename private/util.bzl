load("@bazel_features_version//:version.bzl", "version")
load(":parse.bzl", "parse_version")

BAZEL_VERSION = parse_version(version)

def le(v):
    return BAZEL_VERSION <= parse_version(v)

def lt(v):
    return BAZEL_VERSION < parse_version(v)

def ne(v):
    return BAZEL_VERSION != parse_version(v)

def ge(v):
    return BAZEL_VERSION >= parse_version(v)

def gt(v):
    return BAZEL_VERSION > parse_version(v)
