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
        
    }
    return self;
}

///默认都是 post
- (YTKRequestMethod)requestMethod
{
    //return YTKRequestMethodPOST;
    return YTKRequestMethodGET;
}

- (NSTimeInterval)requestTimeoutInterval
{
    return 60.f;
}

- (NSString *)baseUrl
{
    return @"https://api.fda.gov/food/enforcement.json";
}

@end

/*
 公共api：
 public-apis：https://github.com/public-apis/public-apis
 微博：https://open.weibo.com/wiki/API
 GitHub：https://developer.github.com/v3/
 
 api搜索：
 apis：http://apis.io/
 
 */
