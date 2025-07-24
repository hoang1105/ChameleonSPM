// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "Chameleon",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "Chameleon",
            targets: ["Chameleon"]),
    ],
    targets: [
        .target(
            name: "ChameleonObjC",
            path: "Sources/Chameleon",
            exclude: ["ChameleonShorthand.swift"],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("include"),
                .define("SWIFT_PACKAGE")
            ]
        ),
        .target(
            name: "Chameleon",
            dependencies: ["ChameleonObjC"],
            path: "Sources/Swift"
        )
    ]
)