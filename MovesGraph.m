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


@interface MovesGraph : UIViewController
@property (nonatomic, strong) UIImage *im;
-(void) createTheImage;

@end


@implementation MovesGraph

- (void)viewDidAppear:(BOOL)animated {
    CGSize size = [[UIScreen mainScreen] bounds].size;
    CGFloat frameX = size.width;
    CGFloat frameY = size.height-30; //padding for UIpageControl
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, self.view.frame.size.height)];

    scrollView.pagingEnabled = YES;
    
    scrollView.backgroundColor = [UIColor clearColor];
    scrollView.contentSize = CGSizeMake(frameX, frameY);
    
    
    [self.view addSubview: scrollView];
    scrollView.scrollEnabled = YES;
    
    
    [UPMoveAPI getMovesWithLimit:1 completion:^(NSArray *results, UPURLResponse *response, NSError *error) {
        if (results.count > 0)
        {
            UPMove *move = results[0];
            
            [UPMoveAPI getMoveGraphImage:move completion:^(UIImage *image) {
                UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
                imageView.frame = CGRectMake(0, 0, 480, 120);
                //[imageView setContentMode:UIViewContentModeScaleAspectFill];
                [scrollView addSubview:imageView];
            }];
        }
    }];
    
}

- (void) createTheImage{
    [UPMoveAPI getMovesWithLimit:10U completion:^(NSArray *moves, UPURLResponse *response, NSError *error) {
        for (UPMove *move in moves) {
            NSLog(move.steps);
        }
    }];
}



@end