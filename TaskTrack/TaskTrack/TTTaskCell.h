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

@protocol TTTaskCellDelegate;

@interface TTTaskCell : UITableViewCell <UITextFieldDelegate>

@property (strong, atomic) id <TTTaskCellDelegate> delegate;

- (void) updateViewWithTask:(TTTask *)task;
- (void) enableUpdates:(BOOL)shouldEnableUpdates;

@end

@protocol TTTaskCellDelegate <NSObject>

@required
- (void) taskCell:(TTTaskCell *)cell changedTitle:(NSString *)newTitle;

@end
