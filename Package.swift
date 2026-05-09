// swift-tools-version:6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftGodot",
    products: [
        .library(
            name: "SwiftGodot",
            targets: ["SwiftGodot", "GDExtension"])
    ],
    targets: [
        .binaryTarget(
            name: "SwiftGodot",
            url: "https://github.com/cafecito-games/SwiftGodot/releases/download/0.0.0-test.4/SwiftGodot.xcframework.zip",
            checksum: "7a9795cbc25025d9f52f957f12fc473c84f9588e02b9d3947d92e5fefe8f4096"),
        .target(
            name: "GDExtension",
            path: "Sources/GDExtension"),
        .testTarget(name: "SwiftGodotTests", dependencies: ["SwiftGodot", "GDExtension"]),
    ]
)
