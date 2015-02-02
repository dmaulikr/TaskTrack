//
//  TTTaskManager.m
//  TaskTrack
//
//  Created by Mark Linington on 2/2/15.
//  Copyright (c) 2015 MarkLinington. All rights reserved.
//

#import "TTTaskManager.h"
#import "TTTask.h"
#import "TTTaskCell.h"

@interface TTTaskManager ()

@property (strong, atomic) NSIndexPath *selectedRow;

@end

@implementation TTTaskManager


- (instancetype) init
{
    self = [super init];
    if(self)
    {
        _selectedRow = nil;
        _taskArray = [[NSMutableArray alloc] init];
    }
    return self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return self.taskArray.count;
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
    
    TTTask *cellTask = self.taskArray[indexPath.row];
    [newCell updateViewWithTask:cellTask onManager:self];
    return newCell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle == UITableViewCellEditingStyleDelete)
    {
        [self.taskArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
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

@end
