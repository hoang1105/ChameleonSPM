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
            targets: ["ChameleonSwift"]),
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
                .define("SWIFT_PACKAGE"),
                .unsafeFlags(["-fmodules"])
            ],
            linkerSettings: [
                .linkedFramework("UIKit", .when(platforms: [.iOS, .tvOS, .watchOS, .visionOS])),
                .linkedFramework("Foundation")
            ]
        ),
        .target(
            name: "ChameleonSwift",
            dependencies: ["ChameleonObjC"],
            path: "Sources/Chameleon",
            sources: ["Swift"],
            linkerSettings: [
                .linkedFramework("UIKit", .when(platforms: [.iOS, .tvOS, .watchOS, .visionOS])),
                .linkedFramework("Foundation")
            ]
        )
    ]
)