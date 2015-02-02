//
//  TTTaskCell.m
//  TaskTrack
//
//  Created by Mark Linington on 2/2/15.
//  Copyright (c) 2015 MarkLinington. All rights reserved.
//

#import "TTTaskCell.h"

@interface TTTaskCell ()
@property (weak, nonatomic) IBOutlet UILabel *taskLabel;
@property (weak, nonatomic) IBOutlet UIButton *taskButton;

@end

@implementation TTTaskCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) updateViewWithTask:(TTTask *)task
{
    self.taskLabel.text = task.taskName;
//    [self.taskButton setTitle:@"Test" forState:nil];
    
}

@end
