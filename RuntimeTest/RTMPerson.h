//
//  RTMPerson.h
//  RuntimeTest
//
//  Created by 李飞艳 on 2018/10/27.
//  Copyright © 2018年 李飞艳. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RTMPerson : NSObject<NSCoding>{
    NSString *address;
}
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *number;
@property(nonatomic,assign) NSInteger age;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
