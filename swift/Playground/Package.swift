// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Playground",
    products: [
        .library(
            name: "Collections",
            targets: ["Collections"]),
         .library(
            name: "Solution",
            targets: ["Solution"]),
        .executable(
            name: "Playground",
            targets: ["Playground"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Collections",
            path: "./Sources/Collections"),
        .testTarget(
            name: "CollectionsTests",
            dependencies: ["Playground"]),
        .target(
            name: "Solution",
            path: "./Sources/Solution"),
        .testTarget(
            name: "SolutionTests",
            dependencies: ["Playground"]),
        .target(
            name: "Playground",
            dependencies: ["Collections","Solution"]),
        .testTarget(
            name: "PlaygroundTests",
            dependencies: ["Playground"]),
    ]
)
