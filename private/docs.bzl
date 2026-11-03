# TODO(https://github.com/bazelbuild/bazel/issues/32343): Type **kwargs on the declaration
# when Bazel can refer to the keywords of native.starlark_doc_extract and the oldest
# supported Bazel accepts annotations.
def starlark_doc_extract__maybe(name, **kwargs):
    # type: (str, **Unpack[KeywordArgs[native.starlark_doc_extract, "name"]]) -> None
    if hasattr(native, "starlark_doc_extract"):
        native.starlark_doc_extract(name = name, **kwargs)
