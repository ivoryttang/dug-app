// swift-tools-version:5.6.0

import PackageDescription
let package = Package(
    name: "Vapi",
    platforms: [
        .macOS(.v11),
        .iOS(.v14),
        .watchOS(.v7),
        .tvOS(.v13)
    ],
    dependencies: [
        .package(url: "https://github.com/VapiAI/ios", from: "5.6.0"),
    ],
    targets: [
        .target(
            name: "Dug",
            dependencies: [
                .product(name: "Vapi", package: "ios")
            ]
        ),
        // Add testTarget if needed
    ]
)
