// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// this only exists as a convenient way to get code completion for this repo.
// to export an artifact from this repo, only use `make.sh`

#error("fill in the THEOS variable with the absolute path to your Theos directory")
// after setting the THEOS variable, you can comment out the line above
let THEOS: String = "/path/to/theos"

let package = Package(
    name: "libroot-swift",
    products: [
        .library(
            name: "libroot",
            targets: ["libroot"]
        ),
    ],
    targets: [
        .target(
            name: "libroot",
            path: "",
            sources: ["wrapper.swift"],
            swiftSettings: [
                .unsafeFlags([
                    "-import-underlying-module",
                    "-I\(THEOS)/vendor/include"
                ])
            ]
        ),
    ]
)
