//
//  UIView+UI.m
//  Personal Cap
//
//  Created by Naveen Muthyala on 1/27/19.
//  Copyright © 2019 Naveen Muthyala. All rights reserved.
//

#import "UIView+UI.h"

@implementation UIView (UI)

- (void)addViewConstraint:(NSString *)constraintsWithVisualFormatStr
                    views:(NSDictionary<NSString *, id> *)views
                 meterics:(NSDictionary *)meterics {
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat:constraintsWithVisualFormatStr
                          options:0
                          metrics:meterics
                          views:views]]; 
}

@end
