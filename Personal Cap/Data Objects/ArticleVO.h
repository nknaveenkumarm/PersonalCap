//
//  ArticleVO.h
//  Personal Cap
//
//  Created by Naveen Muthyala on 1/27/19.
//  Copyright © 2019 Naveen Muthyala. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ArticleVO : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *articalDescription;
@property (nonatomic, strong) NSString *comments;
@property (nonatomic, strong) NSString *media;
@property (nonatomic, strong) NSString *pubDate;
@property (nonatomic, strong) NSString *link;   

@end

NS_ASSUME_NONNULL_END
