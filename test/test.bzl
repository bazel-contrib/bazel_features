load("//private:util.bzl", "BAZEL_VERSION", "ge")
load("//private:parse.bzl", "parse_version")
load("//:features.bzl", "bazel_features")

def _assert_lt(a, b):
    if parse_version(a) >= parse_version(b):
        fail("expected '{}' to be less than '{}', but was not the case".format(a, b))

def run_test(name):
    # some basic version parsing/comparison tests
    _assert_lt("6.0.0", "6.0.1")
    _assert_lt("6.0.0rc3", "6.0.0")
    _assert_lt("6.0.0-pre8.9.10", "6.0.0rc3")
    _assert_lt("6.0.0 some build metadata", "6.1.0 some other build metadata")
    _assert_lt("6.0.0", "")

    # a smoke test on the actual current Bazel version
    if not ge("0.0.1"):
        fail("somehow the current Bazel version (parsed: '{}') is not >= 0.0.1".format(BAZEL_VERSION))

    if not bazel_features.globals.DefaultInfo == DefaultInfo:
        fail("bazel_features.globals.DefaultInfo != DefaultInfo")

    if not bazel_features.globals.__TestingOnly_NeverAvailable == None:
        fail("bazel_features.globals.__TestingOnly_NeverAvailable != None")

    native.filegroup(name = name)
