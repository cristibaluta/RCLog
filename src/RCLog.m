//
//  RCLog.m
//
//  Created by Baluta Cristian on 09/10/2013.
//  Copyright (c) 2013 Baluta Cristian. All rights reserved.
//

#import "RCLog.h"

@implementation RCLog

static BOOL _tracesDisabled = NO;
static NSMutableArray *allowedClasses = nil;
static NSString *lastTracedMethod = nil;

+ (void)traceFile:(NSString *)file method:(NSString *)methodName line:(int)line message:(NSString *)message {
	
    if ( allowedClasses == nil || allowedClasses.count == 0 ) {
        [self _traceFile:file method:methodName line:line message:message];
    }
    else for (NSString *c in allowedClasses) {
        if ([c isEqualToString:[[file componentsSeparatedByString:@"."] firstObject]]) {
            [self _traceFile:file method:methodName line:line message:message];
        }
    }
}

+ (void)_traceFile:(NSString *)file method:(NSString *)methodName line:(int)line message:(NSString *)message {
    
    NSString *prefix = ([lastTracedMethod isEqualToString:methodName])
	? @""
	: [NSString stringWithFormat:@"\n%@\n", methodName];
	
    if (!_tracesDisabled) {
        printf ("%s%s:%s: %s\n",
			   [prefix cStringUsingEncoding:NSStringEncodingConversionAllowLossy],
               [file cStringUsingEncoding:NSStringEncodingConversionAllowLossy],
               [[NSString stringWithFormat:@"%i", line] cStringUsingEncoding:NSStringEncodingConversionAllowLossy],
               [message cStringUsingEncoding:NSStringEncodingConversionAllowLossy]
		);
    }
    
    lastTracedMethod = methodName;
}

+ (void)disableTraces {
	_tracesDisabled = YES;
}


/**!
 *  Chose the classes you want to see the traces from
 *  @param arr is an array of strings that represent the file names.
 *  Call this method as many times as you like.
 *  If you don't specify any all traces are sent to the output
 **/

+ (void)allowClasses:(NSArray *)arr {
	
	if (allowedClasses == nil) {
		allowedClasses = [NSMutableArray array];
	}
    [allowedClasses addObjectsFromArray:arr];
}

@end
