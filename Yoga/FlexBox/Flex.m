//
//  Flex.m
//  Yoga
//
//  Created by pwx on 2023/7/13.
//

#import "Flex.h"
#import "UIView+Flex.h"

@interface Flex ()

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




FlexItemIMP(YGFlexDirection, direction, flexDirection)
FlexItemIMP(YGWrap, wrap, flexWrap)
FlexItemIMP(YGDirection, layoutDirection, direction)
FlexItemIMP(YGJustify, justifyContent, justifyContent)
FlexItemIMP(YGAlign, alignItems, alignItems)
FlexItemIMP(YGAlign, alignSelf, alignSelf)
FlexItemIMP(YGAlign, alignContent, alignContent)
FlexItemIMP(CGFloat, grow, flexGrow)
FlexItemIMP(CGFloat, shrink, flexShrink)

FlexItemIMPFloat(CGFloat, basis, flexBasis)
FlexItemIMPFloat(CGFloat, width, width)
FlexItemIMPFloat(CGFloat, height, height)

FlexItemIMPPercent(CGFloat, percentWidth, width)
FlexItemIMPPercent(CGFloat, percentHeight, height)

- (Flex * _Nonnull (^)(CGSize))size {
    return ^(CGSize value){
        self.yoga.width = YGPointValue(value.width);
        self.yoga.height = YGPointValue(value.height);
        return self;
    };
}

FlexItemIMPFloat(CGFloat, minWidth, minWidth)
FlexItemIMPFloat(CGFloat, maxWidth, maxWidth)
FlexItemIMPPercent(CGFloat, minWidthPercent, minWidth)
FlexItemIMPPercent(CGFloat, maxWidthPercent, maxWidth)

FlexItemIMPFloat(CGFloat, minHeight, minHeight)
FlexItemIMPFloat(CGFloat, maxHeight, maxHeight)
FlexItemIMPPercent(CGFloat, minHeightPercent, minHeight)
FlexItemIMPPercent(CGFloat, maxHeightPercent, maxHeight)

FlexItemIMP(CGFloat, aspectRatio, aspectRatio)
-(Flex * _Nonnull (^)(UIImageView * _Nonnull))aspectRatioOf {
    return ^(UIImageView *view){
        if(view.image){
            CGSize size = view.image.size;
            self.yoga.aspectRatio = size.width / size.height ;
        }
        return self;
    };
}

FlexItemIMP(YGPositionType, position, position)
FlexItemIMPFloat(CGFloat, left, left)
FlexItemIMPFloat(CGFloat, right, right)
FlexItemIMPFloat(CGFloat, top, top)
FlexItemIMPFloat(CGFloat, bottom, bottom)
FlexItemIMPFloat(CGFloat, start, start)
FlexItemIMPFloat(CGFloat, end, end)

- (Flex * _Nonnull (^)(CGFloat))horizontally {
    return ^(CGFloat value){
        self.yoga.left = YGPointValue(value);
        self.yoga.right = YGPointValue(value);
        return self;
    };
}
-(Flex * _Nonnull (^)(CGFloat))vertically {
    return ^(CGFloat value){
        self.yoga.top = YGPointValue(value);
        self.yoga.bottom = YGPointValue(value);
        return self;
    };
}
- (Flex * _Nonnull (^)(CGFloat))all {
    return ^(CGFloat value){
        self.yoga.left = YGPointValue(value);
        self.yoga.right = YGPointValue(value);
        self.yoga.top = YGPointValue(value);
        self.yoga.bottom = YGPointValue(value);
        return self;
    };
}
FlexItemIMPFloat(CGFloat, marginTop, marginTop)
FlexItemIMPFloat(CGFloat, marginLeft, marginLeft)
FlexItemIMPFloat(CGFloat, marginBottom, marginBottom)
FlexItemIMPFloat(CGFloat, marginRight, marginRight)
FlexItemIMPFloat(CGFloat, marginHorizontal, marginHorizontal)
FlexItemIMPFloat(CGFloat, marginVertical, marginVertical)

-(Flex * _Nonnull (^)(UIEdgeInsets))margin {
    return ^(UIEdgeInsets value){
        self.yoga.marginTop = YGPointValue(value.top);
        self.yoga.marginLeft = YGPointValue(value.left);
        self.yoga.marginBottom = YGPointValue(value.bottom);
        self.yoga.marginRight = YGPointValue(value.right);
        return self;
    };
}

FlexItemIMPFloat(CGFloat, marginAll, margin)

FlexItemIMPFloat(CGFloat, paddingTop, paddingTop)
FlexItemIMPFloat(CGFloat, paddingLeft, paddingLeft)
FlexItemIMPFloat(CGFloat, paddingBottom, paddingBottom)
FlexItemIMPFloat(CGFloat, paddingRight, paddingRight)
FlexItemIMPFloat(CGFloat, paddingHorizontal, paddingHorizontal)
FlexItemIMPFloat(CGFloat, paddingVertical, paddingVertical)

- (Flex * _Nonnull (^)(UIEdgeInsets))padding {
    return ^(UIEdgeInsets value){
        self.yoga.paddingTop = YGPointValue(value.top);
        self.yoga.paddingLeft = YGPointValue(value.left);
        self.yoga.paddingBottom = YGPointValue(value.bottom);
        self.yoga.paddingRight = YGPointValue(value.right);
        return self;
    };
}

FlexItemIMPFloat(CGFloat, paddingAll, padding)

- (Flex * _Nonnull (^)(UIColor * _Nonnull))backgroundColor {
    return ^(UIColor *color){
        [self.view setBackgroundColor:color];
        return self;
    };
}
- (Flex * _Nonnull (^)(CGFloat))cornerRadius {
    return ^(CGFloat value){
        self.view.layer.cornerRadius = value;
        return self;
    };
}

- (Flex * _Nonnull (^)(BOOL))hidden {
    return ^(BOOL hidden){
        self.yoga.display = hidden ? YGDisplayNone : YGDisplayFlex;
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


@interface YGLayout (ADD)

@end
