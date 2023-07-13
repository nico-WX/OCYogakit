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
#define FlexBlock(Type)     Flex* (^)(Type)
/// Block 类型参数
typedef void (^VoidFlex)(Flex*);

/// 布局行为
typedef NS_ENUM(NSUInteger, LayoutMode) {
    LayoutModeFit,
    LayoutModeAdjustHeight,
    LayoutModeAdjustWidth,
};

@interface Flex : NSObject


#pragma mark - Var

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
- (FlexBlock(YGFlexDirection))direction;
/// 换行
- (FlexBlock(YGWrap))wrap;
/// 布局方向
- (FlexBlock(YGDirection))layoutDirection;
/// 分布方式
-(FlexBlock(YGJustify))justifyContent;
/// 对齐
-(FlexBlock(YGAlign))alignItems;

#pragma mark - Method

- (instancetype)init:(UIView*) view;

/// 布局
- (void)layout:(LayoutMode) mode;

@end

NS_ASSUME_NONNULL_END
