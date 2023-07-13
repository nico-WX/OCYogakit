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
            
            
        });
    }
    return self;
}


@end
