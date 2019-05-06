//
//  ViewController.m
//  XPHighlightSegmentControl
//
//  Created by iOS Dev on 2019/5/5.
//  Copyright © 2019年 Panyijie. All rights reserved.
//


#import "ViewController.h"
#import "XPHighlightSegmentControl.h"

@interface ViewController () <UIScrollViewDelegate>

@property (nonatomic, strong)UIScrollView *descoll;
@property (nonatomic, strong)XPHighlightSegmentControl *seg;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _seg = [[XPHighlightSegmentControl alloc] initWithFrame:CGRectMake(0, 200, 375, 30) TitleArray:@[@"Ruby",@"Objective-C",@"Swift",@"Java"]];
    [self.view addSubview:_seg];
    
    __weak typeof(self)weakself = self;
    _seg.buttonBlock = ^(NSInteger index, NSString * _Nonnull title) {
        NSLog(@"%ld----%@",(long)index,title);
        [weakself.descoll setContentOffset:CGPointMake(375*index, 0)];
    };
    
    _descoll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 350, 375, 300)];
    _descoll.backgroundColor = [UIColor brownColor];
    _descoll.contentSize = CGSizeMake(375*4, 300);
    _descoll.pagingEnabled = YES;
    _descoll.delegate = self;
    _descoll.bounces = YES;
    [self.view addSubview:_descoll];
    
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [_seg setContentOffsetRate:scrollView.contentOffset.x/scrollView.contentSize.width];
}



@end
