//
//  RTMPerson.m
//  RuntimeTest
//
//  Created by 李飞艳 on 2018/10/27.
//  Copyright © 2018年 李飞艳. All rights reserved.
//

#import "RTMPerson.h"
#import <objc/runtime.h>
@implementation RTMPerson

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        unsigned int count = 0;
        Ivar *selfIvar = class_copyIvarList([self class], &count);
        for (int i = 0;i < count; i++) {
            NSString *key = [NSString stringWithUTF8String:ivar_getName(selfIvar[i])];
            [self setValue:[aDecoder decodeObjectForKey:key] forKey:key];
        }
    }
    return self;
}
-(void)encodeWithCoder:(NSCoder *)aCoder{
    unsigned int outCount;
    Ivar * ivars = class_copyIvarList([self class], &outCount);
    for (int i = 0; i < outCount; i ++) {
        Ivar ivar = ivars[i];
        NSString * key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        [aCoder encodeObject:[self valueForKey:key] forKey:key];
    }
}
- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        //存放所有属性名
        NSMutableArray * keys = [NSMutableArray array];
        unsigned int count = 0;
        //获取所有属性
        objc_property_t * selfProperty = class_copyPropertyList([self class], &count);
        for (int i = 0; i < count; i ++) {
            //将获取到的属性转换为NSString类型
            NSString * propertyName = [NSString stringWithUTF8String:property_getName(selfProperty[i])];
            //添加到keys
            [keys addObject:propertyName];
        }
        free(selfProperty);
        for (NSString * key in keys) {
            //如果字典中没有该属性的值则不进行赋值语句
            if ([dict valueForKey:key] == nil) continue;
            //如果有，赋值
            [self setValue:[dict valueForKey:key] forKey:key];
        }
    }
    return self;
}
@end
