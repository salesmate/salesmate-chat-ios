[![CocoaPods](https://img.shields.io/badge/platforms-iOS-orange.svg?maxAge=2592000)](https://cocoapods.org/pods/SalesmateChatSDK)
[![Languages](https://img.shields.io/badge/languages-OjbC%20%7C%20%20Swift-orange.svg?maxAge=2592000)](https://github.com/salesmate/salesmate-chat-ios)
[![CocoaPods](https://img.shields.io/cocoapods/v/SalesmateChatSDK.svg?maxAge=2592000)](https://cocoapods.org/pods/SalesmateChatSDK)
[![Apache License](http://img.shields.io/badge/license-APACHE2-blue.svg?style=flat)](https://www.apache.org/licenses/LICENSE-2.0.html)

# salesmate-chat-ios

## Installation

SalesmateChatSDK for iOS supports iOS 13+. 
Xcode 13 is required to build SalesmateChatSDK iOS.

### CocoaPods
Cocoapods 1.10 is required to install SalesmateChatSDK.
Add the SalesmateChatSDK pod into your Podfile and run `pod install`.
```ruby
    target :YourTargetName do
      pod 'SalesmateChatSDK'
    end
```

### Swift Package Manager
Add `https://github.com/salesmate/salesmate-chat-ios` as a Swift Package Repository in Xcode and follow the instructions to add `SalesmateChatSDK` as a Swift Package.

<img width="1407" alt="SPM" src="https://user-images.githubusercontent.com/71368703/186414265-ce0867fa-6633-4ca7-bba5-63f86ce10ad0.png">

### Manual Installation

1. [Download SalesmateChatSDK for iOS](https://github.com/salesmate/salesmate-chat-ios/archive/refs/heads/master.zip) and extract the zip.
2. Drag `SalesmateChatSDK.xcframework` into your project. 

<img width="1004" alt="M1" src="https://user-images.githubusercontent.com/71368703/186413693-8fd814d2-c258-4a4b-9883-27d7b8de3521.png">

Make sure "Copy items if needed" is selected and click Finish.

![M2](https://user-images.githubusercontent.com/71368703/186414015-5a321e31-c15c-4ad1-b057-dd1570e9effd.jpg)

3. In the target settings for your app, set the SalesmateChatSDK.xcframework to “Embed & Sign”. This can be found in the “Frameworks, Libraries, and Embedded Content” section of the “General” tab.

![M3](https://user-images.githubusercontent.com/71368703/186414127-8401e95e-8516-4b3b-91ed-ef341e1cb242.jpg)

## Update Info.plist

#### Photo Library usage:

With the exception of apps that _only_ support iOS 14+, when installing SalesmateChatSDK, you'll need to make sure that you have a `NSPhotoLibraryUsageDescription` entry in your `Info.plist`.

For apps that support iOS 13, this is [required by Apple](https://developer.apple.com/library/content/qa/qa1937/_index.html) to access the photo library. It is necessary when installing SalesmateChatSDK due to the image upload functionality. Users will be prompted for the photo library permission only when they tap the image upload button.

## Example app
There are example apps provided [here](https://github.com/salesmate/salesmate-chat-ios/tree/master/Examples) for Objective-C and Swift, as well as an example built with SwiftUI.

## Setup and Configuration

* Our [installation guide](https://support.salesmate.io/hc/en-us/categories/360005786852-Chats) contains full setup and initialisation instructions.
* Read ["Configuring SalesmateChatSDK for iOS"](https://support.salesmate.io/hc/en-us/categories/360005786852-Chats).
* Read our guide on [Push Notifications](https://support.salesmate.io/hc/en-us/categories/360005786852-Chats).
*  Please contact us on [SalesmateChatSDK](https://support.salesmate.io/hc/en-us/categories/360005786852-Chats) with any questions you may have, we're only a message away!

## Customer Support

👋  Contact us with any issues at our [SalesmateChatSDK Developer Hub available here](https://support.salesmate.io/hc/en-us/categories/360005786852-Chats). If you bump into any problems or need more support, just start a conversation using SalesmateChatSDK there and it will be immediately routed to our Customer Support Engineers.

## What about events, push notifications, company and user data?

SalesmateChatSDK for iOS has support for all these things. For full details please read our [documentation](https://support.salesmate.io/hc/en-us/categories/360005786852-Chats).
