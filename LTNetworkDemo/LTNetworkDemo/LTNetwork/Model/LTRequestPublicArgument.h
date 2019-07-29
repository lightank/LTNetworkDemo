//
//  LTRequestPublicArgument.h
//  LTNetworkDemo
//
//  Created by 李桓宇 on 2019/7/29.
//  Copyright © 2019 huanyu.li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LTRequestPublicArgument : NSObject

/**  当前客户端版本名称  */
@property (nonatomic, copy) NSString *version;
/**  时间戳 格式yyyyMMddHHmmss  */
@property (nonatomic, copy) NSString *timestamp;

@end

NS_ASSUME_NONNULL_END
