// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "SalesmateChatSDK",
    platforms: [
        .iOS(.v13) //, .macCatalyst(.v15), .macOS(.v10_15)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SalesmateChatSDK",
            targets: ["SalesmateChatSDK"]),
    ],
    dependencies: [
         .package(url: "https://github.com/daltoniam/Starscream", from: "4.0.4"),
         .package(url: "https://github.com/SwiftyJSON/SwiftyJSON", from: "5.0.1"),
         .package(url: "https://github.com/kean/Nuke.git", from: "10.3.1"),
    ],
    targets: [
        .binaryTarget(name: "SalesmateChatSDK",
                      url: "https://github.com/VishaliOSRapidops/SalesmateChat-iOS/releases/download/1.0.1/SalesmateChatSDK.xcframework.zip",
                      checksum: "4a4493750c229bdc7db45b23c55cbeb0cc94fd66cf9a4ba7e764d14163595d72"),
    ]
)
