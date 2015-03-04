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
@property (weak, nonatomic) IBOutlet UILabel *dateField;
@property (weak, nonatomic) IBOutlet UIButton *taskButton;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (strong, atomic) NSDate *taskDate;

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
    self.taskDate = task.dueDate;
    if([self.taskDate compare:[NSDate distantPast]] == NSOrderedSame)
    {
        self.dateField.hidden = YES;
    }
}
- (IBAction)buttonHit:(UIButton *)sender
{
    if(self.dateField.hidden == YES)
    {
        self.dateField.alpha = 0;
        self.dateField.hidden = NO;
        [UIView animateWithDuration:0.3 animations:^{
            self.dateField.alpha = 1;
        }];
    }
    if([sender.titleLabel.text isEqualToString:@"Set Date"])
    {
        if([self.taskDate compare:[NSDate distantPast]] == NSOrderedSame)
        {
            self.taskDate = [[[NSDate alloc] init] dateByAddingTimeInterval:24*60*60];
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"MMM d yyyy, hh:mm a"];
            self.dateField.text = [formatter stringFromDate:self.taskDate];
            [self.delegate taskCell:self changedDate:self.taskDate];
        }
        [self.datePicker setDate:self.taskDate animated:NO];
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        [self.delegate taskCell:self expandDate:YES];
    }
    else
    {
        [sender setTitle:@"Set Date" forState:UIControlStateNormal];
        [self.delegate taskCell:self expandDate:NO];
    }
}

- (void) enableUpdates:(BOOL)shouldEnableUpdates focus:(BOOL)shouldFocus
{
    [self.taskField endEditing:YES];
    self.taskField.enabled = shouldEnableUpdates;
    if(shouldFocus) [self.taskField becomeFirstResponder];
    //    [self.taskField.gestureRecognizers[0] setEnabled:shouldEnableUpdates];

}

- (IBAction)dateChanged:(UIDatePicker *)sender
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM d yyyy, hh:mm a"];
    self.dateField.text = [formatter stringFromDate:sender.date];
    [self.delegate taskCell:self changedDate:self.taskDate];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField;
{
    [textField resignFirstResponder];
    [self.delegate taskCell:self changedTitle:textField.text];
    return YES;
}




@end
