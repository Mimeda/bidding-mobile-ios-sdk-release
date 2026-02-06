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
            url: "https://github.com/Mimeda/bidding-mobile-ios-sdk-release/releases/download/v1.0.4-beta.31-SNAPSHOT/bidding_mobile_ios_sdk.xcframework.zip",
            checksum: "c480c2bca5f6b45ea8888d44f40aeb5290e89eb555831ff32690b192410d77a4"
        ),
    ]
)
