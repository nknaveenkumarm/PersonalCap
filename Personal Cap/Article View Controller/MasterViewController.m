//
//  MasterViewController.m
//  Personal Cap
//
//  Created by Naveen Muthyala on 1/27/19.
//  Copyright © 2019 Naveen Muthyala. All rights reserved.
//

#import "MasterViewController.h"
#import "UIColor+Swatch.h"
#import "Apputilities.h"

@interface MasterViewController ()

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavigationbarView];
}

- (void)setupNavigationbarView {
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor colorFromSwatch:GRAY_DARKEST],
       NSFontAttributeName:[UIFont systemFontOfSize:[AppUtilities isIPAD] ? 28: 18]
       }];
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    
    UILayoutGuide * guide = self.view.safeAreaLayoutGuide;
    [self.view.leadingAnchor constraintEqualToAnchor:guide.leadingAnchor].active = YES;
    [self.view.trailingAnchor constraintEqualToAnchor:guide.trailingAnchor].active = YES;
    [self.view.topAnchor constraintEqualToAnchor:guide.topAnchor].active = YES;
    [self.view.bottomAnchor constraintEqualToAnchor:guide.bottomAnchor].active = YES;
}

@end
