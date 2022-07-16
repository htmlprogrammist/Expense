// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "AppImport",
    products: [
        .library(
            name: "AppImport",
            targets: ["AppImport"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ivanvorobei/SPAlert", .upToNextMajor(from: "4.2.0"))
    ],
    targets: [
        .target(
            name: "AppImport",
            dependencies: [])
    ]
)
