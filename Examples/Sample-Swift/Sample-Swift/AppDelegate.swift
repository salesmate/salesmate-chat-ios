//
//  AppDelegate.swift
//  Sample-Swift
//
//  Created by Vishal Nandoriya on 27/07/22.
//

import UIKit
import SalesmateChatSDK

let SALESMATE_CHAT_SDK_WORKSPACE_ID = ""
let SALESMATE_CHAT_SDK_APP_KEY = ""
let SALESMATE_CHAT_SDK_API_TENANT_ID = ""

#if TARGET_OS_SIMULATOR
var strGlobalDeviceToken:String =  "tokenFromSimulator"
#else
var strGlobalDeviceToken:String =  ""
#endif

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        configureSalesmateChatMessengerSDK(workspaceID: SALESMATE_CHAT_SDK_WORKSPACE_ID, appKey: SALESMATE_CHAT_SDK_APP_KEY, tenantID: SALESMATE_CHAT_SDK_API_TENANT_ID)
        return true
    }
    
    func configureSalesmateChatMessengerSDK(workspaceID: String, appKey: String, tenantID: String) {
        let config = Configuration(workspaceID: workspaceID,
                                   appKey: appKey,
                                   tenantID: tenantID)
        SalesmateChat.setSalesmateChat(configuration: config)
    }
    
    //MARK: -Remote Notiffications...
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let deviceTokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
        
        if strGlobalDeviceToken != deviceTokenString{
            strGlobalDeviceToken = deviceTokenString
        }
        
        strGlobalDeviceToken = deviceTokenString
        
        SalesmateChat.sendDeviceToken(with: strGlobalDeviceToken)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        print("notification received:\(userInfo)");
        
        if SalesmateChat.isSalesmateChatSDKPushNotification(userInfo: userInfo) {
            SalesmateChat.handlePushNotification(userInfo: userInfo)
            completionHandler(.newData)
            return
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        let dict = response.notification.request.content.userInfo as! [String : AnyObject]
        
        if SalesmateChat.isSalesmateChatSDKPushNotification(userInfo: dict) {
            SalesmateChat.handlePushNotification(userInfo: dict)
            return
        }
        completionHandler()
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        let dict = notification.request.content.userInfo as! [String : AnyObject]
        
        if SalesmateChat.isSalesmateChatSDKPushNotification(userInfo: dict) {
            SalesmateChat.handlePushNotification(userInfo: dict)
            return
        }
    }
    
}

