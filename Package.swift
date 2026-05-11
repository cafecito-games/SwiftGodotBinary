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
            url: "https://github.com/cafecito-games/SwiftGodot/releases/download/0.0.0-test.20/SwiftGodot.xcframework.zip",
            checksum: "76fc7dd000cbad05f088ec4383cc0fec5ce4c67acad37de322d1bc326ac9ac69"),
        .binaryTarget(
            name: "SwiftGodotRuntime",
            url: "https://github.com/cafecito-games/SwiftGodot/releases/download/0.0.0-test.20/SwiftGodotRuntime.xcframework.zip",
            checksum: "7f68d3ae8dc934543bb47a82ed4f274c74951cd46ce04511c76e419876779532"),
        .binaryTarget(
            name: "SwiftGodotMacroLibrary",
            url: "https://github.com/cafecito-games/SwiftGodot/releases/download/0.0.0-test.20/SwiftGodotMacros.artifactbundle.zip",
            checksum: "55eb061a918f6324673f8d9fb78519acf4a10602513f1cf1999c82d1f41c56ef"),
        .target(
            name: "GDExtension",
            path: "Sources/GDExtension"),
        .testTarget(name: "SwiftGodotTests", dependencies: ["SwiftGodot", "SwiftGodotRuntime", "GDExtension"]),
    ]
)
