// swift-tools-version:6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import CompilerPluginSupport
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
        .library(
            name: "SwiftGodotMacros",
            targets: ["SwiftGodotMacroLibrary"]),
    ],
    dependencies: [
        .package(url: "https://github.com/swiftlang/swift-syntax", from: "600.0.1"),
    ],
    targets: [
        .binaryTarget(
            name: "SwiftGodot",
            url: "https://github.com/cafecito-games/SwiftGodot/releases/download/0.0.0-test.16/SwiftGodot.xcframework.zip",
            checksum: "9b9109bfa498b28452f8db108cb511bcdea3e979d625fb0295a8696998dcbc03"),
        .binaryTarget(
            name: "SwiftGodotRuntime",
            url: "https://github.com/cafecito-games/SwiftGodot/releases/download/0.0.0-test.16/SwiftGodotRuntime.xcframework.zip",
            checksum: "fd15bce9b8e857e7b0ead57d9d520c5a5214484e97313398475e43ac68c60f60"),
        .target(
            name: "GDExtension",
            path: "Sources/GDExtension"),
        .macro(
            name: "SwiftGodotMacroLibrary",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftSyntax", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax"),
                .product(name: "SwiftDiagnostics", package: "swift-syntax"),
                .product(name: "SwiftParserDiagnostics", package: "swift-syntax"),
                .product(name: "SwiftParser", package: "swift-syntax"),
                .product(name: "SwiftBasicFormat", package: "swift-syntax"),
            ],
            path: "Sources/SwiftGodotMacroLibrary",
            swiftSettings: [.swiftLanguageMode(.v5)]),
        .testTarget(name: "SwiftGodotTests", dependencies: ["SwiftGodot", "SwiftGodotRuntime", "GDExtension", "SwiftGodotMacroLibrary"]),
    ]
)
