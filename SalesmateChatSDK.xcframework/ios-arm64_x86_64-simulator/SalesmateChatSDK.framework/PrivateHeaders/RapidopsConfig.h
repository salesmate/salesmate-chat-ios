// RapidopsConfig.h
//
 
//
 

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//NOTE: Rapidops features
#if TARGET_OS_IOS
extern NSString* const RPDPushNotifications;
extern NSString* const RPDCrashReporting;
extern NSString* const RPDAutoViewTracking;
#elif TARGET_OS_TV
extern NSString* const RPDAutoViewTracking;
#elif TARGET_OS_OSX
extern NSString* const RPDPushNotifications;
#endif
//NOTE: Disable APM feature until Rapidops Server completely supports it
// extern NSString* const RPDAPM;


//NOTE: Device ID options
#if TARGET_OS_IOS
extern NSString* const RPDIDFV;
extern NSString* const RPDIDFA DEPRECATED_MSG_ATTRIBUTE("Use RPDIDFV instead!");
extern NSString* const RPDOpenUDID DEPRECATED_MSG_ATTRIBUTE("Use RPDIDFV instead!");
#elif TARGET_OS_OSX
extern NSString* const RPDOpenUDID DEPRECATED_MSG_ATTRIBUTE("Use custom device ID instead!");
#endif


//NOTE: Available consents
extern NSString* const RPDConsentSessions;
extern NSString* const RPDConsentEvents;
extern NSString* const RPDConsentUserDetails;
extern NSString* const RPDConsentCrashReporting;
extern NSString* const RPDConsentPushNotifications;
extern NSString* const RPDConsentLocation;
extern NSString* const RPDConsentViewTracking;
extern NSString* const RPDConsentAttribution;
extern NSString* const RPDConsentStarRating;
extern NSString* const RPDConsentAppleWatch;


@interface RapidopsConfig : NSObject

/**
 * County Server's URL without the slash at the end.
 * @discussion e.g. @c https://example.com
 */
@property (nonatomic, copy) NSString* host;

/**
 * Application's App Key found on Rapidops Server's "Management > Applications" section.
 * @discussion Using API Key or App ID will not work.
 */
@property (nonatomic, copy) NSString* appKey;

#pragma mark -

/**
 * For enabling SDK debugging mode which prints internal logs.
 * @discussion If set, SDK will print internal logs to console for debugging. Internal logging works only for Development environment where @c DEBUG flag is set in Build Settings.
 */
@property (nonatomic) BOOL enableDebug;

#pragma mark -

/**
 * For specifying which features Rapidops will start with.
 * @discussion Available features:
 * @discussion @c RPDPushNotifications for push notifications,
 * @discussion @c RPDCrashReporting for crash reporting,
 * @discussion @c RPDAutoViewTracking for auto view tracking and
 * @discussion @c RPDAPM for application performance management.
 */
@property (nonatomic, copy) NSArray* features;

#pragma mark -

/**
 * For limiting features based on user consent.
 * @discussion If set, SDK will wait for explicit consent to be given for features to work.
 */
@property (nonatomic) BOOL requiresConsent;

#pragma mark -

/**
 * For manually marking a device as test device for @c RPDPushNotifications feature.
 * @discussion Test push notifications can be sent to test devices by selecting "Development & test users only" on "Create Push Notification" section on Rapidops Server.
 */
@property (nonatomic) BOOL isTestDevice;

/**
 * For sending push tokens to Rapidops Server even for users who have not granted permission to display notifications.
 * @discussion Push tokens from users who have not granted permission to display notifications, can be used to send silent notifications. But there will be no notification UI for users to interact. This may cause incorrect push notification interaction stats.
 */
@property (nonatomic) BOOL sendPushTokenAlways;

/**
 * For disabling automatically showing of message alerts by @c RPDPushNotifications feature.
 * @discussion If set, push notifications that contain a message or a URL visit request will not show alerts automatically. Push Open event will be recorded automatically, but Push Action event needs to be recorded manually, as well as displaying the message manually.
 */
@property (nonatomic) BOOL doNotShowAlertForNotifications;

/**
 * For handling push notifications for macOS apps on launch.
 * @discussion Needs to be set in @c applicationDidFinishLaunching: method of macOS apps that uses @c RPDPushNotifications feature, in order to handle app launches by push notification click.
 */
@property (nonatomic) NSNotification* launchNotification;

#pragma mark -

/**
 * Location latitude and longitude can be specified as @c CLLocationCoordinate2D struct to be used for geo-location based push notifications and advanced segmentation.
 * @discussion By default, Rapidops Server uses a geo-ip database for acquiring user's location. If the app uses Core Location services and granted permission, a location with better accuracy can be provided using this property.
 * @discussion It will be sent with @c begin_session requests only.
 */
@property (nonatomic) CLLocationCoordinate2D location;

/**
 * City name can be specified as string to be used for geo-location based push notifications and advanced segmentation.
 * @discussion By default, Rapidops Server uses a geo-ip database for acquiring user's location. If the app has information about user's city, it can be provided using this property.
 * @discussion It will be sent with @c begin_session requests only.
 */
@property (nonatomic, copy) NSString* city;

/**
 * ISO country code can be specified in ISO 3166-1 alpha-2 format to be used for geo-location based push notifications and advanced segmentation.
 * @discussion By default, Rapidops Server uses a geo-ip database for acquiring user's location. If the app has information about user's country, it can be provided using this property.
 * @discussion It will be sent with @c begin_session requests only.
 */
@property (nonatomic, copy) NSString* ISOCountryCode;

/**
 * IP address can be specified as string to be used for geo-location based push notifications and advanced segmentation.
 * @discussion By default, Rapidops Server uses a geo-ip database for acquiring user's location, and deduces the IP address from the connection. If the app needs to explicitly specify the IP address due to network requirements, it can be provided using this property.
 * @discussion It will be sent with @c begin_session requests only.
 */
@property (nonatomic, copy) NSString* IP;

#pragma mark -

/**
 * @discussion Custom or system generated device ID. If not set, Identifier For Vendor (IDFV) will be used by default.
 * @discussion Available system generated device ID options:
 * @discussion @c RPDIDFV (Identifier For Vendor)
 * @discussion @c RPDIDFA (Identifier For Advertising)
 * @discussion @c RPDOpenUDID (OpenUDID)
 * @discussion Once set, device ID will be stored persistently (even after app delete and re-install) and will not change even if another device ID is set on start, unless @c forceDeviceIDInitialization flag is set.
 */
@property (nonatomic, copy) NSString* deviceID;


@property (nonatomic, copy) NSString* tenantID;

@property (nonatomic, copy) NSString* userId;

//@property (nonatomic, copy) NSString* visitorID;
//
//@property (nonatomic, copy) NSString* sessionID;


/**
 * For forcing device ID initialization on start.
 * @discussion When it is set, persistently stored device ID will be reset and new device ID will be re-initialized using @c deviceID property on @c RapidopsConfig object. It is meant to be used for debugging purposes only while developing.
 */
@property (nonatomic) BOOL forceDeviceIDInitialization;

/**
 * For applying zero-IDFA fix on queued requests.
 * @discussion If set, all requests in persistently stored request queue will be checked against zero-IDFA issue. If found, they will be fixed by either replacing with IDFV or removing from queue.
 */
@property (nonatomic) BOOL applyZeroIDFAFix;

#pragma mark -

/**
 * Update session period is used for updating sessions and sending queued events to Rapidops Server periodically.
 * @discussion If not set, it will be 60 seconds for @c iOS, @c tvOS & @c macOS, and 20 seconds for @c watchOS by default.
 */
@property (nonatomic) NSTimeInterval updateSessionPeriod;

/**
 * Event send threshold is used for sending queued events to Rapidops Server when number of recorded events reaches to it, without waiting for next update session defined by @c updateSessionPeriod.
 * @discussion If not set, it will be 10 for @c iOS, @c tvOS & @c macOS, and 3 for @c watchOS by default.
 */
@property (nonatomic) NSUInteger eventSendThreshold;

/**
 * Stored requests limit is used for limiting the number of request to be stored on the device, in case Rapidops Server is not reachable.
 * @discussion In case Rapidops Server is down or unreachable for a very long time, queued request may reach excessive numbers, and this may cause problems with requests being sent to Rapidops Server and being stored on the device. To prevent this, SDK will only store requests up to @c storedRequestsLimit.
 * @discussion If number of stored requests reaches @c storedRequestsLimit, SDK will start to drop oldest request while appending the newest one.
 * @discussion If not set, it will be 1000 by default.
 */
@property (nonatomic) NSUInteger storedRequestsLimit;

/**
 * For sending all requests using HTTP POST method.
 * @discussion If set, all requests will be sent using HTTP POST method. Otherwise; only the requests with a file upload or data size more than 2048 bytes will be sent using HTTP POST method.
 */
@property (nonatomic) BOOL alwaysUsePOST;

#pragma mark -

/**
 * For handling sessions manually.
 * @discussion If set, SDK does not handle beginning, updating and ending sessions automatically. Methods @c beginSession, @c updateSession and @c endSession need to be called manually.
 */
@property (nonatomic) BOOL manualSessionHandling;

/**
 * For enabling automatic handling of Apple Watch related features.
 * @discussion If set, Apple Watch related features such as parent device matching, pairing status, and watch app installing status will be handled automatically. Required for using Rapidops on Apple Watch apps.
 */
@property (nonatomic) BOOL enableAppleWatch;

/**
 * For enabling campaign attribution.
 * @discussion If set, IDFA (Identifier For Advertising) will be sent with @c begin_session request, unless user has limited ad tracking.
 */
@property (nonatomic) BOOL enableAttribution;

#pragma mark -

/**
 * For using custom crash segmentation with @c RPDCrashReporting feature.
 */
@property (nonatomic, copy) NSDictionary* crashSegmentation;

/**
 * Crash log limit is used for limiting the number of crash logs to be stored on the device.
 * @discussion If number of stored crash logs reaches @c crashLogLimit, SDK will start to drop oldest crash log while appending the newest one.
 * @discussion If not set, it will be 100 by default.
 */
@property (nonatomic) NSUInteger crashLogLimit;

#pragma mark -

/**
 * For specifying bundled certificates to be used for public key pinning.
 * @discussion Certificates have to be DER encoded with one of the following extensions: @c .der @c .cer or @c .crt
 * @discussion e.g. @c myserver.com.cer
 */
@property (nonatomic, copy) NSArray* pinnedCertificates;

/**
 * Name of the custom HTTP header field to be sent with every request.
 * @discussion e.g. X-My-Secret-Server-Token
 * @discussion If set, every request sent to Rapidops Server will have this custom HTTP header and its value will be @c customHeaderFieldValue property.
 * @discussion If @c customHeaderFieldValue is not set when Rapidops is started, requests will not start until it is set using @c setCustomHeaderFieldValue: method later.
 */
@property (nonatomic, copy) NSString* customHeaderFieldName;

/**
 * Value of the custom HTTP header field to be sent with every request if @c customHeaderFieldName is set.
 * @discussion If not set while @c customHeaderFieldName is set, requests will not start until it is set using @c setCustomHeaderFieldValue: method later.
 */
@property (nonatomic, copy) NSString* customHeaderFieldValue;

/**
 * Salt value to be used for parameter tampering protection.
 * @discussion If set, every request sent to Rapidops Server will have @c checksum256 value generated by SHA256(request + secretSalt)
 */
@property (nonatomic, copy) NSString* secretSalt;

#pragma mark -

/**
 * For customizing star-rating dialog message.
 * @discussion If not set, it will be displayed in English: "How would you rate the app?" or corresponding supported (@c en, @c tr, @c jp, @c zh, @c ru, @c lv, @c cz, @c bn) localized version.
 */
@property (nonatomic, copy) NSString* starRatingMessage;

/**
 * For displaying star-rating dialog depending on session count, once for each new version of the app.
 * @discussion If set, when total number of sessions reaches @c starRatingSessionCount, an alert view asking for 1 to 5 star-rating will be displayed automatically, once for each new version of the app.
 */
@property (nonatomic) NSUInteger starRatingSessionCount;

/**
 * Disables automatically displaying of star-rating dialog for each new version of the app.
 * @discussion If set, star-rating dialog will be displayed automatically only once for the whole life of the app. It will not be displayed for each new version.
 */
@property (nonatomic) BOOL starRatingDisableAskingForEachAppVersion;

/**
 * Completion block to be executed after star-rating dialog is shown automatically.
 * @discussion Completion block has a single NSInteger parameter that indicates 1 to 5 star-rating given by user. If user dismissed dialog without giving a rating, this value will be 0 and it will not be reported to Rapidops Server.
 */
@property (nonatomic, copy) void (^starRatingCompletion)(NSInteger rating);

#pragma mark -

/**
 * For enabling automatic fetching of remote config values.
 * @discussion If set, Remote Config values specified on Rapidops Server will be fetched on beginning of sessions.
 */
@property (nonatomic) BOOL enableRemoteConfig;

/**
 * Completion block to be executed after remote config is fetched from Rapidops Server, on start or device ID change.
 * @discussion This completion block can be used to detect updating of remote config values is completed, either with success or failure.
 * @discussion It has an @c NSError parameter that will be either @ nil or an @c NSError object, depending of request result.
 * @discussion If there is no error, it will be executed with an @c nil, which means latest remote config values are ready to be used.
 * @discussion If Rapidops Server is not reachable or if there is another error, it will be executed with an @c NSError indicating the problem.
 * @discussion If @c enableRemoteConfig flag is not set on initial config, it will never be executed.
 */
@property (nonatomic, copy) void (^remoteConfigCompletionHandler)(NSError * _Nullable error);

NS_ASSUME_NONNULL_END

@end
