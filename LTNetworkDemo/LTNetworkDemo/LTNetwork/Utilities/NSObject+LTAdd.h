//
//  NSObject+LTAdd.h
//  LTNetworkDemo
//
//  Created by 李桓宇 on 2019/6/5.
//  Copyright © 2019 huanyu.li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (LTAdd)

/**
 获取 defaultClass类 的所有直接继承自这个类的子类的类名,子类需要实现 @impletation
 
 @param defaultClass  需要查询的类
 @param include 返回的数组是否包含自己
 @return 包含所有子类的数组,如果没有则返回空数组
 */
+ (NSArray<NSString *> *_Nonnull)lt_subClassOf:(Class _Nonnull)defaultClass includeSelf:(BOOL)include;
/**
 获取 defaultClass类 的所有子类的类名,包含所有直接或间接继承自这个类的子类,子类需要实现 @impletation
 
 @param defaultClass 需要查询的类
 @param include 返回的数组是否包含自己
 @return 包含所有类的数组,如果没有则返回空数组
 */
+ (NSArray<NSString *> *_Nonnull)lt_allSubClassOf:(Class _Nonnull)defaultClass includeSelf:(BOOL)include;

/**
 获取 defaultClass类 所有的父类
 
 @param defaultClass 需要查询的类
 @return 所有父类的数组
 */
+ (NSArray<NSString *> *_Nonnull)lt_superClassOf:(Class _Nonnull)defaultClass;

/**
 * 返回对象中属性的class类型,如果你用NSClassFromString()返回了nil,请检查是否把相应类加入了target,或者有无实现@implementation
 * @return NSString 返回属性的类型
 **/
+ (nullable NSString *)lt_classNameForProperty:(NSString *_Nonnull)propertyName;


/**
 * 返回对象中属性class对应的属性名称,会搜索父类的属性,如果你用NSClassFromString()返回了nil,请检查是否把相应类加入了target,或者有无实现@implementation
 * @return NSString 返回属性的类型
 **/
+ (nullable NSString *)lt_propertyNameForClass:(Class _Nonnull)className;

/**
 * 返回对象中key为属性名称,value为class类型字符串的字典,包含所有父类的属性,如果你用NSClassFromString()返回了nil,请检查是否把相应类加入了target,或者有无实现@implementation
 * @return NSString 返回属性的类型
 **/
+ (nullable NSDictionary<NSString *, NSString *> *)lt_allPropertyDictionaryOf:(Class _Nonnull)defaultClass;
/**
 返回对象中key为属性名称,value为class类型字符串的字典,仅包含当前类的属性,如果你用NSClassFromString()返回了nil,请检查是否把相应类加入了target,或者有无实现@implementation,注意不会查找父类的属性
 @return 返回对象中key为属性名称,value为class类型字符串的字
 */
+ (nullable NSDictionary<NSString *, NSString *> *)lt_propertyDictionaryOf:(Class _Nonnull)defaultClass;


@end

NS_ASSUME_NONNULL_END