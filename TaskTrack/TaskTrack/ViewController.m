//
//  ViewController.m
//  TaskTrack
//
//  Created by Mark Linington on 1/30/15.
//  Copyright (c) 2015 MarkLinington. All rights reserved.
//

#import "ViewController.h"
#import "TTTaskCell.h"
#import "TTTaskManager.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (strong, atomic) NSIndexPath *selectedRow;
@property (strong, atomic) TTTaskManager *tasks;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tasks = [[TTTaskManager alloc] init];
    self.table.dataSource = self.tasks;
    self.table.delegate = self.tasks;
    self.tasks.table = self.table;
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
    [self.tasks.taskArray addObject:task];
    NSLog(@"%@",task);
}


@end
