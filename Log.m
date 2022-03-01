//
//  Log.m
//  SocksTunnel
//
//  Created by apple  on 2022/2/25.
//  Copyright © 2022 apple. All rights reserved.
//

#import "Log.h"

LogLevel gLogLevel = LogLevelInfo;

void LogError(NSString *format, ...)
{   
    if (gLogLevel & LogFlagError) {
        va_list args;
        va_start(args, format);
        NSLogv(format, args);
        va_end(args); 
    }
}   

void LogWarn(NSString *format, ...)
{   
    if (gLogLevel & LogFlagWarning) {
        va_list args;
        va_start(args, format);
        NSLogv(format, args);
        va_end(args); 
    }
}  

void LogInfo(NSString *format, ...){   
    if (gLogLevel & LogFlagInfo) {
        va_list args;
        va_start(args, format);
        NSLogv(format, args);
        va_end(args); 
    }
}  

void LogDebug(NSString *format, ...)
{   
    if (gLogLevel & LogFlagDebug) {
        va_list args;
        va_start(args, format);
        NSLogv(format, args);
        va_end(args); 
    }
}  

void LogVerbose(NSString *format, ...)
{   
    if (gLogLevel & LogFlagVerbose) {
        va_list args;
        va_start(args, format);
        NSLogv(format, args);
        va_end(args); 
    }
}  


NSString *LogLevelString(LogLevel l)
{
    switch (l) {
    case LogLevelOff:
        return @"off";
    case LogLevelError:
        return @"error";
    case LogLevelWarning:
        return @"warning";
    case LogLevelInfo:
        return @"info";
    case LogLevelDebug:
        return @"debug";
    case LogLevelVerbose:
        return @"verbose";
    }
    
    return @"invalid level, program error";
}

LogLevel LogLevelFromString(NSString *s)
{
    if ([s isEqualToString:@"off"]) {
        return LogLevelOff;
    }else if ([s isEqualToString:@"error"]) {
        return LogLevelError;
    }else if ([s isEqualToString:@"warning"]) {
        return LogLevelWarning;
    }else if ([s isEqualToString:@"info"]) {
        return LogLevelInfo;
    }else if ([s isEqualToString:@"debug"]) {
        return LogLevelDebug;
    }else if ([s isEqualToString:@"verbose"]) {
        return LogLevelVerbose;
    } else{
        NSLog(@"error LogLevelFromString: %@", s);
        
        return LogLevelInfo;
    }
}

@interface Log : NSObject
@end

@implementation Log
-(void)setLogLevel:(NSString*)level
{
   gLogLevel = LogLevelFromString(level);
}
@end

void logAtAllLevel(void)
{
    LogError(@"error");
    LogWarn(@"warn");
    LogInfo(@"info");
    LogDebug(@"debug");
    LogVerbose(@"verbose");
}

void logTest(void)
{
    gLogLevel = LogLevelOff;
    logAtAllLevel();
    
    gLogLevel = LogLevelError;
    logAtAllLevel();
    
    gLogLevel = LogLevelWarning;
    logAtAllLevel();
    
    gLogLevel = LogLevelInfo;
    logAtAllLevel();
    
    gLogLevel = LogLevelDebug;
    logAtAllLevel();

    gLogLevel = LogLevelVerbose;
    logAtAllLevel();
}

