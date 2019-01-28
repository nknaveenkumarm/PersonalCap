//
//  ArticleWebViewController.m
//  Personal Cap
//
//  Created by Naveen Muthyala on 1/27/19.
//  Copyright © 2019 Naveen Muthyala. All rights reserved.
//

#import "ArticleWebViewController.h"
#import "UIView+UI.h"
#import "UILabel+UI.h"
#import "UIColor+Swatch.h"

@interface ArticleWebViewController () 

@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicatorView;

@property (nonatomic, strong) NSString *webUrl;
@property (nonatomic, strong) NSString *articleTitle;

@end

@implementation ArticleWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = _articleTitle;
    [self loadWebView];
}

- (void)setupWebView:(NSString *)webUrl articleTitle:(NSString *)articleTitle {
    _webUrl = webUrl;
    _articleTitle = articleTitle;
    [self loadLoadingView];

}

- (void)loadWebView {
    WKWebViewConfiguration *webConfiguration = [[WKWebViewConfiguration alloc] init];
    _webView = [[WKWebView alloc] initWithFrame:CGRectZero configuration:webConfiguration];
    _webView.UIDelegate = self;
    _webView.navigationDelegate = self;
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[[NSURL alloc] initWithString:_webUrl]];
    [_webView loadRequest:request];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:_webView];
    [_webView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIView *webView = _webView;
    NSDictionary *meterics = @{};
    NSDictionary* variableBindings = NSDictionaryOfVariableBindings(webView);
    [self.view addViewConstraint:@"V:|-[webView]-|"
                           views:variableBindings  meterics:meterics];
    [self.view addViewConstraint:@"H:|-[webView]-|"
                           views:variableBindings
                        meterics:meterics];
}

#pragma mark - WKNavigationDelegate delegate methods

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    [self showActivity:NO];
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    [self showActivity:YES];
}

- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    [self showActivity:NO];
}

#pragma mark - Loading View methods

- (void)loadLoadingView {
    _activityIndicatorView = [[UIActivityIndicatorView alloc] init];
    _activityIndicatorView.center = self.view.center;
    _activityIndicatorView.hidesWhenStopped = YES;
    [_activityIndicatorView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    
    [self.view addSubview:_activityIndicatorView];
    [_activityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSDictionary *meterics = @{};
    NSDictionary* variableBindings = NSDictionaryOfVariableBindings(_activityIndicatorView);
    [self.view addViewConstraint:@"V:|-[_activityIndicatorView]-|"
                           views:variableBindings  meterics:meterics];
    [self.view addViewConstraint:@"H:|-[_activityIndicatorView]-|"
                           views:variableBindings
                        meterics:meterics];
}

- (void)showActivity:(BOOL)show {
    show ? [_activityIndicatorView startAnimating] : [_activityIndicatorView stopAnimating];
}


@end
