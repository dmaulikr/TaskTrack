//
//  TTTask.m
//  TaskTrack
//
//  Created by Mark Linington on 2/2/15.
//  Copyright (c) 2015 MarkLinington. All rights reserved.
//

#import "TTTask.h"

@implementation TTTask

- (instancetype) init
{
    return [self initWithName:@""];
}

- (instancetype) initWithName:(NSString *)name
{
    return [self initWithName:name withSeverity:0];
}
- (instancetype) initWithName:(NSString *)name withSeverity:(NSInteger)severity
{
    self = [super init];
    if(self)
    {
        _taskName = name;
        _taskSeverity = severity;
    }
    return self;
}

@end
