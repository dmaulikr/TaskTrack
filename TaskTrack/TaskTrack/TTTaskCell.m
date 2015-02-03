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
@property (weak, nonatomic) IBOutlet UIButton *taskButton;

@end

@implementation TTTaskCell

- (void)awakeFromNib {
//    UITapGestureRecognizer *editLabelRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(editTitle:)];
//    editLabelRecognizer.numberOfTapsRequired = 1;
//    editLabelRecognizer.enabled = NO;
    self.taskField.enabled = NO;
//    [self.taskField addGestureRecognizer:editLabelRecognizer];
    self.taskField.delegate = self;
    [self.taskField sizeToFit];
    [self.taskField addTarget:self action:@selector(isEditing:) forControlEvents:UIControlEventEditingChanged];
    [self.taskField layoutIfNeeded];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) isEditing:(id)sender
{
    if(self.taskField.text.length > 0)
    {
        NSString *oldText = [self.taskField.text substringToIndex:self.taskField.text.length-1];
        CGSize size = [oldText sizeWithAttributes:self.taskField.defaultTextAttributes];
        if (size.width > [UIScreen mainScreen].bounds.size.width-50) {
            self.taskField.text = oldText;
        }
        else
        {
            size = [self.taskField.text sizeWithAttributes:self.taskField.defaultTextAttributes];
            CGRect newFrame = {self.taskField.frame.origin, size};
            self.taskField.frame = newFrame;
        }
    }
    else
    {
        CGSize size = [self.taskField.text sizeWithAttributes:self.taskField.defaultTextAttributes];
        CGRect newFrame = {self.taskField.frame.origin, size};
        self.taskField.frame = newFrame;
    }
}

-(void) updateViewWithTask:(TTTask *)task;
{
    self.taskField.text = task.taskName;
//    [self.taskButton setTitle:@"Test" forState:nXXil];
    
}
- (IBAction)buttonHit:(id)sender {
    [self.delegate taskCell:self changedTitle:@"ButtonHit"];
}

- (void) enableUpdates:(BOOL)shouldEnableUpdates
{
    [self.taskField endEditing:YES];
    self.taskField.enabled = shouldEnableUpdates;
    //    [self.taskField.gestureRecognizers[0] setEnabled:shouldEnableUpdates];

}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField;
{
    [textField resignFirstResponder];
    return YES;
}

@end
