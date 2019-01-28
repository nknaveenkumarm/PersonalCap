//
//  NSString+HTML.m
//  Personal Cap
//
//  Created by Naveen Muthyala on 1/27/19.
//  Copyright © 2019 Naveen Muthyala. All rights reserved.
//

#import "NSString+HTML.h"

@implementation NSString (HTML)

+ (BOOL)isNullOrEmptyString:(NSString *)string {
    return (string == nil || [string length] == 0);
}

+ (NSString *)escapeCharacters:(NSString *)str {
    NSString *resultString = @"";
    resultString = [str stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    resultString = [resultString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    return resultString; 
}

@end
