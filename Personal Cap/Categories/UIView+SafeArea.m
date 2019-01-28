//
//  UIView+SafeArea.m
//  Personal Cap
//
//  Created by Naveen Muthyala on 1/27/19.
//  Copyright © 2019 Naveen Muthyala. All rights reserved.
//

#import "UIView+SafeArea.h"

@implementation UIView (SafeArea) 

- (NSLayoutAnchor *)safeLeadingAnchor {
    
    if (@available(iOS 11.0, *)) {
        return self.safeAreaLayoutGuide.leadingAnchor;
    } else {
        return self.leadingAnchor;
    }
    
}

- (NSLayoutAnchor *)safeTrailingAnchor {
    
    if (@available(iOS 11.0, *)) {
        return self.safeAreaLayoutGuide.trailingAnchor;
    } else {
        return self.trailingAnchor;
    }
    
}

- (NSLayoutAnchor *)safeTopAnchor {
    
    if (@available(iOS 11.0, *)){
        return self.safeAreaLayoutGuide.topAnchor;
    } else {
        return self.topAnchor;
    }
    
}

- (NSLayoutAnchor *)safeBottomAnchor {
    
    if (@available(iOS 11.0, *)) {
        return self.safeAreaLayoutGuide.bottomAnchor;
    } else {
        return self.bottomAnchor;
    }
    
}

@end
