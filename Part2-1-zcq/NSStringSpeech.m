//
//  NSString.m
//  Part2-1-zcq
//
//  Created by 张储祺 on 2018/3/23.
//  Copyright © 2018年 张储祺. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import <objc/runtime.h>
typedef NSString* (^MethodreplacingRangeWithString)(NSRange range,NSString * string);
typedef NSString* (^MethodAppend)(NSString *) ;
@interface NSString (Speech)
@property(nonatomic ,readonly)MethodreplacingRangeWithString replacingRangeWithString ;
@property(nonatomic, readonly)MethodAppend append ;
+(void)speech:(NSString *)content;
@end

@implementation NSString (Speech)

//实现replacingRangeWithString的setter和getter
static NSString * a = @"replacingRangeWithString" ;
/*-(void)setReplacingRangeWithString:(MethodreplacingRangeWithString)replacingRangeWithString{
    objc_setAssociatedObject(self, @selector(replacingRangeWithString), replacingRangeWithString, OBJC_ASSOCIATION_RETAIN_NONATOMIC) ;
}*/
-(MethodreplacingRangeWithString)replacingRangeWithString{
    NSString * copied = self.copy ;
    return ^(NSRange range, NSString * str){
        return [copied stringByReplacingCharactersInRange:range withString:str] ;
    };
}

//实现append的setter和getter
//static NSString * b = @"append" ;
/*-(void)setAppend:(MethodAppend)append{
    objc_setAssociatedObject(self, @selector(append), append,OBJC_ASSOCIATION_RETAIN_NONATOMIC) ;
}*/
-(MethodAppend)append{
    NSString * copied = self.copy ;
    return ^(NSString * string){
        return [copied stringByAppendingString:string] ;
    };
}
//将block实例化
/*-(void)configureReplacingRangeWithStringProperty{
    __weak typeof (self) weakSelf = self ;
    self.replacingRangeWithString =  ^(NSRange range,NSString * str){
        return [weakSelf stringByReplacingCharactersInRange:range withString:str];
    };
}*/
/*-(void)configureAppend{
    __weak typeof (self)weakSelf = self ;
    self.append = ^(NSString *str){
        return [weakSelf stringByAppendingString:str] ;
    };
}*/

//实现speechfang
+(void)speech:(NSString *)content{
    NSSpeechSynthesizer * synthesizer = [[NSSpeechSynthesizer alloc] init] ;
    [synthesizer startSpeakingString:content] ;
}
@end


