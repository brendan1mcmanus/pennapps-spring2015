//
//  JBViewController.m
//

#import "JBLandingViewController.h"
#import "UP.h"

NSString *const kAPIExplorerID = @"pHekFTFd7qA";
NSString *const kAPIExplorerSecret = @"93ff020364207ebe820c4215c8f3a694b1b4ff63";

@interface JBLandingViewController ()

@property (nonatomic, weak) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation JBLandingViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
	
	self.loginButton.enabled = NO;
	self.statusLabel.text = @"Validating Session";
	
    [UPPlatform sharedPlatform].enableNetworkLogging = YES;
	[[UPPlatform sharedPlatform] validateSessionWithCompletion:^(UPSession *session, NSError *error) {
		
		self.loginButton.enabled = YES;
		self.statusLabel.text = @"";
		
		if (session != nil)
		{
            NSLog(@"Continued session for %@ %@", session.currentUser.firstName, session.currentUser.lastName);
			[self performSegueWithIdentifier:@"LoggedIn" sender:nil];
		}
	}];
}

- (IBAction)login:(id)sender
{
	self.loginButton.enabled = NO;
	self.statusLabel.text = @"Authenticating";
	
    
	// Show the login screen
	[[UPPlatform sharedPlatform] startSessionWithClientID:kAPIExplorerID clientSecret:kAPIExplorerSecret authScope:UPPlatformAuthScopeAll completion:^(UPSession *session, NSError *error) {
        NSLog(@"Hi");
		self.loginButton.enabled = YES;
		self.statusLabel.text = @"";
		
		if (session != nil)
		{
            NSLog(@"Started session for %@ %@", session.currentUser.firstName, session.currentUser.lastName);
			[self performSegueWithIdentifier:@"LoggedIn" sender:nil];
		}
		else
		{
			[[[UIAlertView alloc] initWithTitle:@"Error" message:error.localizedDescription delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
		}
	}];
}

@end
