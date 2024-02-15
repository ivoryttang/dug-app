// swift-tools-version:5.9

import PackageDescription
let package = Package(
    name: "Vapi",
    platforms: [
        .macOS(.v11),
        .iOS(.v13),
        .watchOS(.v7),
        .tvOS(.v13)
    ],
    dependencies: [
        .package(url: "https://github.com/VapiAI/ios", revision: "85100236f0bfee7e418962c6232c8a585c121bd0"),
    ],
    targets: [
        .target(
            name: "Dug",
            dependencies: [
                .product(name: "Vapi", package: "ios")
            ]
        )
    ]
)
