//
//  TTTaskManager.m
//  TaskTrack
//
//  Created by Mark Linington on 2/2/15.
//  Copyright (c) 2015 MarkLinington. All rights reserved.
//

#import "TTTaskManager.h"
#import "TTTask.h"
#import "TTTaskCell.h"

@interface TTTaskManager ()

@end

@implementation TTTaskManager

- (instancetype) init
{
    self = [super init];
    if(self)
    {
        _taskArray = [[NSMutableArray alloc] init];
        _taskArray[0] = [[NSMutableArray alloc] init];
        _taskArray[1] = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void) addTask:(TTTask *)task toSection:(NSUInteger)section
{
    [self.taskArray[section] addObject:task];
}
- (void) moveTaskAtIndex:(NSIndexPath *)index toSection:(NSUInteger)section
{
    [self.taskArray[section] addObject:self.taskArray[index.section][index.row]];
    [self.taskArray[index.section] removeObjectAtIndex:index.row];
}
- (void) updateTask:(TTTask *)task atIndex:(NSIndexPath *)index
{
    self.taskArray[index.section][index.row] = task;
}
- (void) removeTaskAtIndex:(NSIndexPath *)index
{
    [self.taskArray[index.section] removeObjectAtIndex:index.row];
}
- (TTTask *) getTaskAtIndex:(NSIndexPath *)index
{
    return self.taskArray[index.section][index.row];
}

- (NSUInteger) getNumberOfTasks
{
    abort();
    return self.taskArray.count;
}
- (NSUInteger) getNumberOfTasksAtSection:(NSUInteger)section
{
    return [self.taskArray[section] count];
}

@end
