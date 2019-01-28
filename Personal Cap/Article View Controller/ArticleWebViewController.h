//
//  ArticleWebViewController.h
//  Personal Cap
//
//  Created by Naveen Muthyala on 1/27/19.
//  Copyright © 2019 Naveen Muthyala. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "MasterViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ArticleWebViewController : MasterViewController <WKUIDelegate, WKNavigationDelegate>

- (void)setupWebView:(NSString *)webUrl articleTitle:(NSString *)articleTitle; 

@end

NS_ASSUME_NONNULL_END
