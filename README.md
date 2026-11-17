# Bazel Features

Use this to determine the availability of a Bazel feature in your ruleset. It works under the hood by comparing the Bazel version against a known range in which the feature is available. Example usage:

```starlark
load("@bazel_features//:features.bzl", "bazel_features")
if bazel_features.toolchains.has_optional_toolchains:
    # Do something
```

The [`features.bzl`](features.bzl) file contains the list of features.

### Accessing globals

References to global Starlark symbols that do not exist cause load time errors, which means that their availability in Bazel cannot be tested via a regular feature.
Instead, use `bazel_features.globals.<symbol>`, which is `<symbol>` if the symbol is available and `None` else.

See [`globals.bzl`](private/globals.bzl) for the list of symbols that can be checked for in this way.

### Incompatible changes

Some incompatible changes in Bazel can't be detected from the Bazel version alone, for example while they are only available in development builds.
Such changes are toggled with an environment variable that can be set with `--repo_env=<NAME>=1` to enable them or `--repo_env=<NAME>=0` to disable them, which overrides the default for the current Bazel version.

* `BAZEL_INCOMPATIBLE_TOOLCHAIN_TYPES_IN_RULES`: Whether the toolchain types in `@bazel_tools` are aliases of the toolchain types defined in rules_cc, rules_java and rules_python.
  Defaults to `0`.
