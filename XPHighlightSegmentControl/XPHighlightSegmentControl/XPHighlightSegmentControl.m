//
//  XPHighlightSegmentControl.m
//  XPHighlightSegmentControl
//
//  Created by iOS Dev on 2019/5/6.
//  Copyright © 2019年 Panyijie. All rights reserved.
//

#import "XPHighlightSegmentControl.h"


//extension
@interface XPHighlightSegmentControl ()
{
    UIView *highlightView;
    UIView *tophighlightView;
}
//datasource
@property (nonatomic, strong)NSArray *titleArray;

@property (nonatomic, assign)CGFloat itemWidth;
@property (nonatomic, assign)CGFloat itemHeight;


@end

@implementation XPHighlightSegmentControl

- (instancetype)initWithFrame:(CGRect)frame TitleArray:(NSArray *)titleArray
{
    self = [super initWithFrame:frame];
    if (self) {
        
//        self.backgroundColor = [UIColor cyanColor];
        
        self.titleArray = titleArray;
        if (self.titleArray.count != 0) {
            self.itemWidth = CGRectGetWidth(frame)/self.titleArray.count;
            self.itemHeight = CGRectGetHeight(frame);
        }
        
        [self buildDisplayView];
        
    }
    return self;
}

- (void)buildDisplayView {
    //展示层
    //底层显示label
    for (int i = 0; i<_titleArray.count; i++) {
        UILabel *defaultlabel = [[UILabel alloc] initWithFrame:CGRectMake(_itemWidth*i, 0, _itemWidth, _itemHeight)];
        defaultlabel.text = _titleArray[i];
        defaultlabel.textAlignment = NSTextAlignmentCenter;
        defaultlabel.textColor = [UIColor blackColor];
        defaultlabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:defaultlabel];
    }
    
    //创建高亮view层
    highlightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _itemWidth, _itemHeight)];
    highlightView.clipsToBounds = YES; //point  
    
    UIView *colorBlockView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _itemWidth, _itemHeight)];
    colorBlockView.backgroundColor = [UIColor redColor];
    colorBlockView.layer.cornerRadius = _itemHeight/2;
    [highlightView addSubview:colorBlockView];
    
    //上层显示label
    tophighlightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), _itemHeight)];
    for (int i = 0; i<_titleArray.count; i++) {
        UILabel *highlightLabel = [[UILabel alloc] initWithFrame:CGRectMake(_itemWidth*i, 0, _itemWidth, _itemHeight)];
        highlightLabel.text = _titleArray[i];
        highlightLabel.textAlignment = NSTextAlignmentCenter;
        highlightLabel.textColor = [UIColor whiteColor];
        highlightLabel.font = [UIFont systemFontOfSize:14];
        [tophighlightView addSubview:highlightLabel];
    }
    [highlightView addSubview:tophighlightView];
    
    [self addSubview:highlightView];
    
    //操作层
    for (int i = 0; i<_titleArray.count; i++) {
        UIButton *actionButton = [[UIButton alloc] initWithFrame:CGRectMake(_itemWidth*i, 0, _itemWidth, _itemHeight)];
        actionButton.tag = i;
        [actionButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:actionButton];
    }
    
}

- (void)buttonAction:(UIButton *)sender {
    NSInteger currentIndex = sender.tag;
    
    [UIView animateWithDuration:0.2 animations:^{
        [self->highlightView setFrame:CGRectMake(currentIndex*self->_itemWidth, 0, self->_itemWidth, self->_itemHeight)];
        [self->tophighlightView setFrame:CGRectMake(-currentIndex*self->_itemWidth, 0, CGRectGetWidth(self.frame), self->_itemHeight)];
    } completion:^(BOOL finished) {
        if (self.buttonBlock && currentIndex<self->_titleArray.count) {
            self.buttonBlock(currentIndex, self->_titleArray[currentIndex]);
        }
    }];
}

- (void)setContentOffsetRate:(CGFloat)offsetRate {
    NSLog(@"%f",offsetRate);
        [self->highlightView setFrame:CGRectMake(offsetRate*CGRectGetWidth(self.frame), 0, self->_itemWidth, self->_itemHeight)];
        [self->tophighlightView setFrame:CGRectMake(-offsetRate*CGRectGetWidth(self.frame), 0, CGRectGetWidth(self.frame), self->_itemHeight)];

}



@end
