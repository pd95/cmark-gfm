// swift-tools-version:5.1

import PackageDescription

// Library version to be updated according to test/spec.txt
let (major, minor, patch, build) = (0, 29, 0, 0)

let package = Package(
    name: "cmark-gfm",
    products: [
        .library(name: "cmark-gfm", targets: ["cmark-gfm"]),
    ],
    targets: [
        .target(name: "cmark-gfm",
                cSettings: [
                    .headerSearchPath("./private_include"),
                    .unsafeFlags([
                        "-DCMARK_GFM_VERSION_MAJOR=\(major)",
                        "-DCMARK_GFM_VERSION_MINOR=\(minor)",
                        "-DCMARK_GFM_VERSION_PATCH=\(patch)",
                        "-DCMARK_GFM_VERSION_BUILD=\(build)"
                    ])
                ]
        ),
        .testTarget(
            name: "cmarkTest",
            dependencies: ["cmark-gfm"]),
    ]
)
