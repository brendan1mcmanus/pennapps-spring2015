//
//  MovementGraph.m
//  emoteful
//
//  Created by Brendan McManus on 1/17/15.
//  Copyright (c) 2015 Brendan McManus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UP.h"


@interface MovementGraph : UIViewController
@property (nonatomic, strong) UIImage *im;
@property (weak, nonatomic) IBOutlet UILabel *stepsLabel;
@property (weak, nonatomic) IBOutlet UILabel *suggestionLabel;
@property bool hasImage;
@end


@implementation MovementGraph

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
    
    [UPMoveAPI getMovesWithLimit:1 completion:^(NSArray *results, UPURLResponse *response, NSError *error) {
        if (results.count > 0)
        {
            UPMove *move = results[0];
            
            [UPMoveAPI getMoveGraphImage:move completion:^(UIImage *image) {
                UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
                imageView.frame = CGRectMake(0, 0, 480, 150);
                //[imageView setContentMode:UIViewContentModeScaleAspectFill];
                [scrollView addSubview:imageView];
                self.hasImage = true;
            }];
            NSNumber *f= move.steps;
            int i = [f intValue];
            NSString *label = [NSString stringWithFormat:@"You have taken %@ steps today.", f];
            self.stepsLabel.text = label;
            
            if (i < 5000) {
                self.suggestionLabel.text = @"Try to be more active tomorrow!";
            } else if (i > 5000 && i < 10000) {
                self.suggestionLabel.text = @"Keep up the good work!";
            } else if (i > 10000 && i < 15000) {
                self.suggestionLabel.text = @"Wow you're pretty active – Nice job!";
            } else if (i > 15000) {
                self.suggestionLabel.text = [NSString stringWithFormat:@"WOW! %C", 0xe04f];
            }
        }
    }];
}



@end