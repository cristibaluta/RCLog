//
//  RCLog.m
//
//  Created by Baluta Cristian on 09/10/2013.
//  Copyright (c) 2013 Baluta Cristian. All rights reserved.
//

#import "RCLog.h"

@implementation RCLog

static BOOL _tracesDisabled = NO;
static NSMutableArray *ALLOW_TRACES_FROM = nil;
static NSString *lastTracedMethod = @"";

+ (void)traceFile:(NSString *)file method:(NSString *)methodName line:(int)line message:(NSString *)message {
	
    if (ALLOW_TRACES_FROM == nil) {
        ALLOW_TRACES_FROM = [NSMutableArray array];
    }
    if ( ALLOW_TRACES_FROM.count == 0 ) {
        [self _traceFile:file method:methodName line:line message:message];
    }
    else for (NSString *c in ALLOW_TRACES_FROM) {
        if (c == file) {
            [self _traceFile:file method:methodName line:line message:message];
        }
    }
}

+ (void)_traceFile:(NSString *)file method:(NSString *)methodName line:(int)line message:(NSString *)message {
    
    NSString *newLineIn = [lastTracedMethod isEqualToString:methodName] ? @"" : @"\n---> ";
    NSString *newLineOut = [lastTracedMethod isEqualToString:methodName] ? @"" : @"\n\n";
    
//    haxe.Firebug.trace ( inf.methodName + " : " + newLineIn + Std.string(v) + newLineOut, inf );
    if (!_tracesDisabled) {
        printf("%s:%s: %s\n",
               [file cStringUsingEncoding:NSStringEncodingConversionAllowLossy],
               [[NSString stringWithFormat:@"%i", line] cStringUsingEncoding:NSStringEncodingConversionAllowLossy],
               [message cStringUsingEncoding:NSStringEncodingConversionAllowLossy]);
    }
    
    lastTracedMethod = methodName;
}

+ (void)disableTraces {
	_tracesDisabled = YES;
}

/**!
 *  Chose the classes you want to see the traces from
 *  @param arr is an array of strings that represent the class names.
 *  Call this method as many times as you like.
 *  If you don't specify any all traces are sent to the output
 **/
+ (void)allowClasses:(NSArray *)arr {
    [ALLOW_TRACES_FROM addObjectsFromArray:arr];
}

@end
