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

@end
