//
//  UIView+SafeArea.h
//  Personal Cap
//
//  Created by Naveen Muthyala on 1/27/19.
//  Copyright © 2019 Naveen Muthyala. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (SafeArea)

- (NSLayoutAnchor *)safeLeadingAnchor;
- (NSLayoutAnchor *)safeTrailingAnchor;
- (NSLayoutAnchor *)safeTopAnchor;
- (NSLayoutAnchor *)safeBottomAnchor;

@end

NS_ASSUME_NONNULL_END
