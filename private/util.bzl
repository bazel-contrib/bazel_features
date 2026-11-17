"""Internal-only utility functions."""

load("@bazel_features_version//:version.bzl", "incompatible_env", "version")
load(":parse.bzl", "parse_version")

BAZEL_VERSION = parse_version(version)

def parse_incompatible_env(name, value, default):
    """Parses the value of an environment variable toggling an incompatible change.

    Args:
      name: the name of the environment variable, used in error messages.
      value: the value of the environment variable, or None if it isn't set.
      default: the value to return if the environment variable isn't set or is empty.

    Returns:
      True if the incompatible change is enabled, False otherwise.
    """
    if not value:
        return default
    if value in ("1", "true", "True"):
        return True
    if value in ("0", "false", "False"):
        return False
    fail("Invalid value for --repo_env={}: '{}', expected 0 or 1".format(name, value))

def incompatible(name, default):
    """Returns whether the incompatible change toggled by an environment variable is enabled.

    Args:
      name: the name of the environment variable, which must be listed in
        INCOMPATIBLE_ENV_VARS in version_repo.bzl.
      default: whether the change is enabled if the variable isn't set.

    Returns:
      True if the incompatible change is enabled, False otherwise.
    """
    return parse_incompatible_env(name, incompatible_env.get(name), default)

def le(v):
    return BAZEL_VERSION <= parse_version(v)

def lt(v):
    return BAZEL_VERSION < parse_version(v)

def ne(v):
    return BAZEL_VERSION != parse_version(v)

def ge(v):
    return BAZEL_VERSION >= parse_version(v)

def ge_same_major(v):
    pv = parse_version(v)

    # Version 1.2.3 parses to ([1, 2, 3], ...).
    return BAZEL_VERSION >= pv and BAZEL_VERSION[0][0] == pv[0][0]

def gt(v):
    return BAZEL_VERSION > parse_version(v)
