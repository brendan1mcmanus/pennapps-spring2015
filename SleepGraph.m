//
//  MovesGraph.m
//  emoteful
//
//  Created by Brendan McManus on 1/17/15.
//  Copyright (c) 2015 Brendan McManus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UP.h"


@interface SleepGraph : UIViewController
@property (nonatomic, strong) UIImage *im;
@property (weak, nonatomic) IBOutlet UILabel *sleepLabel;
@property (weak, nonatomic) IBOutlet UILabel *suggestionLabel;

@property bool hasImage;

@end


@implementation SleepGraph

- (void)viewDidAppear:(BOOL)animated {
    CGSize size = [[UIScreen mainScreen] bounds].size;
    CGFloat frameX = size.width;
    CGFloat frameY = size.height-30; //padding for UIpageControl
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, self.view.frame.size.height)];
    
    scrollView.pagingEnabled = YES;
    
    scrollView.backgroundColor = [UIColor clearColor];
    scrollView.contentSize = CGSizeMake(frameX, frameY);
    
    
    [self.view addSubview: scrollView];
    scrollView.scrollEnabled = NO;
    self.hasImage = false;
    
    if (self.hasImage == false) {
        [UPSleepAPI getSleepsWithLimit:1 completion:^(NSArray *results, UPURLResponse *response, NSError *error) {
            if (results.count > 0)
            {
                UPSleep *sleep = results[0];
                [UPSleepAPI getSleepGraphImage:sleep completion:^(UIImage *image) {
                    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
                    imageView.frame = CGRectMake(0, 0, 480, 150);
                    [scrollView addSubview:imageView];
                    self.hasImage = true;
                    
                }];
            }
            UPSleep *s = results[0];
            NSNumber *timeAsleep = s.totalTime;
            double f = [timeAsleep doubleValue] / 3600;
            NSString *label = [NSString stringWithFormat:@"You slept for %.02f hours last night.", f];
            
            self.sleepLabel.text = label;
            
            if (f > 6.5 && f < 8) {
                self.suggestionLabel.text = @"Nice job!";
            } else if (f < 6.5 && f > 4) {
                self.suggestionLabel.text = @"Not the worst, but I know you can do better!";
            } else if (f > 8) {
                self.suggestionLabel.text = [NSString stringWithFormat:@"WOW! %C", 0xe04f];
            } else if (f < 4) {
                self.suggestionLabel.text = @"You really need to sleep more!";
            }
        }];
    }
    
}

@end