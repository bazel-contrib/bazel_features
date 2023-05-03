"""Provides a macro to do some loading-time test assertions."""

load("//private:util.bzl", "BAZEL_VERSION", "ge")
load("//private:parse.bzl", "parse_version")
load("//:features.bzl", "bazel_features")

def _empty_test_impl(ctx):
    extension = ".bat" if ctx.attr.is_windows else ".sh"
    content = "exit 0" if ctx.attr.is_windows else "#!/usr/bin/env bash\nexit 0"
    executable = ctx.actions.declare_file(ctx.label.name + extension)
    ctx.actions.write(
        output = executable,
        is_executable = True,
        content = content,
    )

    return [DefaultInfo(
        files = depset([executable]),
        executable = executable,
    )]

_empty_test = rule(
    implementation = _empty_test_impl,
    attrs = {"is_windows": attr.bool(mandatory = True)},
    test = True,
)

def _assert_lt(a, b):
    if parse_version(a) >= parse_version(b):
        fail("expected '{}' to be less than '{}', but was not the case".format(a, b))

def run_test(name):
    """Performs some loading-time assertions about bazel_features' APIs, and creats a fake test target.

    Args:
      name: the name of the fake test target."""

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

    # the pseudo test target that doesn't actually test anything
    _empty_test(
        name = name,
        is_windows = select({
            "@bazel_tools//src/conditions:host_windows": True,
            "//conditions:default": False,
        }),
    )
