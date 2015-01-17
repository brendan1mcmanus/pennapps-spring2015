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


@interface MovesGraph : NSObject
@property (nonatomic, weak) UIImage *im;
-(void) createTheImage;

@end


@implementation MovesGraph


- (void) createTheImage{
    
    UPMove *move;
    [UPMoveAPI getMoveGraphImage:move completion:^(UIImage *image) {
        self.im = image;
    }];
}



@end