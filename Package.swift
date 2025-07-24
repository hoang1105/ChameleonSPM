// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "Chameleon",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(
            name: "Chameleon",
            targets: ["Chameleon"]),
    ],
    targets: [
        .target(
            name: "Chameleon",
            dependencies: [],
            path: "Sources/Chameleon",
            // Không cần 'exclude' hay 'publicHeadersPath' ở đây nữa
            // vì chúng ta sẽ dùng module map.
            cSettings: [
                .headerSearchPath("."),
            ]
        )
    ]
)