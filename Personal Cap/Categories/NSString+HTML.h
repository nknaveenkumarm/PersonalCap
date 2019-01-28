//
//  NSString+HTML.h
//  Personal Cap
//
//  Created by Naveen Muthyala on 1/27/19.
//  Copyright © 2019 Naveen Muthyala. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (HTML)

+ (BOOL)isNullOrEmptyString:(NSString *)string;
+ (NSString *)escapeCharacters:(NSString *)str;

@end

NS_ASSUME_NONNULL_END
