load("//private:util.bzl", "ge", "gt", "le", "lt", "ne")

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
    rules = _rules,
    toolchains = _toolchains,
)
