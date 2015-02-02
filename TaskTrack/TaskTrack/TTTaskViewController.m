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

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tasks = [[TTTaskManager alloc] init];
    self.table.dataSource = self;
    self.table.delegate = self;
    self.selectedRow = nil;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UINavigationControllerDeleage

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"newTask"])
    {
        [(NewTaskViewController *)[segue destinationViewController] setDelegate:self];
    }
}

#pragma mark - NewTaskViewControllerDelegate

- (void) viewController:(NewTaskViewController *)viewController withNewTask:(TTTask *)task
{
    [self.tasks addTask:task];
    NSLog(@"%@",task);
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return [self.tasks getNumberOfTasks];
    }
    else
    {
        return 0;
    }
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
    if(self.selectedRow && [self.selectedRow compare:indexPath] == NSOrderedSame)
        self.selectedRow = nil;
    else
        self.selectedRow = indexPath;
    [tableView endUpdates];
    return nil;
}


@end
