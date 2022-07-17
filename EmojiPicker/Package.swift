// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "EmojiPicker",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "EmojiPicker",
            targets: ["EmojiPicker"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "EmojiPicker",
            dependencies: []),
        .testTarget(
            name: "EmojiPickerTests",
            dependencies: ["EmojiPicker"]),
    ]
)
