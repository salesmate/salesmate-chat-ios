//
//  ViewController.m
//  Sample-ObjC
//
//  Created by Vishal Nandoriya on 27/07/22.
//

#import "ViewController.h"
#import <SalesmateChatSDK/SalesmateChatSDK.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self setVerifiedId];
}

- (void)setVerifiedId {
    if ([SalesmateChat getVisitorId].length != 0) {
        [SalesmateChat setVerifiedID: [SalesmateChat getVisitorId]];
    }
}

//MARK: - IBActions
- (IBAction)presentMessenger:(id)sender {
    [SalesmateChat presentMessengerFrom: self];
}

- (IBAction)logEvent:(id)sender {
    NSString *eventName = @"Testing Event";
    NSString *key = @"testEventKey";
    NSString *value = @"testEventValue";
    
    [SalesmateChat logEventWithEventName: eventName withData: @{key: value}];
    
    [self showAlertWithTitle: @"Event Queued for delivery" withMessage: @""];

}

- (IBAction)loginPressed:(id)sender {
    [self userLogin];
}

- (IBAction)updatePressed:(id)sender {
    
    /// Update
    /*[SalesmateChat updateWithUserId:"" email:"" firstName:"" lastName:"" completion:^(NSString * _Nullable, NSError * _Nullable) { }]*/
}

- (IBAction)logout:(id)sender {
    [SalesmateChat logout];
    [self showAlertWithTitle: @"Salesmate Chat" withMessage: @"Logout Success"];
}

- (void)userLogin {
    NSString  *userId = [self randomFakeUserId];
    NSString *email = [self randomFakeEmail];
    NSString *firstName = [self randomFakeFirstName];
    NSString *lastName = [self randomFakeLastName];
    
    [SalesmateChat loginWithUserId: userId email: email firstName: firstName lastName: lastName completion: ^(NSString *success, NSError *error) {
        if (error == nil) {
            __weak typeof(self) weakSelf = self;
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf showAlertWithTitle: @"Salesmate Chat" withMessage: @"Login Success"];
            });
        }
    }];

}

- (NSString *)randomFakeUserId {
    NSArray *userIdList = @[@"Henry123", @"William234", @"Geoffrey345", @"Jim456", @"Yvonne567", @"Jamie678", @"Leticia789", @"Priscilla890", @"Sidney012", @"Nancy109", @"Edmund298", @"Bill376", @"Megan037"];
    
    return  [userIdList objectAtIndex: arc4random_uniform(12)];
}

- (NSString *)randomFakeEmail {
    NSArray *emailList = @[@"Henry@test.com", @"William@test.com", @"Geoffrey@test.com", @"Jim@test.com", @"Yvonne@test.com", @"Jamie@test.com", @"Leticia@test.com", @"Priscilla@test.com", @"Sidney@test.com", @"Nancy@test.com", @"Edmund@test.com", @"Bill@test.com", @"Megan@test.com"];
    
    return  [emailList objectAtIndex: arc4random_uniform(12)];

}

- (NSString *)randomFakeFirstName {
    NSArray *firstNameList = @[@"Henry", @"William", @"Geoffrey", @"Jim", @"Yvonne", @"Jamie", @"Leticia", @"Priscilla", @"Sidney", @"Nancy", @"Edmund", @"Bill", @"Megan"];
    
    return  [firstNameList objectAtIndex: arc4random_uniform(12)];

}

- (NSString *)randomFakeLastName {
    NSArray *lastNameList = @[@"Pearson", @"Adams", @"Cole", @"Francis", @"Andrews", @"Casey", @"Gross", @"Lane", @"Thomas", @"Patrick", @"Strickland", @"Nicolas", @"Freeman"];
    
    return  [lastNameList objectAtIndex: arc4random_uniform(12)];

}

- (void)showAlertWithTitle:(NSString *)title withMessage: (NSString *)message {
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle: title
                               message: message
                               preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action) {}];

    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
