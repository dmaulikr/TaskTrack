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
@property (weak, nonatomic) IBOutlet UITextField *taskField;
@property (weak, nonatomic) IBOutlet UITextField *dateField;
@property (weak, nonatomic) IBOutlet UIButton *taskButton;

//@property (atomic) BOOL selected;

@end

@implementation TTTaskCell

- (void)awakeFromNib {
    self.taskField.enabled = NO;
    self.taskField.delegate = self;
    [self.taskField sizeToFit];
    [self.taskField addTarget:self action:@selector(isEditing:) forControlEvents:UIControlEventEditingChanged];
    [self.taskField layoutIfNeeded];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (CGFloat) getHeight
{
    if(self.selected) return 80;
    else return 50;
}

- (void) isEditing:(id)sender
{
    CGSize size = [self.taskField.text sizeWithAttributes:self.taskField.defaultTextAttributes];
    if (size.width > self.taskField.frame.size.width)
    {
        self.taskField.text = [self.taskField.text substringToIndex:self.taskField.text.length-1];
    }
}

-(void) updateViewWithTask:(TTTask *)task;
{
    self.taskField.text = task.taskName;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM/dd/yyyy HH:mm"];
    self.dateField.text = [formatter stringFromDate:task.dueDate];
    
}
- (IBAction)buttonHit:(UIButton *)sender {
//    [self.delegate taskCell:self changedTitle:@"ButtonHit"];
    [self.delegate taskCell:self expandDate:YES];
}

- (void) enableUpdates:(BOOL)shouldEnableUpdates focus:(BOOL)shouldFocus
{
    [self.taskField endEditing:YES];
    self.taskField.enabled = shouldEnableUpdates;
    if(shouldFocus) [self.taskField becomeFirstResponder];
    //    [self.taskField.gestureRecognizers[0] setEnabled:shouldEnableUpdates];

}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField;
{
    [textField resignFirstResponder];
    [self.delegate taskCell:self changedTitle:textField.text];
    return YES;
}

@end
