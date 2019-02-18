//
//  UIButton+JLModelButton.m
//  JLButtonWithModel
//
//  Created by 科盛数聚 on 2019/2/15.
//  Copyright © 2019年 John. All rights reserved.
//

#import "UIButton+JLModelButton.h"
#import <objc/runtime.h>

@implementation UIButton (JLModelButton)

//这里用@selector(model)来用作 const void *key 的指针

- (id)model{
    
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setModel:(id)model{
    
    objc_setAssociatedObject(self, @selector(model), model, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
