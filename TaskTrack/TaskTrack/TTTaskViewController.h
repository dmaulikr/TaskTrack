//
//  ViewController.h
//  TaskTrack
//
//  Created by Mark Linington on 1/30/15.
//  Copyright (c) 2015 MarkLinington. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTTaskCell.h"


@interface TTTaskViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate, TTTaskCellDelegate>


@end

