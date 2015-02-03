//
//  ViewController.m
//  TaskTrack
//
//  Created by Mark Linington on 1/30/15.
//  Copyright (c) 2015 MarkLinington. All rights reserved.
//

#import "TTTaskViewController.h"
#import "TTTaskCell.h"
#import "TTTaskManager.h"


@interface TTTaskViewController ()
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (strong, atomic) NSIndexPath *selectedRow;
@property (strong, atomic) TTTaskManager *tasks;

@end

@implementation TTTaskViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tasks = [[TTTaskManager alloc] init];
    self.table.dataSource = self;
    self.table.delegate = self;
    self.selectedRow = nil;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)createNewTask:(id)sender {
    TTTask *task = [[TTTask alloc] init];
    [self.table beginUpdates];
    [self.tasks addTask:task toSection:0];
    self.selectedRow = [NSIndexPath indexPathForItem:0 inSection:0];
    [self.table insertRowsAtIndexPaths:@[self.selectedRow] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.table endUpdates];
    [(TTTaskCell *)[self.table cellForRowAtIndexPath:self.selectedRow] enableUpdates:YES focus:YES];
}

#pragma mark - TTTaskCellDelegate

- (void) taskCell:(TTTaskCell *)cell changedTitle:(NSString *)newTitle
{
    NSIndexPath *cellPath = [self.table indexPathForCell:cell];
    TTTask *updatingTask = [self.tasks getTaskAtIndex:cellPath];
    updatingTask.taskName = newTitle;
    [self.table beginUpdates];
    [self.tasks updateTask:updatingTask atIndex:cellPath];
    [self.tasks moveTaskAtIndex:cellPath toSection:1];
    [cell updateViewWithTask:updatingTask];
    [self.table moveRowAtIndexPath:cellPath toIndexPath:[NSIndexPath indexPathForItem:cellPath.row inSection:1]];
    [self.table endUpdates];
}


#pragma mark - UINavigationControllerDeleage

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
}

#pragma mark - UITableViewDataSource

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tasks getNumberOfTasksAtSection:section];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Due today";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TTTaskCell *newCell = [tableView dequeueReusableCellWithIdentifier:@"smallCell" forIndexPath:indexPath];
    
    TTTask *cellTask = [self.tasks getTaskAtIndex:indexPath];
    [newCell updateViewWithTask:cellTask];
    newCell.delegate = self;
    NSLog(@"%@",self);
    return newCell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle == UITableViewCellEditingStyleDelete)
    {
        [self.tasks removeTaskAtIndex:indexPath];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.selectedRow && [indexPath compare:self.selectedRow] == NSOrderedSame)
        return 60;
    else return 38;
    
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView beginUpdates];
    [(TTTaskCell *)[tableView cellForRowAtIndexPath:self.selectedRow] enableUpdates:NO focus:NO];
    if(self.selectedRow && [indexPath compare:self.selectedRow] == NSOrderedSame)
    {
        self.selectedRow = nil;
    }
    else
    {
        [(TTTaskCell *)[tableView cellForRowAtIndexPath:indexPath] enableUpdates:YES focus:NO];
        self.selectedRow = indexPath;
    }
    [tableView endUpdates];
    return nil;
}


@end
