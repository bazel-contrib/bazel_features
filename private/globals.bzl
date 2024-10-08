"""Internal constants."""

# Access any of these globals via bazel_features.globals.<name>
# If the current version of Bazel doesn't have this global, it will be None.
GLOBALS = {
    # https://github.com/bazelbuild/bazel/commit/c2d50de6ce2652e7fd56170663fd11e75098f35c
    "CcSharedLibraryInfo": "6.0.0-pre.20220630.1",

    # https://github.com/bazelbuild/bazel/commit/dbb09c9ea84cc6099ad7a30fa8206130d025f7ad
    "CcSharedLibraryHintInfo": "7.0.0-pre.20230316.2",

    # https://github.com/bazelbuild/bazel/commit/d1d35b280af1459458f996502e255d3774f391c2
    "PackageSpecificationInfo": "6.4.0",

    # https://github.com/bazelbuild/bazel/pull/15232
    "RunEnvironmentInfo": "5.3.0",

    # Only used for testing bazel_features itself.
    "DefaultInfo": "0.0.1",
    "__TestingOnly_NeverAvailable": "1000000000.0.0",
}

# This one works in the reverse, put in the version when the global symbol is removed.
LEGACY_GLOBALS = {
    "JavaInfo": "8.0.0",
    "JavaPluginInfo": "8.0.0",
    "ProtoInfo": "8.0.0",
    "PyCcLinkParamsProvider": "8.0.0",
    "PyInfo": "8.0.0",
    "PyRuntimeInfo": "8.0.0",
}
