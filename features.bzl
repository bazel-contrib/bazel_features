"""Defines all the features this module supports detecting."""

load("@bazel_features_globals//:globals.bzl", "globals")
load("//private:util.bzl", "ge")

_cc = struct(
    # Whether @bazel_tools//tools/cpp:optional_current_cc_toolchain and the `mandatory` parameter
    # on find_cpp_toolchain are available (#17308).
    # Note: While the target and parameter are available in 6.1.0, they only take effect in Bazel 7.
    find_cpp_toolchain_has_mandatory_param = ge("6.1.0"),
    # Note: In Bazel 6.3 the `grep_includes` parameter is optional and a no-op in the cc_common API
    # In future Bazel versions it will be removed altogether.
    grep_includes_is_optional = ge("6.3.0"),
)

_external_deps = struct(
    # Whether --enable_bzlmod is set, and thus, whether str(Label(...)) produces canonical label
    # literals (i.e., "@@repo//pkg:file").
    is_bzlmod_enabled = str(Label("//:invalid")).startswith("@@"),
)

_flags = struct(
    # This flag was renamed in https://github.com/bazelbuild/bazel/pull/18313
    allow_unresolved_symlinks = (
        "allow_unresolved_symlinks" 
        if ge("7.0.0-pre.20230628.2")
        else "experimental_allow_unresolved_symlinks"
    )
)

_rules = struct(
    # Whether TemplateDict#add_joined allows the map_each callback to return a list of strings (#17306)
    template_dict_map_each_can_return_list = ge("6.1.0"),
)

_toolchains = struct(
    # Whether the mandatory parameter is available on the config_common.toolchain_type function, and thus, whether optional toolchains are supported
    # https://bazel.build/versions/6.0.0/extending/toolchains#optional-toolchains
    has_optional_toolchains = ge("6.0.0"),
)

bazel_features = struct(
    cc = _cc,
    external_deps = _external_deps,
    flags = _flags,
    globals = globals,
    rules = _rules,
    toolchains = _toolchains,
)
