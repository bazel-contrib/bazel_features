"""Internal constants."""

# Access any of these globals via bazel_features.globals.<name>
# If the current version of Bazel doesn't have this global, it will be None.
GLOBALS = {
    # https://github.com/bazelbuild/bazel/commit/02ad1198cddc4ad0050c43cd1044b4b963eedfaf
    "CcSharedLibraryInfo": "7.0.0",

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
    "ProtoInfo": "8.0.0",
}
