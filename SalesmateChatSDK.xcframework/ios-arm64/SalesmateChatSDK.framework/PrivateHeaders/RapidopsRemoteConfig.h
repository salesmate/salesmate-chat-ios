// RapidopsLocationManager.h
//
 
//
 

#import <Foundation/Foundation.h>

@interface RapidopsRemoteConfig : NSObject
@property (nonatomic) BOOL isEnabledOnInitialConfig;
@property (nonatomic, copy) void (^remoteConfigCompletionHandler)(NSError * error);

+ (instancetype)sharedInstance;

- (void)startRemoteConfig;
- (id)remoteConfigValueForKey:(NSString *)key;
- (void)updateRemoteConfigForForKeys:(NSArray *)keys omitKeys:(NSArray *)omitKeys completionHandler:(void (^)(NSError * error))completionHandler;
- (void)clearCachedRemoteConfig;
@end
