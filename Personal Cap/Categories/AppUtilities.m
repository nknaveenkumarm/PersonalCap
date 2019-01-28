//
//  AppUtilities.m
//  Personal Cap
//
//  Created by Naveen Muthyala on 1/27/19.
//  Copyright © 2019 Naveen Muthyala. All rights reserved.
//

#import "AppUtilities.h"

@implementation AppUtilities

+ (BOOL)isIPAD {
    return ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad);
}

@end 
