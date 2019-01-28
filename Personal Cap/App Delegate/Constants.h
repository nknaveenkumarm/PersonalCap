//
//  Constants.h
//  Personal Cap
//
//  Created by Naveen Muthyala on 1/27/19.
//  Copyright © 2019 Naveen Muthyala. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

// RSS urls
#define DATA_URL                                    @"https://www.personalcapital.com/blog/feed/?cat=3,891,890,68,284"
#define LINK_APPEND_PARAMETER                       @"?displayMobileNavigation=0"

// Singleton
#define DS                                          [DataSource sharedDataSource]
#define APP_DELEGATE                                ([(AppDelegate *)[UIApplication sharedApplication].delegate delegate])

//Navigation Title
#define ARTICLE_NAVIGATION_TITLE                    @"Research & Insights"
#define ARTICLE_COLLECTIONVIEW_TITLE                @"Previous Articles"

// Article CollectionView Values
#define COLLECTION_VIEW_ITEM_SIZE                  ([AppUtilities isIPAD] ? CGSizeMake(300.0, 300.0) : CGSizeMake(185.0, 185.0))
#define COLLECTION_VIEW_EDGE_INSETS                ([AppUtilities isIPAD] ? UIEdgeInsetsMake(5, 25, 25, 25) : UIEdgeInsetsMake(-15, 10, 20, 10))  // top, left, bottom, right

#define TITLE_FONT_SIZE                            [AppUtilities isIPAD] ? 24.0 : 16.0
#define DESCRIPTION_FONT_SIZE                      [AppUtilities isIPAD] ? 18.0 : 12.0

#endif /* Constants_h */ 
