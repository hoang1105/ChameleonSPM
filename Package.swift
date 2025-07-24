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
            sources: ["ObjC"],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("include"),
                .headerSearchPath("ObjC"),
                .define("SWIFT_PACKAGE")
            ],
            linkerSettings: [
                .linkedFramework("UIKit"),
                .linkedFramework("Foundation")
            ]
        ),
        .target(
            name: "Chameleon",
            dependencies: ["ChameleonObjC"],
            path: "Sources/Swift"
        )
    ]
)