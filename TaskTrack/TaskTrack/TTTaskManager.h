//
//  TTTaskManager.h
//  TaskTrack
//
//  Created by Mark Linington on 2/2/15.
//  Copyright (c) 2015 MarkLinington. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TTTask.h"

@interface TTTaskManager : NSObject

@property (strong, atomic) NSMutableArray *taskArray;

- (instancetype) init;

- (void) addTask:(TTTask *)task toSection:(NSUInteger)section;
- (void) moveTaskAtIndex:(NSIndexPath *)index toSection:(NSUInteger)section;
- (void) updateTask:(TTTask *)task atIndex:(NSIndexPath *)index;
- (void) removeTaskAtIndex:(NSIndexPath *)index;
- (TTTask *) getTaskAtIndex:(NSIndexPath *)index;

- (NSUInteger) getNumberOfTasks;
- (NSUInteger) getNumberOfTasksAtSection:(NSUInteger)section;


@end
