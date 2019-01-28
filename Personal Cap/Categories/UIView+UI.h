//
//  UIView+UI.h
//  Personal Cap
//
//  Created by Naveen Muthyala on 1/27/19.
//  Copyright © 2019 Naveen Muthyala. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (UI)

- (void)addViewConstraint:(NSString *)constraintsWithVisualFormatStr
                    views:(NSDictionary<NSString *, id> *)views
                 meterics:(NSDictionary *)meterics;

@end

NS_ASSUME_NONNULL_END
