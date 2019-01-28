//
//  UILabel+UI.h
//  Personal Cap
//
//  Created by Naveen Muthyala on 1/27/19.
//  Copyright © 2019 Naveen Muthyala. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (UI)

+ (UILabel *)createLabel:(NSInteger)numberOfLines
             colorSwatch:(NSString *)colorSwatch
                fontSize:(CGFloat)fontSize;

@end

NS_ASSUME_NONNULL_END
