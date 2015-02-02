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
    }
    return self;
}

- (void) addTask:(TTTask *)newTask
{
    [self.taskArray addObject:newTask];
}
- (void) updateTask:(TTTask *)task atIndex:(NSIndexPath *)index
{
    self.taskArray[index.row] = task;
}
- (void) removeTaskAtIndex:(NSIndexPath *)index
{
    [self.taskArray removeObjectAtIndex:index.row];
}
- (TTTask *) getTaskAtIndex:(NSIndexPath *)index
{
    return self.taskArray[index.row];
}

- (NSUInteger) getNumberOfTasks
{
    return self.taskArray.count;
}
- (NSUInteger) getNumberOfTasksAtSection:(NSUInteger)section
{
    return self.taskArray.count;
}

@end
