// swift-tools-version: 5.7
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

    dependencies: [
      .package(url: "https://github.com/apple/swift-crypto.git", .upToNextMajor(from: "3.0.0"))
    ],

    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Crypto",
            dependencies: [
                .product(name: "Crypto", package: "swift-crypto"),
            ],
            path: "Sources/Crypto"
        ),
        .testTarget(
            name: "CryptoTests",
            dependencies: [
                "Crypto",
                .product(name: "Crypto", package: "swift-crypto", moduleAliases: ["Crypto": "SwiftCrypto"])
            ],
            path: "Tests/CryptoTests",
            resources: [
                .copy("Resources/test_file.txt")
            ]
        ),
    ]
)
