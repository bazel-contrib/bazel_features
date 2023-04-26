Bazel Features
==============

Use this to determine the availability of a Bazel feature in your ruleset. It works under the hood by comparing the Bazel version against a known range in which the feature is available. Example usage:

```starlark
load("@bazel_features//:features.bzl", "bazel_features")
if bazel_features.toolchains.has_optional_toolchains:
    # Do something
```

The `features.bzl` file contains the list of features.

