// swift-tools-version:6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftGodot",
    products: [
        .library(
            name: "SwiftGodot",
            targets: ["SwiftGodot"])
    ],
    targets: [
        .binaryTarget(
            name: "SwiftGodot",
            url: "https://github.com/cafecito-games/SwiftGodot/releases/download/0.0.0-test.3/SwiftGodot.xcframework.zip",
            checksum: "0675c315a8eba080386c2a15c64308332a3364dc56790ecec669217d7dcd1186"),
        .testTarget(name: "SwiftGodotTests", dependencies: ["SwiftGodot"]),
    ]
)
