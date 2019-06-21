//
//  LTNetworkTools.h
//  LTNetworkDemo
//
//  Created by 李桓宇 on 2019/6/21.
//  Copyright © 2019 huanyu.li. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LTNetworkTools, LTConnectPort;
extern LTNetworkTools *LTNetworkToolsInstance;

NS_ASSUME_NONNULL_BEGIN

@interface LTNetworkTools : NSObject

/**  当前连接url对象  */
@property (nonatomic, strong) LTConnectPort *connectPort;

/**  拼接URL路径  */
+ (NSString *)URL:(NSString *)urlString;
/**  拼接H5 URL路径  */
+ (NSString *)HTML5URL:(NSString *)urlString;
/**  拼接图片 URL路径  */
+ (NSURL *)imageURL:(NSString *)urlString;

/**  网络库配置,必须调用  */
+ (void)configureNetwork;
/**  显示网络环境配置 */
+ (void)showNetworkOption;
/**  网络是否可用  */
+ (BOOL)isNetworkReachable;
/**  处理无网络事件  */
+ (void)handleNetWorkCannotAccessEvent;
/**  处理有网络事件  */
+ (void)handleNetWorAccessEvent;

@end

@interface LTConnectPort : NSObject

/**  中文名字  */
@property (nonatomic, copy) NSString *name;
/**  网络请求 baseURL  */
@property (nonatomic, copy) NSString *requestBaseURL;
/**  网页 H5 baseURL  */
@property (nonatomic, copy) NSString *webBaseURL;
/**  资源（如：图片等） baseURL  */
@property (nonatomic, copy) NSString *resourceBaseURL;

@end

#pragma mark - 网络通知
//无法访问网络
extern NSString * const LTNetWorkCannotAccessNotification;
//网络切换到WiFi
extern NSString * const LTNetWorkChangedToWiFiNotification;
//网络切换到移动网络
extern NSString * const LTNetWorkChangedToWWANNotification;


NS_ASSUME_NONNULL_END