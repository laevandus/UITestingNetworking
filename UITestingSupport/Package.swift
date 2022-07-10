// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UITestingSupport",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "UITestingSupport",
            targets: ["UITestingSupport"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "UITestingSupport",
            dependencies: [],
            swiftSettings: [
                .define("DEBUG", .when(configuration: .debug))
            ]
        ),
        .testTarget(
            name: "UITestingSupportTests",
            dependencies: ["UITestingSupport"]
        ),
    ]
)
