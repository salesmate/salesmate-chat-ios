//
//  AppDelegate.h
//  Sample-ObjC
//
//  Created by Vishal Nandoriya on 27/07/22.
//

#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, UNUserNotificationCenterDelegate>

@property (strong, nonatomic) UIWindow *window;

@end

