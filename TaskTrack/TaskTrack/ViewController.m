//
//  ViewController.m
//  TaskTrack
//
//  Created by Mark Linington on 1/30/15.
//  Copyright (c) 2015 MarkLinington. All rights reserved.
//

#import "ViewController.h"
#import "TTTaskCell.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (strong, atomic) NSIndexPath *selectedRow;
@property (strong, atomic) NSMutableArray *tasks;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.table.dataSource = self;
    self.table.delegate = self;
    self.selectedRow = nil;
    self.tasks = [[NSMutableArray alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.selectedRow && [indexPath compare:self.selectedRow] == NSOrderedSame)
        return 75;
    else return 40;
        
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

#pragma mark - UINavigationControllerDeleage

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"newTask"])
    {
        [(NewTaskViewController *)[segue destinationViewController] setDelegate:self];
    }
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return self.tasks.count;
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
    TTTaskCell *newCell = [self.table dequeueReusableCellWithIdentifier:@"smallCell" forIndexPath:indexPath];
    if(!newCell)
        newCell = [[TTTaskCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"smallCell"];
    
    TTTask *cellTask = self.tasks[indexPath.row];
    [newCell updateViewWithTask:cellTask];
    return newCell;
}

#pragma mark - NewTaskViewControllerDelegate

- (void) viewController:(NewTaskViewController *)viewController withNewTask:(TTTask *)task
{
    [self.tasks addObject:task];
    NSLog(@"%@",task);
}


@end
