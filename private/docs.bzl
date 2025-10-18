def starlark_doc_extract.maybe(name, **kwargs):
    if hasattr(native, "starlark_doc_extract"):
        native.starlark_doc_extract(name = name, **kwargs)
