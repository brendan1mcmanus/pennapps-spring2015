//
//  HUViewController.h
//  HelloUP
//
//  Created by Shadow on 11/15/13.
//  Copyright (c) 2013 Jawbone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HUViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *loginLabel;
- (IBAction)didTapLogin:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIButton *dailyButton;
@property (weak, nonatomic) IBOutlet UIButton *weeklyButton;
@property (weak, nonatomic) IBOutlet UIButton *monthlyButton;

- (IBAction)dailyButtonPressed:(id)sender;
- (IBAction)weeklyButtonPressed:(id)sender;
- (IBAction)monthlyButtonPressed:(id)sender;



@end
