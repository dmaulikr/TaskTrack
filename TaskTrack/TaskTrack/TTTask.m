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

- (instancetype) initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if(self)
    {
        _taskName = [aDecoder decodeObjectOfClass:[NSString class] forKey:@"TaskName"];
        _dueDate = [aDecoder decodeObjectOfClass:[NSDate class] forKey:@"DueDate"];
    }
    return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_taskName forKey:@"TaskName"];
    [aCoder encodeObject:_dueDate forKey:@"DueDate"];
}

+ (BOOL) supportsSecureCoding
{
    return YES;
}

- (instancetype) initWithName:(NSString *)name
{
    NSDate *dueDate = [NSDate distantFuture];
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
