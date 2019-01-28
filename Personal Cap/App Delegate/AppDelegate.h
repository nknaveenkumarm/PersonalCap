//
//  AppDelegate.h
//  Personal Cap
//
//  Created by Naveen Muthyala on 1/27/19.
//  Copyright © 2019 Naveen Muthyala. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) AppDelegate *delegate;

@property (nonatomic, strong) NSOperationQueue *concurrentRequestQueue;
@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

