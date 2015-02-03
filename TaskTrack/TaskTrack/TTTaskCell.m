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

@end

@implementation TTTaskCell

- (void)awakeFromNib {
            UITapGestureRecognizer *editLabelRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(editTitle:)];
            editLabelRecognizer.numberOfTapsRequired = 1;
            editLabelRecognizer.enabled = NO;
            [self.taskLabel addGestureRecognizer:editLabelRecognizer];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) updateViewWithTask:(TTTask *)task;
{
    self.taskLabel.text = task.taskName;
//    [self.taskButton setTitle:@"Test" forState:nXXil];
    
}
- (IBAction)buttonHit:(id)sender {
    [self.delegate taskCell:self changedTitle:@"ButtonHit"];
}

- (void) enableUpdates:(BOOL)shouldEnableUpdates
{
    [self.taskLabel.gestureRecognizers[0] setEnabled:shouldEnableUpdates];

}

- (IBAction) editTitle:(id)sender
{
    NSLog(@"Hit");
}


@end
