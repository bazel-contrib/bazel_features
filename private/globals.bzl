"""Internal constants."""

# Access any of these globals via bazel_features.globals.<name>
# If the current version of Bazel doesn't have this global, it will be None.
GLOBALS = {
    # https://github.com/bazelbuild/bazel/pull/15232
    "RunEnvironmentInfo": "5.3.0",

    # Only used for testing bazel_features itself.
    "DefaultInfo": "0.0.1",
    "__TestingOnly_NeverAvailable": "1000000000.0.0",
}
