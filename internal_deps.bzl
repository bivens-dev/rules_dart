"""Our "development" dependencies

Users should *not* need to install these. If users see a load()
statement from these, that's a bug in our distribution.
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", _http_archive = "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def http_archive(name, **kwargs):
    maybe(_http_archive, name = name, **kwargs)

def rules_dart_internal_deps():
    "Fetch deps needed for local development"
    http_archive(
        name = "io_bazel_rules_go",
        sha256 = "6b65cb7917b4d1709f9410ffe00ecf3e160edf674b78c54a894471320862184f",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.39.0/rules_go-v0.39.0.zip",
            "https://github.com/bazelbuild/rules_go/releases/download/v0.44.0/rules_go-v0.39.0.zip",
        ],
    )

    http_archive(
        name = "bazel_gazelle",
        sha256 = "32938bda16e6700063035479063d9d24c60eda8d79fd4739563f50d331cb3209",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-gazelle/releases/download/v0.35.0/bazel-gazelle-v0.35.0.tar.gz",
            "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.35.0/bazel-gazelle-v0.35.0.tar.gz",
        ],
    )

    # Override bazel_skylib distribution to fetch sources instead
    # so that the gazelle extension is included
    # see https://github.com/bazelbuild/bazel-skylib/issues/250
    http_archive(
        name = "bazel_skylib",
        sha256 = "3b620033ca48fcd6f5ef2ac85e0f6ec5639605fa2f627968490e52fc91a9932f",
        strip_prefix = "bazel-skylib-1.3.0",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/archive/1.3.0.tar.gz",
            "https://github.com/bazelbuild/bazel-skylib/archive/refs/tags/1.3.0.tar.gz",
        ],
    )

    http_archive(
        name = "io_bazel_stardoc",
        sha256 = "dfbc364aaec143df5e6c52faf1f1166775a5b4408243f445f44b661cfdc3134f",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/stardoc/releases/download/0.5.6/stardoc-0.5.6.tar.gz",
            "https://github.com/bazelbuild/stardoc/releases/download/0.5.6/stardoc-0.5.6.tar.gz",
        ],
    )

    http_archive(
        name = "aspect_bazel_lib",
        sha256 = "fc8bd670380eaba5314769abbe9fee21d641e3da06d9d26b8073a301f6d62332",
        strip_prefix = "bazel-lib-2.1.0",
        url = "https://github.com/aspect-build/bazel-lib/archive/refs/tags/v2.1.0.tar.gz",
    )
