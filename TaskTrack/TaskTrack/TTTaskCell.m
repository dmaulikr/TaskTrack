//
//  TTTaskCell.m
//  TaskTrack
//
//  Created by Mark Linington on 2/2/15.
//  Copyright (c) 2015 MarkLinington. All rights reserved.
//

#import "TTTaskCell.h"
#import "TTTaskManager.h"

@interface TTTaskCell ()
@property (weak, nonatomic) IBOutlet UILabel *taskLabel;
@property (weak, nonatomic) IBOutlet UIButton *taskButton;
@property (weak, atomic) TTTask *task;
@property (weak, atomic) TTTaskManager *manager;

@end

@implementation TTTaskCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) updateViewWithTask:(TTTask *)task onManager:(TTTaskManager *)manager
{
    self.taskLabel.text = task.taskName;
    self.manager = manager;
    self.task = task;
//    [self.taskButton setTitle:@"Test" forState:nil];
    
}
- (IBAction)deleteItem:(id)sender {
//    [self.manager.table beginUpdates];
//    [self.manager.taskArray removeObject:self.task];
//    [self.manager.table deleteRowsAtIndexPaths: withRowAnimation:<#(UITableViewRowAnimation)#>
//    [self.manager.table endUpdates];
}

@end
