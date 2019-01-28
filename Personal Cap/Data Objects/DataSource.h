//
//  DataSource.h
//  Personal Cap
//
//  Created by Naveen Muthyala on 1/27/19.
//  Copyright © 2019 Naveen Muthyala. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "ArticleVO.h"

typedef void(^CompletionHandler)(UIImage *image);
typedef void(^DataCompletionHandler)(NSArray *items);

NS_ASSUME_NONNULL_BEGIN

@interface DataSource : NSObject

+ (DataSource *)sharedDataSource;
- (NSArray *)parseData:(DataCompletionHandler)completionHandler;
- (void)getImage:(ArticleVO *)articleVO completionHandler:(CompletionHandler)completionHandler; 

@end

NS_ASSUME_NONNULL_END
