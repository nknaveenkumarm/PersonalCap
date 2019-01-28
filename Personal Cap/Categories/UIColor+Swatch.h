//
//  UIColor+Swatch.h
//  Personal Cap
//
//  Created by Naveen Muthyala on 1/27/19.
//  Copyright © 2019 Naveen Muthyala. All rights reserved.
//

#import <UIKit/UIKit.h>

#define GRAY_DARKEST             @"GRAY_DARKEST"
#define GRAY_DARKER              @"GRAY_DARKER"
#define GRAY_DARK                @"GRAY_DARK"
#define GRAY                     @"GRAY"
#define GRAY_MILD                @"GRAY_MILD"
#define GRAY_LIGHT               @"GRAY_LIGHT"
#define GRAY_LIGHTER             @"GRAY_LIGHTER"
#define GRAY_LIGHTEST            @"GRAY_LIGHTEST"
#define RED                      @"RED"

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Swatch)

+ (UIColor *)colorFromSwatch:(NSString *)swatch;

@end

NS_ASSUME_NONNULL_END
