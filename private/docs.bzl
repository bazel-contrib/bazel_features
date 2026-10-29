def starlark_doc_extract__maybe(name, **kwargs):
    # type: (str, **Unpack[KeywordArgs[native.starlark_doc_extract, "name"]]) -> None
    if hasattr(native, "starlark_doc_extract"):
        native.starlark_doc_extract(name = name, **kwargs)
