//
//  JawboneFunction.m
//  emoteful
//
//  Created by Brendan McManus on 1/16/15.
//  Copyright (c) 2015 Brendan McManus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UPPlatformSDK/UPPlatformSDK.h>
#import <UIKit/UIKit.h>
#import "JawboneFunction.h"

NSString *const kAPIExplorerID = @"02Z1p-jM0AI";
NSString *const kAPIExplorerSecret = @"cb74fe51ba74ffc68343e33a067d1a542399d98f";


@implementation JawboneFunction
- (void) method {
    // Present login screen in a UIWebView.
    [[UPPlatform sharedPlatform] startSessionWithClientID:kAPIExplorerID
                                             clientSecret:kAPIExplorerSecret
                                                authScope:UPPlatformAuthScopeAll
                                               completion:^(UPSession *session, NSError *error) {
                                                   
                                                   if (session != nil) {
                                                       //[self performSegueWithIdentifier:@"LoggedIn" sender:nil];
                                                       [self testDateRangeCall];
                                                   } else {
                                                       [[[UIAlertView alloc] initWithTitle:@"Error"
                                                                                   message:error.localizedDescription
                                                                                  delegate:nil
                                                                         cancelButtonTitle:@"OK"
                                                                         otherButtonTitles:nil] show];
                                                   }
                                               }];
}

- (void)testDateRangeCall {
    
    NSLog(@"start: %@; end: %@", self.startingDate, [NSDate date]);
    
    [UPMoveAPI getMovesFromStartDate:self.startingDate toEndDate:[NSDate date] completion:^(NSArray *results, UPURLResponse *response, NSError *error) {
        
        NSLog(@"Any error: %@", error);
        NSLog(@"This came back in 'Results': \n\n%@", results);
    }];
}
@end
