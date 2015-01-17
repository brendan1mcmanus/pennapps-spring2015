#import "HUViewController.h"
#import <UPPlatformSDK/UPPlatformSDK.h>

// OAuth keys.
NSString *const kAPIExplorerID = @"02Z1p-jM0AI";
NSString *const kAPIExplorerSecret = @"cb74fe51ba74ffc68343e33a067d1a542399d98f";

@interface HUViewController ()

@property (strong, nonatomic) NSDate *startingDate;

@end

@implementation HUViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Give us a detailed network activity overview.
//    [UPPlatform sharedPlatform].enableNetworkLogging = YES;
    
    // Check if we have an outstanding session.
    [[UPPlatform sharedPlatform] validateSessionWithCompletion:^(UPSession *session, NSError *error) {
		if (session != nil) {
//			[self performSegueWithIdentifier:@"LoggedIn" sender:nil];
            [self.loginLabel setTitle:@"(Already logged in)" forState:UIControlStateNormal];
		}
	}];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)didTapLogin:(UIButton *)sender {
    
    sender.enabled = NO;
	
	// Present login screen in a UIWebView.
	[[UPPlatform sharedPlatform] startSessionWithClientID:kAPIExplorerID
                                             clientSecret:kAPIExplorerSecret
                                                authScope:UPPlatformAuthScopeAll
                                               completion:^(UPSession *session, NSError *error) {
		
                                                   sender.enabled = YES;
		
                                                   if (session != nil) {
//                                                       [self performSegueWithIdentifier:@"LoggedIn" sender:nil];
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
         
- (IBAction)dailyButtonPressed:(id)sender {
    
    NSDate *today = [NSDate date];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *dateComponents = [gregorian components:(NSDayCalendarUnit | NSWeekCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit) fromDate:today];
    [dateComponents setDay:[dateComponents day]];
    self.startingDate = [gregorian dateFromComponents:dateComponents];
    
    [self testDateRangeCall];
}

- (IBAction)weeklyButtonPressed:(id)sender {
    
    NSDate *now = [NSDate date];
    self.startingDate = [now dateByAddingTimeInterval:-7*24*60*60];

    [self testDateRangeCall];
}

- (IBAction)monthlyButtonPressed:(id)sender {
    NSDate *today = [NSDate date];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *dateComponents = [gregorian components:(NSDayCalendarUnit | NSWeekCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit) fromDate:today];
    [dateComponents setMonth:[dateComponents month] - 1];
    self.startingDate = [gregorian dateFromComponents:dateComponents];
    
    [self testDateRangeCall];
}
@end
