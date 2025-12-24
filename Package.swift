// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "bidding-mobile-ios-sdk-release",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "bidding_mobile_ios_sdk",
            targets: ["bidding_mobile_ios_sdk"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "bidding_mobile_ios_sdk",
            url: "https://github.com/Mimeda/bidding-mobile-ios-sdk-release/releases/download/v1.0.0/bidding_mobile_ios_sdk.xcframework.zip",
            checksum: "a6468f4578722bfed4d990f8fe8b6dfd286452fdbf69c6fcb39848fbc25b2762"
        )
    ]
)

