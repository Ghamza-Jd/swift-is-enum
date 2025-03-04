// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "IsEnum",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macCatalyst(.v13)],
    products: [
        .library(
            name: "IsEnum",
            targets: ["IsEnum"]
        ),
        .executable(
            name: "IsEnumClient",
            targets: ["IsEnumClient"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax.git", from: "509.0.0"),
    ],
    targets: [
        .macro(
            name: "IsEnumMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax"),
            ]
        ),
        .target(name: "IsEnum", dependencies: ["IsEnumMacros"]),
        .executableTarget(name: "IsEnumClient", dependencies: ["IsEnum"]),
        .testTarget(
            name: "IsEnumTests",
            dependencies: [
                "IsEnumMacros",
                .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
            ]
        ),
    ]
)
