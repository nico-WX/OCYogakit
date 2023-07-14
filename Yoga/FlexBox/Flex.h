//
//  Flex.h
//  Yoga
//
//  Created by pwx on 2023/7/13.
//

#import <UIKit/UIKit.h>
#import <UIView+Yoga.h>


NS_ASSUME_NONNULL_BEGIN

@class Flex;
/// Flex Block
#define FlexBlock(Type)         Flex* (^)(Type)
#define FlexItem(Type, Name)    -(FlexBlock(Type)) Name;

#define FlexItemIMP(Type, Name,yogaName)        \
- (Flex * _Nonnull (^)(Type))Name {             \
    return ^(Type value){                       \
        self.yoga.yogaName = value;             \
        return self;                            \
    };                                          \
}

#define FlexItemIMPFloat(Type, Name, yogaName)      \
- (Flex * _Nonnull (^)(Type))Name {                 \
    return ^(Type value){                           \
        self.yoga.yogaName = YGPointValue(value);   \
        return self;                                \
    };                                              \
}

#define FlexItemIMPPercent(Type, Name, yogaName)    \
- (Flex * _Nonnull (^)(Type))Name {      \
    return ^(Type value){                        \
        self.yoga.yogaName = YGPercentValue(value);    \
        return self;                                \
    };                                              \
}




/// Block 类型参数
typedef void (^VoidFlex)(Flex*);

/// 布局行为
typedef NS_ENUM(NSUInteger, LayoutMode) {
    LayoutModeFit,
    LayoutModeAdjustHeight,
    LayoutModeAdjustWidth,
};

typedef NS_ENUM(NSUInteger, Position) {
    /// 默认
    PositionRelative,
    PositionAbsolute,
};

@interface Flex : NSObject


#pragma mark - Var
@property(weak, readonly, nonatomic) UIView *view;
///Item natural size, considering only properties of the view itself. Independent of the item frame.
@property(assign, nonatomic, readonly) CGSize intrinsicSize;
@property(assign, nonatomic) BOOL isIncludedInLayout;

#pragma mark - action
/// 添加空白View
- (FlexBlock(void))addView;

/// 添加View
- (FlexBlock(UIView*))addItem;
///  定义
- (FlexBlock(VoidFlex))define;
/// 标记
- (FlexBlock(void))markDirty;
/// size fit
- (CGSize (^)(CGSize))sizeThatFits;



/// 布局方向
FlexItem(YGFlexDirection, direction)
/// 换行
FlexItem(YGWrap, wrap)
/// 布局方向
FlexItem(YGDirection, layoutDirection)
/// 分布方式
FlexItem(YGJustify, justifyContent)
/// 对齐
FlexItem(YGAlign, alignItems)
/// 自身对齐
FlexItem(YGAlign, alignSelf)
///
FlexItem(YGAlign, alignContent)
/// 内容 拉伸 优先级
FlexItem(CGFloat, grow)
/// 内容收缩 优先级
FlexItem(CGFloat, shrink)
FlexItem(CGFloat, basis)
/// 宽度
FlexItem(CGFloat, width)
/// 高度
FlexItem(CGFloat, height)
/// 宽度百分比
FlexItem(CGFloat, percentWidth)
/// 高度百分比
FlexItem(CGFloat, percentHeight)
/// size
FlexItem(CGSize, size)
FlexItem(CGFloat, minWidth)
FlexItem(CGFloat, maxWidth)
FlexItem(CGFloat, minWidthPercent)
FlexItem(CGFloat, maxWidthPercent)

FlexItem(CGFloat, minHeight)
FlexItem(CGFloat, maxHeight)
FlexItem(CGFloat, minHeightPercent)
FlexItem(CGFloat, maxHeightPercent)

FlexItem(CGFloat, aspectRatio)
FlexItem(UIImageView*, aspectRatioOf)

FlexItem(YGPositionType, position)
FlexItem(CGFloat, left)
FlexItem(CGFloat, right)
FlexItem(CGFloat, top)
FlexItem(CGFloat, bottom)

FlexItem(CGFloat, start)
FlexItem(CGFloat, end)

FlexItem(CGFloat, horizontally)
FlexItem(CGFloat, vertically)
FlexItem(CGFloat, all)

FlexItem(CGFloat, marginTop)
FlexItem(CGFloat, marginLeft)
FlexItem(CGFloat, marginBottom)
FlexItem(CGFloat, marginRight)
FlexItem(CGFloat, marginHorizontal)
FlexItem(CGFloat, marginVertical)
FlexItem(UIEdgeInsets, margin)
FlexItem(CGFloat, marginAll)

FlexItem(UIEdgeInsets, padding)
FlexItem(CGFloat, paddingAll)
FlexItem(CGFloat, paddingTop)
FlexItem(CGFloat, paddingLeft)
FlexItem(CGFloat, paddingBottom)
FlexItem(CGFloat, paddingRight)
FlexItem(CGFloat, paddingVertical)
FlexItem(CGFloat, paddingHorizontal)


FlexItem(UIColor*, backgroundColor)
FlexItem(CGFloat, cornerRadius)
FlexItem(BOOL, hidden)

#pragma mark - Method

- (instancetype)init:(UIView*) view;

/// 布局
- (void)layout:(LayoutMode) mode;

@end

NS_ASSUME_NONNULL_END
