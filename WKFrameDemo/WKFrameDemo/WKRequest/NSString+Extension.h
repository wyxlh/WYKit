//
//  NSString+Extension.h
//  SKKit
//
//  Created by maxin on 16/5/7.
//  Copyright © 2016年 maxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
@interface NSString (Extension)
/**
 *  是否是数字
 *
 */
-(BOOL)isNumberString;

/**
 *  移除空格
 *
 *  @return 移除空格后的字符串
 */
-(NSString *)removeWhiteSpace;

/**
 *
 *获取字符串的size
 */
+(CGSize)getStringSize:(float)fontSize withString:(NSString*)str andWidth:(CGFloat)width;

/**
 *  //邮箱
 *
 *
 */
+ (BOOL) validateEmail:(NSString *)email;
/**
 *  //手机号码验证
 *
 *
 */
+ (BOOL) validateMobile:(NSString *)mobile;

/**
 *  用户名
 *
 *  @param name <#name description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL) validateUserName:(NSString *)name;


/**
 *  //密码
 *
 *  @param passWord <#passWord description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL) validatePassword:(NSString *)passWord;


/**
 *  //昵称
 *
 *  @param nickname <#nickname description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL) validateNickname:(NSString *)nickname;


/**
 *  //身份证号
 *
 *  @param identityCard <#identityCard description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL) validateIdentityCard: (NSString *)identityCard;

/**
 *  //格式化时间时间
 *
 *
 */
+(NSString *)fomartDate:(NSString *)Date;


/**
 * 安全获取字符串
 * @param mStr 字符串
 * @returns 若字符串为nil，则返回@""，否则直接返回字符串
 */
+ (NSString *)strOrEmpty:(NSString *)mStr;

/**
 *  // 生成随机订单ID
 *
 */
+ (NSString *)generateTradeNO;

/**
 *
 *  //获取手机IP
 */
+ (NSString *)getPhoneIP;

/**
 *  //第一次进App
 *
 */
+ (BOOL)isFirstTimeEnterApp;

/**
 *  MD5 加密字符串
 */
+ (NSString *)MD5NSString:(NSString *)string;
/**
 *  判断银行卡号
 *
 *  @param s <#s description#>
 *
 *  @return <#return value description#>
 */
+(NSString *)getDigitsOnly:(NSString*)s;
+(BOOL)isValidCardNumber:(NSString *)cardNumber;
+ (BOOL) checkCardNo:(NSString*) cardNo;
// 弱密码判断
-(BOOL)weakPswd;

@end
