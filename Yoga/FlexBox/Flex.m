//
//  Flex.m
//  Yoga
//
//  Created by pwx on 2023/7/13.
//

#import "Flex.h"
#import "UIView+Flex.h"

@interface Flex ()

@property(weak, readonly, nonatomic) UIView *view;
@property(strong, nonatomic) YGLayout *yoga;

@end

@implementation Flex

- (instancetype)init:(UIView *)view {
    if(self = [super init]) {
        _view = view;
        self.yoga = view.yoga;
        self.yoga.isEnabled = true;
    }
    return  self;
}

#pragma mark -get  set

- (CGSize)intrinsicSize {
    return self.yoga.intrinsicSize;
}
- (BOOL)isIncludedInLayout{
    return self.yoga.isIncludedInLayout;
}
- (void)setIsIncludedInLayout:(BOOL)isIncludedInLayout {
    self.yoga.isIncludedInLayout = isIncludedInLayout;
}


#pragma mark -block

- (Flex * _Nonnull (^)(void))addView {
    return ^(void){
        UIView *view = UIView.new;
        return self.addItem(view);
    };
}

- (Flex * _Nonnull (^)(UIView*))addItem {
    return ^(UIView* view){
        [self.view addSubview:view];
        return view.flex;
    };
}

- (Flex * _Nonnull (^)(VoidFlex _Nonnull))define {
    return ^(VoidFlex block){
        block(self);
        return self;
    };
}
- (Flex * _Nonnull (^)(void))markDirty {
    return ^(){
        [self.yoga markDirty];
        return self;
    };
}

- (CGSize (^)(CGSize))sizeThatFits {
    return ^(CGSize size){
        return [self.yoga calculateLayoutWithSize:size];
    };
}

- (Flex * _Nonnull (^)(YGFlexDirection))direction {
    return ^(YGFlexDirection dir){
        self.yoga.flexDirection = dir;
        return self;
    };
}

- (Flex * _Nonnull (^)(YGWrap))wrap {
    return ^(YGWrap wrap){
        self.yoga.flexWrap = wrap;
        return self;
    };
}

- (Flex * _Nonnull (^)(YGDirection))layoutDirection {
    return ^(YGDirection dir){
        self.yoga.direction = dir;
        return self;
    };
}

- (Flex * _Nonnull (^)(YGJustify))justifyContent{
    return ^(YGJustify just){
        self.yoga.justifyContent = just;
        return self;
    };
}

- (Flex * _Nonnull (^)(YGAlign))alignItems {
    return ^(YGAlign align){
        self.yoga.alignItems = align;
        return self;
    };
}

#pragma mark -Method

- (void)layout:(LayoutMode)mode {
    if (mode == LayoutModeFit) {
        [self.yoga applyLayoutPreservingOrigin:true];
    }else {
        YGDimensionFlexibility dim = (mode == LayoutModeAdjustWidth) ? YGDimensionFlexibilityFlexibleWidth : YGDimensionFlexibilityFlexibleHeight;
        
        [self.yoga applyLayoutPreservingOrigin:YES dimensionFlexibility:dim];
    }
}





@end
