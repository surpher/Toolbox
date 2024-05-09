// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Toolbox",

    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .macCatalyst(.v13),
        .tvOS(.v13)
    ],

    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Crypto",
            targets: [
                "Crypto"
            ]
        ),
    ],

    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Crypto",
            path: "Sources/Crypto"
        ),
        .testTarget(
            name: "CryptoTests",
            dependencies: [
                "Crypto"
            ],
            path: "Tests/CryptoTests",
            resources: [
                .copy("Resources/test_file.txt")
            ]
        ),
    ]
)
