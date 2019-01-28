//
//  DataSource.m
//  Personal Cap
//
//  Created by Naveen Muthyala on 1/27/19.
//  Copyright © 2019 Naveen Muthyala. All rights reserved.
//

#import "DataSource.h"

#import "XMLParser.h"
#import "Constants.h"
#import "AppDelegate.h"

#define RSS_KEY                     @"rss"
#define CHANNEL_KEY                 @"channel"
#define ITEM_KEY                    @"item"
#define TITLE_KEY                   @"title"
#define DESCRIPTION_KEY             @"description"
#define COMMENTS_KEY                @"comments"
#define MEDIA_KEY                   @"media:content"
#define PUBDATE_KEY                 @"pubDate"
#define LINK_KEY                    @"link"
#define TEXT_KEY                    @"text"
#define URL_KEY                     @"url" 

@implementation DataSource

static dispatch_once_t pred;
+ (DataSource *)sharedDataSource {
    static DataSource *shared = nil;
    dispatch_once(&pred, ^{
        shared = [[DataSource alloc] init];
    });
    return shared;
}

- (NSArray *)parseData:(DataCompletionHandler)completionHandler {
    NSError *error;
    NSString *XML = [NSString stringWithContentsOfURL:[NSURL URLWithString:DATA_URL] encoding:NSASCIIStringEncoding error:&error];
    NSDictionary *dict = [XMLParser dictionaryForXMLString:XML error:&error];
    
    NSDictionary *rssDict = [dict objectForKey:RSS_KEY];
    NSDictionary *channelDict = [rssDict objectForKey:CHANNEL_KEY];
    NSArray *itemArray = [channelDict objectForKey:ITEM_KEY];
    
    NSMutableArray *items = [[NSMutableArray alloc] initWithCapacity:1];
    for (NSDictionary *itemDict in itemArray) {
        ArticleVO *articleVO = [[ArticleVO alloc] init];
        
        articleVO.title = [[itemDict objectForKey:TITLE_KEY] objectForKey:TEXT_KEY];
        articleVO.articalDescription = [[itemDict objectForKey:DESCRIPTION_KEY] objectForKey:TEXT_KEY];
        articleVO.comments = [[itemDict objectForKey:COMMENTS_KEY] objectForKey:TEXT_KEY];
        articleVO.media = [[itemDict objectForKey:MEDIA_KEY] objectForKey:URL_KEY];
        articleVO.pubDate = [[itemDict objectForKey:PUBDATE_KEY] objectForKey:TEXT_KEY];
        articleVO.link = [[itemDict objectForKey:LINK_KEY] objectForKey:TEXT_KEY];
        
        [items addObject:articleVO];
    }
    
    completionHandler(items); 

    
    return items;
}

- (void)getImage:(ArticleVO *)articleVO completionHandler:(CompletionHandler)completionHandler {
    NSString * documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    __block UIImage *articalImage = [DS loadImageID:articleVO.pubDate inDirectory:documentsDirectory];
    
    if(articalImage == nil) {
        [APP_DELEGATE.concurrentRequestQueue addOperationWithBlock:^{
            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:articleVO.media]];
            NSURLSession *nsurlSession = [NSURLSession sharedSession];
            NSURLSessionDataTask *dataTask = [nsurlSession dataTaskWithRequest:request
                                                             completionHandler:
                                              ^(NSData *data, NSURLResponse *response, NSError *error) {
                                                  if ( !error )
                                                  {
                                                      articalImage = [UIImage imageWithData:data];
                                                      [DS saveImage:[UIImage imageWithData:data]
                                                            pubDate:articleVO.pubDate
                                                        inDirectory:documentsDirectory];
                                                      completionHandler(articalImage);
                                                      
                                                  } else {
                                                      NSLog(@"error loading image %@ - %@", error, articleVO.title);
                                                  }
                                              }];
            
            [dataTask resume];
        }];
    }
    completionHandler(articalImage); 
    
}

- (void)saveImage:(UIImage *)image pubDate:(NSString *)pubDate inDirectory:(NSString *)directoryPath {
    NSString *path = [NSString stringWithFormat:@"%@/%@", directoryPath, pubDate];
    [UIImagePNGRepresentation(image) writeToFile:path options:NSAtomicWrite error:nil];
}

- (UIImage *)loadImageID:(NSString *)pubDate inDirectory:(NSString *)directoryPath {
    UIImage * result = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@", directoryPath, pubDate]];
    return result;
}

@end
