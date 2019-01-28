//
//  UILabel+UI.m
//  Personal Cap
//
//  Created by Naveen Muthyala on 1/27/19.
//  Copyright © 2019 Naveen Muthyala. All rights reserved.
//

#import "UILabel+UI.h"

#import "UIColor+Swatch.h"

@implementation UILabel (UI)

+ (UILabel *)createLabel:(NSInteger)numberOfLines
             colorSwatch:(NSString *)colorSwatch
                fontSize:(CGFloat)fontSize {
    UILabel *uiLabel = [[UILabel alloc] init];
    uiLabel.textColor = [UIColor colorFromSwatch:colorSwatch];
    uiLabel.font = [UIFont systemFontOfSize:fontSize];
    uiLabel.textAlignment = NSTextAlignmentJustified;
    uiLabel.adjustsFontSizeToFitWidth = NO;
    uiLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    uiLabel.numberOfLines = numberOfLines; 
    
    return uiLabel;
}

@end
