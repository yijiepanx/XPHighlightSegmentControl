//
//  XPHighlightSegmentControl.h
//  XPHighlightSegmentControl
//
//  Created by iOS Dev on 2019/5/6.
//  Copyright © 2019年 Panyijie. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ButtonOnClickBlock)(NSInteger index,NSString *title);

@interface XPHighlightSegmentControl : UIView

//自定义样式
//@property (nonatomic, strong)UIColor *defaultLabelColor;
//@property (nonatomic, strong)UIColor *highlightLabelColor;
//@property (nonatomic, assign)CGFloat commonLabelFontSize;


@property (nonatomic, copy)ButtonOnClickBlock buttonBlock;

//init
- (instancetype)initWithFrame:(CGRect)frame TitleArray:(NSArray *)titleArray;

//设置联动
- (void)setContentOffsetRate:(CGFloat)offsetRate;

@end

NS_ASSUME_NONNULL_END
