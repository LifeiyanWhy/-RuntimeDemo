//
//  UIView+category.m
//  RuntimeTest
//
//  Created by 李飞艳 on 2018/10/25.
//  Copyright © 2018年 李飞艳. All rights reserved.
//

#import "UIView+category.h"
#import <objc/runtime.h>

@implementation UIView (category)
@dynamic viewName;
static char kViewNameKey;

-(void)setViewName:(NSString *)viewName{
    objc_setAssociatedObject(self, &kViewNameKey, viewName
                             ,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSString *)viewName{
    return objc_getAssociatedObject(self, &kViewNameKey);
}

//-(void)setViewName:(NSString *)viewName{
//    self.viewName = viewName;
//}
//-(NSString *)viewName{
//    return self.viewName;
//}
@end
