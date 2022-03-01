//
//  Log.h
//  SocksTunnel
//
//  Created by apple  on 2022/2/25.
//  Copyright © 2022 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 *  Flags accompany each log. They are used together with levels to filter out logs.
 */
typedef NS_OPTIONS(NSUInteger, LogFlag){
    /**
     *  0...00001 LogFlagError
     */
    LogFlagError      = (1 << 0),

    /**
     *  0...00010 LogFlagWarning
     */
    LogFlagWarning    = (1 << 1),

    /**
     *  0...00100 LogFlagInfo
     */
    LogFlagInfo       = (1 << 2),

    /**
     *  0...01000 LogFlagDebug
     */
    LogFlagDebug      = (1 << 3),

    /**
     *  0...10000 LogFlagVerbose
     */
    LogFlagVerbose    = (1 << 4)
};


/**
 *  Log levels are used to filter out logs. Used together with flags.
 */
typedef NS_ENUM(NSUInteger, LogLevel){

    /**
     *  No logs
     */
    LogLevelOff       = 0,

    /**
     *  Error logs only
     */
    LogLevelError     = (LogFlagError),

    /**
     *  Error and warning logs
     */
    LogLevelWarning   = (LogLevelError   | LogFlagWarning),

    /**
     *  Error, warning and info logs
     */
    LogLevelInfo      = (LogLevelWarning | LogFlagInfo),

    /**
     *  Error, warning, info and debug logs
     */
    LogLevelDebug     = (LogLevelInfo    | LogFlagDebug),

    /**
     *  Error, warning, info, debug and verbose logs
     */
    LogLevelVerbose   = (LogLevelDebug   | LogFlagVerbose),

    /**
     *  All logs (1...11111)
     */
    LogLevelAll       = NSUIntegerMax,
};

NSString *LogLevelString(LogLevel l);
LogLevel LogLevelFromString(NSString *s);

extern LogLevel gLogLevel;

void LogError(NSString *format, ...);
void LogWarn(NSString *format, ...);
void LogInfo(NSString *format, ...);
void LogDebug(NSString *format, ...);
void LogVerbose(NSString *format, ...);

void logTest(void);

NS_ASSUME_NONNULL_END
