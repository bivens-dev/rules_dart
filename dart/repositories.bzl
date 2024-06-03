"""Declare runtime dependencies

These are needed for local dev, and users must install them as well.
See https://docs.bazel.build/versions/main/skylark/deploying.html#dependencies
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", _http_archive = "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("//dart/private:toolchains_repo.bzl", "PLATFORMS", "toolchains_repo")
load("//dart/private:versions.bzl", "TOOL_VERSIONS")

def http_archive(name, **kwargs):
    maybe(_http_archive, name = name, **kwargs)

# WARNING: any changes in this function may be BREAKING CHANGES for users
# because we'll fetch a dependency which may be different from one that
# they were previously fetching later in their WORKSPACE setup, and now
# ours took precedence. Such breakages are challenging for users, so any
# changes in this function should be marked as BREAKING in the commit message
# and released only in semver majors.
# This is all fixed by bzlmod, so we just tolerate it for now.
def rules_dart_dependencies():
    # The minimal version of bazel_skylib we require
    http_archive(
        name = "bazel_skylib",
        sha256 = "bc283cdfcd526a52c3201279cda4bc298652efa898b10b4db0837dc51652756f",
        urls = [
            "https://github.com/bazelbuild/bazel-skylib/releases/download/1.7.1/bazel-skylib-1.7.1.tar.gz",
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.7.1/bazel-skylib-1.7.1.tar.gz",
        ],
    )

########
# Remaining content of the file is only used to support toolchains.
########
_DOC = "Fetch external tools needed for dart toolchain"
_ATTRS = {
    "dart_version": attr.string(mandatory = True, values = TOOL_VERSIONS.keys()),
    "platform": attr.string(mandatory = True, values = PLATFORMS.keys()),
}

def _dart_repo_impl(repository_ctx):
    url = "https://storage.googleapis.com/dart-archive/channels/stable/release/{0}/sdk/dartsdk-{1}-release.zip".format(
        repository_ctx.attr.dart_version,
        repository_ctx.attr.platform,
    )
    repository_ctx.download_and_extract(
        url = url,
        integrity = TOOL_VERSIONS[repository_ctx.attr.dart_version][repository_ctx.attr.platform],
    )
    build_content = """#Generated by dart/repositories.bzl
load("@dev_bivens_rules_dart//dart:toolchain.bzl", "dart_toolchain")
dart_toolchain(name = "dart_toolchain", target_tool = select({
        "@bazel_tools//src/conditions:host_windows": "dart-sdk/bin/dart.exe",
        "//conditions:default": "dart-sdk/bin/dart",
    }),
)
"""

    # Base BUILD file for this repository
    repository_ctx.file("BUILD.bazel", build_content)

dart_repositories = repository_rule(
    _dart_repo_impl,
    doc = _DOC,
    attrs = _ATTRS,
)

# Wrapper macro around everything above, this is the primary API
def dart_register_toolchains(name, **kwargs):
    """Convenience macro for users which does typical setup.

    - create a repository for each built-in platform like "dart_linux_amd64" -
      this repository is lazily fetched when node is needed for that platform.
    - TODO: create a convenience repository for the host platform like "dart_host"
    - create a repository exposing toolchains for each platform like "dart_platforms"
    - register a toolchain pointing at each platform
    Users can avoid this macro and do these steps themselves, if they want more control.
    Args:
        name: base name for all created repos, like "dart1_14"
        **kwargs: passed to each node_repositories call
    """
    for platform in PLATFORMS.keys():
        dart_repositories(
            name = name + "_" + platform,
            platform = platform,
            **kwargs
        )
        native.register_toolchains("@%s_toolchains//:%s_toolchain" % (name, platform))

    toolchains_repo(
        name = name + "_toolchains",
        user_repository_name = name,
    )
