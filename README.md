# XPHighlightSegmentControl


Highlight_animation_SegmentControl

![效果图](https://github.com/HanGeiKeTsu/XPHighlightSegmentControl/blob/master/segment%E7%9A%84%E5%89%AF%E6%9C%AC.gif)


利用多层View嵌套实现特殊segment样式；

可以和scrollview滑动联动；

#### 调用很简单采用block回调数据
'''

    _seg = [[XPHighlightSegmentControl alloc] initWithFrame:CGRectMake(0, 200, 375, 30) TitleArray:@[@"Ruby",@"Objective-C",@"Swift",@"Java"]];
    [self.view addSubview:_seg];
    __weak typeof(self)weakself = self;
    _seg.buttonBlock = ^(NSInteger index, NSString * _Nonnull title) {
        NSLog(@"%ld----%@",(long)index,title);
        [weakself.descoll setContentOffset:CGPointMake(375*index, 0)];
    };
'''

#### 待添加

可修改样式；

使用CALayer的mask属性实现此效果





