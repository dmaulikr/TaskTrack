//
//  TTTask.h
//  TaskTrack
//
//  Created by Mark Linington on 2/2/15.
//  Copyright (c) 2015 MarkLinington. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTTask : NSObject

@property (strong, atomic) NSString *taskName;
@property NSDate *dueDate;

- (instancetype) init;
- (instancetype) initWithName:(NSString *)name;
- (instancetype) initWithName:(NSString *)name withDate:(NSDate *)date;

@end
