//
//  ArticleViewController.m
//  Personal Cap
//
//  Created by Naveen Muthyala on 1/27/19.
//  Copyright © 2019 Naveen Muthyala. All rights reserved.
//

#import "ArticleViewController.h"

#import "ArticleVO.h"
#import "NSString+HTML.h"
#import "UIColor+Swatch.h"
#import "Constants.h"
#import "DataSource.h"
#import "UILabel+UI.h"
#import "UIView+UI.h"
#import "AppUtilities.h"
#import "ArticleWebViewController.h"
#import "UIView+SafeArea.h"
#import "AppDelegate.h"

@interface ArticleCollectionCell : UICollectionViewCell

@property (strong, nonatomic) UIImageView *articleImageView;
@property (strong, nonatomic) UILabel *articleTitleLabel;

- (void)setupView:(ArticleVO *)articleVO;

@end

@implementation ArticleCollectionCell

#pragma mark - ArticleCollectionCell init

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _articleTitleLabel = [UILabel createLabel:2 colorSwatch:GRAY_DARK fontSize:DESCRIPTION_FONT_SIZE];
        _articleTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_articleTitleLabel];
        
        _articleImageView = [[UIImageView alloc] init];
        _articleImageView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_articleImageView];
        
        NSDictionary *meterics = @{};
        NSDictionary* variableBindings = NSDictionaryOfVariableBindings(_articleTitleLabel, _articleImageView);
        [self addViewConstraint:@"V:|-[_articleImageView]-4-[_articleTitleLabel(35)]-|"
                          views:variableBindings
                       meterics:meterics];
        [self addViewConstraint:@"H:|-8-[_articleTitleLabel]-8-|"
                          views:variableBindings
                       meterics:meterics];
        [self addViewConstraint:@"H:|-0-[_articleImageView]-0-|"
                          views:variableBindings
                       meterics:meterics];
        
    }
    return self;
}

#pragma mark - ArticleCollectionCell setupView

- (void)setupView:(ArticleVO *)articleVO {
    _articleTitleLabel.text = [NSString escapeCharacters:articleVO.title];
    [DS getImage:articleVO completionHandler:^(UIImage *image) {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.articleImageView.image = image;
            self.layer.backgroundColor = [UIColor whiteColor].CGColor;

        }];
    }];

}

@end

@interface ArticleViewController ()

@property (nonatomic, strong) UIView *topStackView;
@property (nonatomic, strong) UIView *bottomStackView;
@property (nonatomic, strong) UIView *separatorView;

@property (nonatomic, strong) UIImageView *articleImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *descriptionLabel;

@property (nonatomic, strong) UICollectionView *articleCollectionView;

@property (nonatomic, strong) NSArray *articalArray;
@property (nonatomic, strong) ArticleVO *firstArticleVO;

@end

@implementation ArticleViewController

#pragma mark - ViewDidload

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = ARTICLE_NAVIGATION_TITLE;

    [self getArticleData];
    [self setUpViews];
    [self addRightNavItems];
}

- (void)addSafeAreaConstraints {
    [NSLayoutConstraint activateConstraints:@[
                                              [[self.view safeTrailingAnchor] constraintEqualToAnchor:_topStackView.trailingAnchor],
                                              [[self.view safeLeadingAnchor] constraintEqualToAnchor:_topStackView.leadingAnchor],
                                              [[self.view safeTopAnchor] constraintEqualToAnchor:_topStackView.topAnchor],
                                              [[self.view safeBottomAnchor] constraintEqualToAnchor:_topStackView.bottomAnchor],
                                              ]];
    [self.view layoutIfNeeded];
}

- (void)setUpViews {
    _topStackView = [[UIView alloc] init];
    _bottomStackView = [[UIView alloc] init];
    
    [self.view addSubview:_topStackView];
    [self.view addSubview:_bottomStackView];

    [_topStackView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_bottomStackView setTranslatesAutoresizingMaskIntoConstraints:NO];

    UIView *topStackView = _topStackView;
    UIView *bottomStackView = _bottomStackView;

    NSDictionary* variableBindings = NSDictionaryOfVariableBindings(topStackView, bottomStackView);
    NSDictionary *meterics = @{};
    [self.view addViewConstraint:@"V:|-[topStackView]-4-[bottomStackView]-|"
                           views:variableBindings  meterics:meterics];
    [self.view addViewConstraint:@"H:|-0-[topStackView]-0-|"
                           views:variableBindings
                        meterics:meterics];
    [self.view addViewConstraint:@"H:|-4-[bottomStackView]-4-|"
                           views:variableBindings
                        meterics:meterics];
    NSLayoutConstraint *nsLayoutConstraint = [NSLayoutConstraint
                                              constraintWithItem:topStackView
                                              attribute:NSLayoutAttributeHeight
                                              relatedBy:NSLayoutRelationEqual
                                              toItem:self.view
                                              attribute:NSLayoutAttributeHeight
                                              multiplier:0.35
                                              constant:0.0];
    [self.view addConstraint:nsLayoutConstraint];
    
    [self addTopView];
    [self addBottomView];
}

#pragma mark - Top & Bottom views

- (void)addTopView {
    _articleImageView = [[UIImageView alloc] init];
    _titleLabel = [UILabel createLabel:1 colorSwatch:GRAY_DARKEST fontSize:TITLE_FONT_SIZE];
    _descriptionLabel = [UILabel createLabel:2 colorSwatch:GRAY_DARK fontSize:DESCRIPTION_FONT_SIZE];
    
    _articleImageView.backgroundColor = [UIColor colorFromSwatch:GRAY_LIGHTEST];
    _titleLabel.backgroundColor = [UIColor colorFromSwatch:GRAY_LIGHTEST];
    _descriptionLabel.backgroundColor = [UIColor colorFromSwatch:GRAY_LIGHTEST];

    _separatorView = [[UIView alloc] init];
    _separatorView.layer.backgroundColor = [UIColor colorFromSwatch:GRAY_LIGHT].CGColor;
    
    [self.topStackView addSubview:_articleImageView];
    [self.topStackView addSubview:_titleLabel];
    [self.topStackView addSubview:_descriptionLabel];
    [self.topStackView addSubview:_separatorView];

    [_articleImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_titleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_descriptionLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_separatorView setTranslatesAutoresizingMaskIntoConstraints:NO];

    NSDictionary* variableBindings = NSDictionaryOfVariableBindings(_articleImageView, _titleLabel, _descriptionLabel, _separatorView);
    NSDictionary *meterics = @{ @"titleOffsetX": ([AppUtilities isIPAD] ? @24 : @8),
                                @"descriptionOffsetX": ([AppUtilities isIPAD] ? @28 : @12)
                                };
    
    
    [self.view addViewConstraint:@"H:|-2-[_separatorView]-2-|"
                           views:variableBindings
                        meterics:meterics];
    [self.view addViewConstraint:@"H:|[_articleImageView]|"
                           views:variableBindings
                        meterics:meterics];
    [self.view addViewConstraint:@"H:|-titleOffsetX-[_titleLabel]-titleOffsetX-|"
                           views:variableBindings
                        meterics:meterics];
    [self.view addViewConstraint:@"H:|-descriptionOffsetX-[_descriptionLabel]-descriptionOffsetX-|"
                           views:variableBindings
                        meterics:meterics];
    [self.view addViewConstraint:@"V:|-0-[_articleImageView]-8-[_titleLabel(25)]-2-[_descriptionLabel(40)]-8-[_separatorView(1)]-|"
                           views:variableBindings
                        meterics:meterics];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showFirstArticleWebView:)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tapGestureRecognizer];

}

- (void)addBottomView {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 0.0;
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flowLayout setHeaderReferenceSize:CGSizeMake(320, 50)];
    
    _articleCollectionView = [[UICollectionView alloc]
                                               initWithFrame:CGRectMake(0.0,
                                                                        0.0,
                                                                        _bottomStackView.frame.size.width,
                                                                        _bottomStackView.frame.size.height) collectionViewLayout:flowLayout];
    _articleCollectionView.dataSource = self;
    _articleCollectionView.delegate = self;
    _articleCollectionView.backgroundColor = [UIColor clearColor];
    
    [_articleCollectionView registerClass:[ArticleCollectionCell class]
              forCellWithReuseIdentifier:NSStringFromClass([ArticleCollectionCell class])];
    [_articleCollectionView registerClass:[UICollectionReusableView class]
              forSupplementaryViewOfKind: UICollectionElementKindSectionHeader
                     withReuseIdentifier:@"HeaderView"];
    
    [self.bottomStackView addSubview:_articleCollectionView];
    [_articleCollectionView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSDictionary *meterics = @{};
    NSDictionary *variableBindings = NSDictionaryOfVariableBindings(_articleCollectionView);
    [self.view addViewConstraint:@"H:|[_articleCollectionView]|"
                           views:variableBindings
                        meterics:meterics];
    [self.view addViewConstraint:@"V:|-[_articleCollectionView]-|"
                           views:variableBindings
                        meterics:meterics];
}

#pragma mark - Load First Article

- (void)loadFirstArticle {
    
    _articleImageView.backgroundColor = [UIColor clearColor];
    _titleLabel.backgroundColor = [UIColor clearColor];
    _descriptionLabel.backgroundColor = [UIColor clearColor];
    
    _titleLabel.text = [NSString escapeCharacters:_firstArticleVO.title];
    _descriptionLabel.text = [NSString escapeCharacters:_firstArticleVO.articalDescription];
    [DS getImage:_firstArticleVO completionHandler:^(UIImage *image) {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self->_articleImageView.image = image;
            
        }];
    }];
}

#pragma mark - Collection View Life Cycle

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _articalArray.count;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    ArticleCollectionCell *cell = (ArticleCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:
                                                            NSStringFromClass([ArticleCollectionCell class]) forIndexPath:indexPath];
    ArticleVO *articleVO = [_articalArray objectAtIndex:indexPath.row];
    cell.layer.backgroundColor = [UIColor colorFromSwatch:GRAY_LIGHTEST].CGColor;

    [cell setupView:articleVO];
    cell.layer.borderWidth = 1.0f;
    cell.layer.borderColor = [UIColor colorFromSwatch:GRAY_LIGHT].CGColor;
    [cell layoutIfNeeded];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return COLLECTION_VIEW_ITEM_SIZE;
}

- (UIEdgeInsets)collectionView: (UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return COLLECTION_VIEW_EDGE_INSETS; 
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 15.0;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader) {
        
        UICollectionReusableView *reusableview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        
        if (reusableview == nil) {
            reusableview = [[UICollectionReusableView alloc] initWithFrame:CGRectMake(0, 0, 320, [AppUtilities isIPAD] ? 25.0 : 15.0)];
        }
        
        UILabel *titleLabel = [UILabel createLabel:1 colorSwatch:GRAY_DARKEST fontSize:TITLE_FONT_SIZE];
        titleLabel.frame = CGRectMake([AppUtilities isIPAD] ? 25.0 : 8.0, 0.0, 320, [AppUtilities isIPAD] ? 25.0 : 15.0);
        titleLabel.text = [NSString stringWithFormat:ARTICLE_COLLECTIONVIEW_TITLE];
        [reusableview addSubview:titleLabel];
        
        return reusableview;
    }
    return nil;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self showArticleWebView:[_articalArray objectAtIndex:indexPath.row]];
}

#pragma mark - Navigation methods

- (void)addRightNavItems {
    UIButton *refreshButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    
    [refreshButton setBackgroundImage:[UIImage imageNamed:@"refresh.png"] forState:UIControlStateNormal];
    [refreshButton setTitle:@"" forState:UIControlStateNormal];
    [refreshButton addTarget:self action:@selector(getArticleData) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *refreshBarBtn = [[UIBarButtonItem alloc] initWithCustomView:refreshButton];
    self.navigationItem.rightBarButtonItem = refreshBarBtn;
    
}

#pragma mark - Reload Data

- (void)reloadData {
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [self->_articleCollectionView reloadData];
        [self loadFirstArticle];
    }];
    
}

#pragma mark - Show Article WebView

- (void)showArticleWebView:(ArticleVO *)articleVO {
    ArticleWebViewController *articleWebViewController = [[ArticleWebViewController alloc] init];
    NSString *url = [NSString stringWithFormat:@"%@%@", [NSString escapeCharacters:articleVO.link], LINK_APPEND_PARAMETER];
    [articleWebViewController setupWebView:url articleTitle:articleVO.title];
    [self.navigationController pushViewController:articleWebViewController animated:YES];
}

- (void)showFirstArticleWebView:(UIGestureRecognizer *)recognizer {
    [self showArticleWebView:_firstArticleVO];
}

#pragma mark - Parse RSS data

- (void)getArticleData {
    [APP_DELEGATE.concurrentRequestQueue addOperationWithBlock:^{
        [DS parseData:^(NSArray *array) {
            NSMutableArray *articalParsedArray = [NSMutableArray arrayWithArray:array];
            if(articalParsedArray.count > 0) {
                self->_firstArticleVO = [articalParsedArray objectAtIndex:0];
            }
            [articalParsedArray enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(ArticleVO *articleVO, NSUInteger index, BOOL *stop) {
                if (index == 0) {
                    [articalParsedArray removeObjectAtIndex:index];
                }
            }];
            self->_articalArray = articalParsedArray;
            
            [self reloadData];
        }];
    }];
}

@end
