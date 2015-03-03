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

- (TTTask *) createNewTask
{
    TTTask *newTask = [[TTTask alloc] init];
    [self.taskArray insertObject:newTask atIndex:0];
    return newTask;
}

- (NSArray *) alphabetize
{
    NSMutableArray *changeArray = [[NSMutableArray alloc] init];
    
    NSArray *unsortedArray =  [self.taskArray copy];
    [self.taskArray sortUsingComparator:^NSComparisonResult(TTTask *obj1, TTTask *obj2) {
        return [[obj1.taskName uppercaseString] compare:[obj2.taskName uppercaseString]];
    }];
    for (NSUInteger unsortedRow = 0; unsortedRow < unsortedArray.count; unsortedRow++) {
        NSUInteger sortedRow = [self.taskArray indexOfObject:unsortedArray[unsortedRow]];
        if(sortedRow != unsortedRow)
        {
            [changeArray addObject:@[[NSNumber numberWithInteger:unsortedRow], [NSNumber numberWithInteger:sortedRow]]];
        }
    }
    return changeArray;
}

- (void) updateTask:(TTTask *)task atIndex:(NSIndexPath *)index
{
    self.taskArray[index.section][index.row] = task;
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

@end
