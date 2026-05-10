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
            targets: ["SwiftGodot", "GDExtension"]),
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
            url: "https://github.com/cafecito-games/SwiftGodot/releases/download/0.0.0-test.6/SwiftGodot.xcframework.zip",
            checksum: "2ab47b179c33bcabe62ce7f62c8093d1cf90af39012899f2e6158e4a1d12fc8b"),
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
        .testTarget(name: "SwiftGodotTests", dependencies: ["SwiftGodot", "GDExtension", "SwiftGodotMacroLibrary"]),
    ]
)
