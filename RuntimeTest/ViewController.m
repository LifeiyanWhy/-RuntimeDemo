//
//  ViewController.m
//  RuntimeTest
//
//  Created by 李飞艳 on 2018/10/22.
//  Copyright © 2018年 李飞艳. All rights reserved.
//

#import "ViewController.h"
#import "RTMTest.h"
#import "UIView+category.h"
#import "RTMPerson.h"
#import <objc/runtime.h>
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    RTMTest *test = [[RTMTest alloc] init];
    [test printString:@"runTime"];
    
    UIView *view = [[UIView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:view];
    view.viewName = @"runtimeTestView";
    NSLog(@"%@",view.viewName);
    
    RTMPerson *person = [[RTMPerson alloc] init];
//    unsigned int count = 0;
//    Ivar *personvar = class_copyIvarList([person class], &count);
//    for (int i = 0; i < count; i++) {
//        NSLog(@"%s",ivar_getName(personvar[i]));
//        NSLog(@"%@",[NSString stringWithUTF8String:ivar_getName(personvar[i])]);
//    }
    person.name = @"runtime";
    person.number = @"666666";
    person.age = 10;
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:person];
    RTMPerson *newPerson = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    NSLog(@"====%@ %ld",newPerson.name,(long)newPerson.age);
}

-(void)printString:(NSString *)string{
    NSLog(@"%@",string);
}
@end
