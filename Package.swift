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
        )
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "bidding-mobile-ios-sdk",
            url: "https://github.com/Mimeda/bidding-mobile-ios-sdk-release/releases/download/v1.0.0/bidding_mobile_ios_sdk.xcframework.zip",
            checksum: "1a508d1adc02b511158ad49fb114d0f870d5604ad2ddd26bdc7cea8aee37739c"
        )
    ]
)
