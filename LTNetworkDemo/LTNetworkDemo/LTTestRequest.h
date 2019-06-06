//
//  LTTestRequest.h
//  LTNetworkDemo
//
//  Created by 李桓宇 on 2019/6/5.
//  Copyright © 2019 huanyu.li. All rights reserved.
//

#import "LTBaseRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface LTTest : LTBaseRequestResponse

@end

@interface LTTestRequest : LTBaseRequest

@property(nonatomic, strong) LTTest *test;

@end

NS_ASSUME_NONNULL_END
