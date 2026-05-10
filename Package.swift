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
            url: "https://github.com/cafecito-games/SwiftGodot/releases/download/0.0.0-test.8/SwiftGodot.xcframework.zip",
            checksum: "0728c39107bbfed83c17e1dc85114d26240c1e5339874263a464afc568a8ff5c"),
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
