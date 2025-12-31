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
            url: "https://github.com/Mimeda/bidding-mobile-ios-sdk-release/releases/download/v1.0.1-beta.13-SNAPSHOT/bidding_mobile_ios_sdk.xcframework.zip",
            checksum: "3d0f9805694223ebd6b62dd40f0b1a1d86aefeeffd8ccbba328472f7f6fde2e4"
        ),
    ]
)
