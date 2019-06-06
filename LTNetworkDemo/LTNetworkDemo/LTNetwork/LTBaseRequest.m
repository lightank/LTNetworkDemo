//
//  LTBaseRequest.m
//  LTNetworkDemo
//
//  Created by 李桓宇 on 2019/6/5.
//  Copyright © 2019 huanyu.li. All rights reserved.
//

#import "LTBaseRequest.h"
#import <YYKit/YYKit.h>
#import "NSObject+LTAdd.h"

@interface LTBaseRequest ()

/**  是否已经处理过请求参数,比如添加公共参数  */
@property (nonatomic, assign) BOOL finishedHandleArgument;

@end

@implementation LTBaseRequest

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [[YTKNetworkAgent sharedAgent] setValue:[NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json",@"text/html", nil]
                                     forKeyPath:@"jsonResponseSerializer.acceptableContentTypes"];
    });
}

#pragma mark - 重新父类方法
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _argumentsDictionary = [[NSMutableDictionary alloc] init];
        _shouldAddPublicArguments = YES;
        _shouldAddMACArguments = YES;
        _finishedHandleArgument = NO;
    }
    return self;
}



///默认都是 post
- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodPOST;
}

- (NSTimeInterval)requestTimeoutInterval
{
    return 60.f;
}

- (NSString *)baseUrl
{
    return @"http://127.0.0.1";
}

- (NSDictionary *)requestHeaderFieldValueDictionary
{
    NSMutableDictionary *header = [NSMutableDictionary dictionary];
    NSString *tokenid = @"token";
    header[@"token"] = tokenid;
    return header;
}

/// 处理公共参数
- (id )requestArgument
{
    // 先判断是否已经处理过参数
    if (self.finishedHandleArgument)
    {
        return self.argumentsDictionary;
    }
    
    NSMutableDictionary *mDict = self.argumentsDictionary;
    
    // 处理公共参数
    if (self.shouldAddPublicArguments)
    {
        NSMutableDictionary *publicArguments = @{}.mutableCopy;
        publicArguments[@"version"] = @"v1.0";
        [mDict addEntriesFromDictionary:publicArguments];
    }
    // 处理MAC
    if (self.shouldAddMACArguments)
    {
        mDict[@"sign"] = [self macValueForDictionary:mDict];
    }
    
    self.finishedHandleArgument = YES;
    return mDict;
}

- (BOOL)statusCodeValidator
{
    Class baseResopnesClass = NSClassFromString([self baseResopnesModelClassName]);
    if (!baseResopnesClass)
    {
        NSLog(@"请求%@没有解析json对应的model", NSStringFromClass(self.class));
        return [super statusCodeValidator];
    }
    // 找到属性名
    NSString *baseResopnesName = [self.class lt_propertyNameForClass:baseResopnesClass];
    // 找到真正的类名
    Class modelClass = NSClassFromString([self.class lt_classNameForProperty:baseResopnesName]);
    // 解析数据
    id baseResopnes = [modelClass.class modelWithJSON:self.responseJSONObject];
    if (baseResopnes)
    {
        [self setValue:baseResopnes forKey:baseResopnesName];
        
        if ([baseResopnes respondsToSelector:@selector(isTokenInvalid)] && [(id <LTBaseRequestResponse>)baseResopnes isTokenInvalid])
        {
            [self tokenDidInvalid];
        }
        
        if ([baseResopnes respondsToSelector:@selector(isVersonInvalid)] && [(id <LTBaseRequestResponse>)baseResopnes isVersonInvalid])
        {
            [self versonDidInvalid];
        }
        
        if ([baseResopnes respondsToSelector:@selector(isServerNotResponse)] && [(id <LTBaseRequestResponse>)baseResopnes isServerNotResponse])
        {
            [self serverDidNotResponse];
        }
        
        if ([baseResopnes respondsToSelector:@selector(isRequestSuccess)])
        {
            BOOL success = [(id <LTBaseRequestResponse>)baseResopnes isRequestSuccess];
            if (success) [self requestDidSuccess];
            return success;
        }
    }

    return [super statusCodeValidator];
}


#pragma mark - 事件处理
/// 添加请求参数
- (void)setArgument:(id)value forKey:(NSString*)key
{
    if (value == NULL || [value isKindOfClass:[NSNull class]] || key == NULL || [key isKindOfClass:[NSNull class]])
    {
        NSString *error = [NSString stringWithFormat:@"%@--401-->setArgument:key: 参数%@为空,检测调用代码块...", NSStringFromClass(self.class), key];
        NSLog(@"%@", error);
        return;
    }
    self.argumentsDictionary[key] = value;
}

- (NSString *)baseResopnesModelClassName
{
    return @"LTBaseRequestResponse";
}

- (NSString *)macValueForDictionary:(NSDictionary *)dict
{
    // 先排序
    NSArray *keys = [dict allKeys];
    NSArray *sortedArray = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){
        return [obj1 compare:obj2 options:NSNumericSearch];
    }];
    
    // 再加盐
    NSString *salt = @"salt";
    NSMutableString *result = [NSMutableString stringWithString:salt];
    for (NSString *key in sortedArray)
    {
        [result appendString:[NSString stringWithFormat:@"%@%@", key, [dict objectForKey:key]]];
    }
    return result.md5String;
}

#pragma mark - code处理
/**  在 isRequestSuccess 为 YES 的情况下会调用这个方法,默认什么都不做,子类可以重写这个  */
- (void)requestDidSuccess
{
    
}
/**  在 isVersonInvalid 为 YES 的情况下会调用这个方法,默认什么都不做,子类可以重写这个  */
- (void)versonDidInvalid
{
    
}
/**  在 isTokenInvalid 为 YES 的情况下会调用这个方法,默认什么都不做,子类可以重写这个  */
- (void)tokenDidInvalid
{
    
}
/**  在 isServerNotResponse 为 YES 的情况下会调用这个方法,默认什么都不做,子类可以重写这个  */
- (void)serverDidNotResponse
{
    
}

@end