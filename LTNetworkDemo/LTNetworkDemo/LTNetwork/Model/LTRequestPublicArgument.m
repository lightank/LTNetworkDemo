//
//  LTRequestPublicArgument.m
//  LTNetworkDemo
//
//  Created by 李桓宇 on 2019/7/29.
//  Copyright © 2019 huanyu.li. All rights reserved.
//

#import "LTRequestPublicArgument.h"

@implementation LTRequestPublicArgument

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _version = ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]);
        _timestamp = [NSString stringWithFormat:@"%ld", (long)([[NSDate date] timeIntervalSince1970])];
    }
    return self;
}

@end
