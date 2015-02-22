//
//  RCLog.h
//
//  Created by Baluta Cristian on 09/10/2013.
//  Copyright (c) 2015 Baluta Cristian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RCLog : NSObject

+ (void)disableTraces;
+ (void)traceFile:(NSString *)file method:(NSString *)methodName line:(int)line message:(NSString *)message;
+ (void)allowClasses:(NSArray *)arr;

@end

#define RCLog(fmt, ... ) \
do { \
	[RCLog traceFile:[[NSString stringWithUTF8String:__FILE__] lastPathComponent] \
			  method:[NSString stringWithUTF8String:__FUNCTION__] \
				line:__LINE__ \
			 message:[NSString stringWithFormat:(fmt), ##__VA_ARGS__]]; \
} while(0)

#define RCLogO(obj) RCLog(@"%@", obj)
#define RCLogS(str) RCLog(@"%@", str)
#define RCLogI(integer) RCLog(@"%i", integer)
#define RCLogL(long_integer) RCLog(@"%lli", long_integer)
#define RCLogF(float) RCLog(@"%f", float)
#define RCLog2F(float) RCLog(@"%.2f", float)
#define RCLogRect(rect) RCLog(@"%@", NSStringFromCGRect(rect))
#define RCLogPoint(point) RCLog(@"%@", NSStringFromCGPoint(point))
#define RCLogSize(size) RCLog(@"%@", NSStringFromCGSize(size))
#define RCLogThread() RCLog([NSThread isMainThread] ? @"Log from Main Thread":@"Log from Secondary Thread")
#define RCLogTimestamp() RCLog(@"%@", [NSDate date])
