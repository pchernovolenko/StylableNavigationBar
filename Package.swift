// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StylableNavigationBar",
    platforms: [
        .iOS(.v11),
    ],
    products: [
        .library(
            name: "StylableNavigationBar",
            targets: ["StylableNavigationBar"]),
    ],
    targets: [
        .target(
            name: "StylableNavigationBar",
            path: "StylableNavigationBar"
        ),
    ]
)
