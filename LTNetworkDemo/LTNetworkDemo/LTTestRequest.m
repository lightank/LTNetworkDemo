//
//  LTTestRequest.m
//  LTNetworkDemo
//
//  Created by 李桓宇 on 2019/6/5.
//  Copyright © 2019 huanyu.li. All rights reserved.
//

#import "LTTestRequest.h"

@implementation LTTest

- (BOOL)isRequestSuccess
{
    return YES;
}

@end

@implementation LTTestRequest

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self setArgument:@35 forKey:@"lat"];
        [self setArgument:@139 forKey:@"lon"];
        [self setArgument:@"b1b15e88fa797225412429c1c50c122a1" forKey:@"appid"];
    }
    return self;
}

///默认都是 post
- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodGET;
}

- (NSTimeInterval)requestTimeoutInterval
{
    return 60.f;
}

- (NSString *)baseUrl
{
    return @"http://samples.openweathermap.org/data/2.5/weather";
}

@end
