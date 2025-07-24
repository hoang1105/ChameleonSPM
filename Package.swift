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
            name: "Chameleon",
            path: "Sources/Chameleon",
            sources: ["ObjC", "UIColor+ChameleonSwift.swift"],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("include"),
                .headerSearchPath("ObjC"),
                .define("SWIFT_PACKAGE"),
                .unsafeFlags(["-fmodules"])
            ],
            linkerSettings: [
                .linkedFramework("UIKit", .when(platforms: [.iOS, .tvOS, .watchOS, .visionOS])),
                .linkedFramework("Foundation")
            ]
        )
    ]
)