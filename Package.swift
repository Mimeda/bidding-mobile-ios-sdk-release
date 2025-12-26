// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "bidding-mobile-ios-sdk",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "bidding-mobile-ios-sdk",
            targets: ["bidding-mobile-ios-sdk"]
        ),
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "bidding-mobile-ios-sdk",
            url: "https://github.com/Mimeda/bidding-mobile-ios-sdk-release/releases/download/v1.0.0-beta.11-SNAPSHOT/bidding_mobile_ios_sdk.xcframework.zip",
            checksum: "89021df347d4d1c86c9f063fbe0a8ef1c422f598bce2e6abb75938e69fcb49be"
        ),
    ]
)
