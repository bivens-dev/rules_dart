"""Mirror of release info"""

# You can automatically generate this information by updating tools/generate_toolchain_values.dart
# with the version you wish to use and from that directory run bazel run //:hash_generator_tool

# Alternatively, the integrity hashes can be manually computed by downloading the SDK and running
# shasum -b -a 384 [downloaded file] | awk '{ print $1 }' | xxd -r -p | base64
TOOL_VERSIONS = {
    "2.18.2": {
        "macos-x64": "sha384-0vUL6Oe3Q6whODww2wD5TK/XbIXHTCzUtdhfR+FofVirntuDvnzWu5jcjWM6jg4c",
        "macos-arm64": "sha384-3Gxm5hr/l237EFGzve5+HuSxxizyxP9Jlj1JNSG1Rwpw9Zf51OOtcu9EVMWCK6oH",
        "linux-x64": "sha384-ricpoko7girauWJciXAq6yoV1bwlwTS2HqH0/QxcICNuoUz9ygIYE9jm6k6Da3Np",
        "linux-arm": "sha384-CxEbcNTacXzuBZwoUDHqIB766hro8zXrYvgBXjHlNZQNQ7apzeqr7B88jh1Yzhp5",
        "linux-arm64": "sha384-jOcTOQZZGOc5y8XJBOobmDzRIbuHA2eeKXulS4L/2gWizqJeUsJFGbKrgtfWRf2m",
        "windows-x64": "sha384-6WBdgtQVvZidSZ14eL9hASxPDHGSbV6kyGP50znJS7lS1nf8GlrIHXd4esGOK9WL",
    },
    "2.18.3": {
        "macos-x64": "sha384-b0TSWt3wzuHdPmG4TDD+DqUHUn0NDShtY1lR9hZKm/5S5bsH2gFxGEHAJ1WwCQAY",
        "macos-arm64": "sha384-pXYg/3+o19isHaz/AvAToAQ0S97nkzDespgf5lyvr90c62Aa4MTNH/Ku1rCwB7Bs",
        "linux-x64": "sha384-d32VgJX8ECtz0b0+dJ/+g+FcmXebjGi8D2TIiYGTfgix9owI035pqiwlW+LzYFrb",
        "linux-arm": "sha384-JK8qzgXifMtzUunFTT5YhzosSzzEWN/kROFgpdKOhzr0eJ4uSAptEynlmFW+KflU",
        "linux-arm64": "sha384-1YCWHavWG8cyVA3MYphp0NC4Yjns6XEWp6dR+MsorD+Wot/7P3QaHJbDY4YWHZGk",
        "windows-x64": "sha384-Gf45DyAWQvY8IJCrXVY8cM9pmNqbM9ccAFdDJiV7hsneBIySNH1fnIT50XM2dj3N",
    },
    "2.18.4": {
        "linux-x64": "sha256-lFw+KaxzhuAMnu6ypczINqywzpiD+8Kd+C/UHJDrO9Y=",
        "linux-ia32": "sha256-qb+yPVkMwi/dNJ0oA72tRjqX9ddYUyF+Awyy6jf7MxU=",
        "linux-arm64": "sha256-snlFTY4oJ4ALGLc210USbI2Z///cx1IVYUWm7Vo5z2I=",
        "linux-arm": "sha256-dGw+E0WYNB0dcWgHJeuSiaQCxmIcrlWuSHWOC60/eEk=",
        "macos-x64": "sha256-NQuRULldeEBZQuLXWqe0x/Ltn92Ci+o58fbAadNHD6U=",
        "macos-arm64": "sha256-KmtJ65KFvYHZsXsnPbMDsnTy3pXnQXGiAx9CwYq8nck=",
        "windows-x64": "sha256-3VcOwJhNmXkjN3tHVe/vYbXnopcXzWSdTAMRrtEw+5U=",
        "windows-ia32": "sha256-PnauO24DJxeBN/eZboxN/pAbDtnSN/YBGxpGvifZz9c=",
    },
    "2.18.5": {
        "linux-x64": "sha256-9k+8W5DGgX1vOiXPnOxCdzQ88mXfIzYAg4BQY5xZOIk=",
        "linux-ia32": "sha256-IgqpUVCnOTHcVgYJIpHUmikfMP2kq+0SFGjwGuVKfxA=",
        "linux-arm64": "sha256-+MbX4bDwkMU2pkpqEwsGVTPv2DwpD0UQ9CMlOJoMJ6U=",
        "linux-arm": "sha256-UF3wv82xoitkhnGPaDNRSSbzn0so85Cztn74/HsUklU=",
        "macos-x64": "sha256-OZPFSc1Dq0hmJOUyh6XhVV9MR+qr1TrzC89HcupI2tw=",
        "macos-arm64": "sha256-xnfaDFsYQqXXdBTeMQrPlhzwMsiHDFZPKot9705NIn8=",
        "windows-x64": "sha256-F4L8fy94TZyAwjr44az86pcwtYd0YUi2I5z6kchkjZk=",
        "windows-ia32": "sha256-J67sUcVhY1Dd2g8/+92oKvny0i9Ch3s1BXC+6i+9fx8=",
    },
    "2.18.6": {
        "linux-x64": "sha256-SSwOg1IDxEAuPYKR0StTkn8DAMgICq9jqRE8IEJVpzU=",
        "linux-ia32": "sha256-yX0bO/VJaQ+4w5OS3TawBHlcVOgI/mw1A6qHKFD3nDI=",
        "linux-arm64": "sha256-Ydu0YrSK7k8xhLbs3TVmMvORZa6FcP53pikApkRPcCw=",
        "linux-arm": "sha256-w2D/ZNEwbtUDin35gULv+DKr68SG0+K39osPxTJ5qEk=",
        "macos-x64": "sha256-iCSXJp3G1zBMM2fXIcFw8g/0Zhy7BVueyGwAb6lcIxQ=",
        "macos-arm64": "sha256-1fVdEjGsGJ0ViZvTljH4OR7zJhEdNWpjvypN0U13VeA=",
        "windows-x64": "sha256-ehX1Dg2V1pdl0ICotURpvhrxukztOsXKAbNWyINFZfU=",
        "windows-ia32": "sha256-piBXkzlkfu28WzTM8EH4bity6ycHybZqpWiGKuDsp3o=",
    },
}
