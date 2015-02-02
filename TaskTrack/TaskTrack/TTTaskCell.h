//
//  TTTaskCell.h
//  TaskTrack
//
//  Created by Mark Linington on 2/2/15.
//  Copyright (c) 2015 MarkLinington. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTTask.h"
#import "TTTaskManager.h"

@interface TTTaskCell : UITableViewCell

- (void) updateViewWithTask:(TTTask *)task onManager:(TTTaskManager *)manager;

@end
