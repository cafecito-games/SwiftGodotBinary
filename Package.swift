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
            url: "https://github.com/cafecito-games/SwiftGodot/releases/download/0.0.0-test.14/SwiftGodot.xcframework.zip",
            checksum: "e2606d52563b19a4861b6ca4f2fad539c9bfcf16d41d48181382de4825adac0b"),
        .binaryTarget(
            name: "SwiftGodotRuntime",
            url: "https://github.com/cafecito-games/SwiftGodot/releases/download/0.0.0-test.14/SwiftGodotRuntime.xcframework.zip",
            checksum: "1ce57d77452f2c1126852c65038fd0b1d5fda81eeec153a2cf0e0b97165b72a0"),
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
