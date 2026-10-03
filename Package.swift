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
            targets: ["SwiftGodot", "GDExtensionC", "SwiftGodotMacroLibrary"]),
    ],
    targets: [
        .binaryTarget(
            name: "SwiftGodot",
            path: "Binaries/SwiftGodot.xcframework"),
        .binaryTarget(
            name: "GDExtensionC",
            path: "Binaries/GDExtensionC.xcframework"),
        .binaryTarget(
            name: "SwiftGodotMacroLibrary",
            path: "Binaries/SwiftGodotMacros.artifactbundle"),
        .testTarget(name: "SwiftGodotTests", dependencies: ["SwiftGodot", "GDExtensionC"]),
    ]
)
