//
//  ViewController.m
//  RuntimeTest
//
//  Created by 李飞艳 on 2018/10/22.
//  Copyright © 2018年 李飞艳. All rights reserved.
//

#import "ViewController.h"
#import "RTMTest.h"
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    RTMTest *test = [[RTMTest alloc] init];
    [test printString:@"runTime"];
}

-(void)printString:(NSString *)string{
    NSLog(@"%@",string);
}
@end
