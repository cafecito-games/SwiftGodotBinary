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
        // SwiftGodot.xcframework already contains the SwiftGodotRuntime module
        // (statically linked, with its .swiftmodule). Shipping a separate
        // SwiftGodotRuntime binary would register every runtime class twice.
        .library(
            name: "SwiftGodot",
            targets: ["SwiftGodot", "GDExtension", "SwiftGodotMacroLibrary"]),
    ],
    targets: [
        .binaryTarget(
            name: "SwiftGodot",
            path: "Binaries/SwiftGodot.xcframework"),
        .binaryTarget(
            name: "SwiftGodotMacroLibrary",
            path: "Binaries/SwiftGodotMacros.artifactbundle"),
        .target(
            name: "GDExtension",
            path: "Sources/GDExtension"),
        .testTarget(name: "SwiftGodotTests", dependencies: ["SwiftGodot", "GDExtension"]),
    ]
)
