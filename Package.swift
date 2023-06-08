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
         .package(url: "https://github.com/pusher/NWWebSocket.git", from: "0.5.3"),
         .package(url: "https://github.com/SwiftyJSON/SwiftyJSON", from: "5.0.1"),
         .package(url: "https://github.com/kean/Nuke.git", from: "10.3.1"),
    ],
    targets: [
        .binaryTarget(name: "SalesmateChatSDK",
                      url: "https://github.com/salesmate/salesmate-chat-ios/releases/download/1.0.6/SalesmateChatSDK.xcframework.zip",
                      checksum: "bdc17e5fea633d0831ddc4135d7286f2932eebe2b18261501cb703043a8bb1ef"),
    ]
)
