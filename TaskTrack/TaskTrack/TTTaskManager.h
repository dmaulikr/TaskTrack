//
//  TTTaskManager.h
//  TaskTrack
//
//  Created by Mark Linington on 2/2/15.
//  Copyright (c) 2015 MarkLinington. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TTTaskManager : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (strong, atomic) NSMutableArray *taskArray;
@property (weak, atomic) UITableView *table;

@end
