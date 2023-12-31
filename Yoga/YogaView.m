//
//  YogaView.m
//  Yoga
//
//  Created by pwx on 2023/7/13.
//

#import "YogaView.h"
#import "UIView+Flex.h"

@implementation YogaView

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]){
        
 
        self.flex.define(^(Flex *make){
            make.direction(YGFlexDirectionRow)
                .layoutDirection(YGDirectionLTR)
                .define(^(Flex *flex){
                    flex.addView();

                });

        });
        
        self.flex.define(^(Flex *make){
            make.justifyContent(YGJustifyFlexEnd)
                .alignItems(YGAlignCenter)
                .backgroundColor(UIColor.redColor)
                .percentHeight(2)
                .percentWidth(100)
                .addView().define(^(Flex *make){
                });
        });
    }
    return self;
}


@end
