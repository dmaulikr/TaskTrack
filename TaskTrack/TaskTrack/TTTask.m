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
    NSDate *dueDate = [NSDate distantPast];
    return [self initWithName:name withDate:dueDate];
}
- (instancetype) initWithName:(NSString *)name withDate:(NSDate *)date
{
    self = [super init];
    if(self)
    {
        _taskName = name;
        _dueDate = date;
    }
    return self;
}

@end
