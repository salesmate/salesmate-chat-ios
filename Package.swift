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
         .package(url: "https://github.com/pusher/NWWebSocket.git", from: "0.5.4"),
         .package(url: "https://github.com/SwiftyJSON/SwiftyJSON", from: "5.0.2"),
         .package(url: "https://github.com/kean/Nuke.git", from: "12.6.0"),
    ],
    targets: [
        .binaryTarget(name: "SalesmateChatSDK",
                      url: "https://github.com/salesmate/salesmate-chat-ios/releases/download/1.1.3/SalesmateChatSDK.xcframework.zip",
                      checksum: "4be13d22bda349c3f61949d4f126dc2e69b9e5fb2b152e05832013b656213e21"),
    ]
)
