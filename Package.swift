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
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("include"),
                .define("SWIFT_PACKAGE")
            ]
        )
    ]
)