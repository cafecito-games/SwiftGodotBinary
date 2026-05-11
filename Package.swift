// swift-tools-version:6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftGodot",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
    ],
    products: [
        .library(
            name: "SwiftGodot",
            targets: ["SwiftGodot", "SwiftGodotRuntime", "GDExtension"]),
    ],
    targets: [
        .binaryTarget(
            name: "SwiftGodot",
            path: "Binaries/SwiftGodot.xcframework"),
        .binaryTarget(
            name: "SwiftGodotRuntime",
            path: "Binaries/SwiftGodotRuntime.xcframework"),
        .binaryTarget(
            name: "SwiftGodotMacroLibrary",
            path: "Binaries/SwiftGodotMacros.artifactbundle"),
        .target(
            name: "GDExtension",
            path: "Sources/GDExtension"),
        .testTarget(name: "SwiftGodotTests", dependencies: ["SwiftGodot", "SwiftGodotRuntime", "GDExtension"]),
    ]
)
