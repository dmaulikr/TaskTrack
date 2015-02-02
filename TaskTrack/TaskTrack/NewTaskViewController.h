//
//  NewTaskViewController.h
//  TaskTrack
//
//  Created by Mark Linington on 2/1/15.
//  Copyright (c) 2015 MarkLinington. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTTask.h"

@protocol NewTaskViewControllerDelegate;

@interface NewTaskViewController : UIViewController

@property (weak, atomic) id <NewTaskViewControllerDelegate> delegate;

@end

@protocol NewTaskViewControllerDelegate <NSObject>

@required
- (void) viewController:(NewTaskViewController *)viewController withNewTask:(TTTask *)task;

@end