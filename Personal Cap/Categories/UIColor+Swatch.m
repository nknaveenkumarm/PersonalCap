//
//  UIColor+Swatch.m
//  Personal Cap
//
//  Created by Naveen Muthyala on 1/27/19.
//  Copyright © 2019 Naveen Muthyala. All rights reserved.
//

#import "UIColor+Swatch.h"

@implementation UIColor (Swatch)

+ (UIColor *)colorFromSwatch:(NSString *)swatch {
    NSString *hexValue = [self hexValueFromSwatch:swatch];
    UIColor *color = [UIColor colorFromHex:hexValue];
    
    return color;
    
}

+ (NSString *)hexValueFromSwatch:(NSString *)swatch {
    if([swatch isEqualToString:@"GRAY_DARKEST"]) return @"2D303A";
    if([swatch isEqualToString:@"GRAY_DARKER"]) return @"474A53";
    if([swatch isEqualToString:@"GRAY_DARK"]) return @"6B6D75";
    if([swatch isEqualToString:@"GRAY"]) return @"96979C";
    if([swatch isEqualToString:@"GRAY_MILD"]) return @"B6B7BA";
    if([swatch isEqualToString:@"GRAY_LIGHT"]) return @"D5D6D8";
    if([swatch isEqualToString:@"GRAY_LIGHTER"]) return @"EAEAEB";
    if([swatch isEqualToString:@"GRAY_LIGHTEST"]) return @"F4F4F5";
    if([swatch isEqualToString:@"RED"]) return @"FF6347"; 
    
    return @"2D303A";
}

// Convert a 6-character hex color to a UIColor object - from Erica Sadun
+ (UIColor*)colorFromHex:(NSString *)hexColor {
    
    unsigned int red = 0, green = 0, blue = 0;
    int i_red = 0, i_green = 0, i_blue = 0;
    
    NSRange range;
    
    /* For Hex Strings */
    if ([hexColor length] == 6) {
        range.length = 2;
        
        range.location = 0;
        [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
        range.location = 2;
        [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
        range.location = 4;
        [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
    }
    else if ([hexColor length] == 9) {
        range.length = 3;
        
        range.location = 0;
        [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanInt:&i_red];
        range.location = 3;
        [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanInt:&i_green];
        range.location = 6;
        [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanInt:&i_blue];
        
        red   = (unsigned)i_red;
        green = (unsigned)i_green;
        blue  = (unsigned)i_blue;
    }
    
    
    return [UIColor colorWithRed:(float)(red / 255.0f)
                           green:(float)(green / 255.0f)
                            blue:(float)(blue / 255.0f)
                           alpha:1.0f];
}

@end

