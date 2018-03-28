//
//  main.m
//  Part2-1-zcq
//
//  Created by 张储祺 on 2018/3/23.
//  Copyright © 2018年 张储祺. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSStringSpeech.m"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        printf("please input your string:\n") ;
        NSData *data = [[NSFileHandle fileHandleWithStandardInput] availableData];
        NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        [NSString speech:string] ;
      
        NSString * str = @"hello world" ;
//        [str configureAppend] ;
//        [str configureReplacingRangeWithStringProperty] ;
        str = str.replacingRangeWithString(NSMakeRange(6, 5),@"iOS").append(@" hhhhh") ;
        NSLog(@"%@",str) ;
        };
    return 0 ;
    }
/*
 NSString * str = @"hello world" ;
 str = [[str stringByRe
 placingCharactersInRange:NSMakeRange(6,5) withString:@"iOS"] stringByAppendingString:@" hhhhh"] ;
 NSLog(@"%@",str) ;*/
