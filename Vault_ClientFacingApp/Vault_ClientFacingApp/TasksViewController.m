//
//  TasksViewController.m
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 4/21/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "TasksViewController.h"
#import "SettingsViewController.h"
#import "TaskTableViewCell.h"

@interface TasksViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation TasksViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tabBarController setSelectedIndex:1];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - UITableView Delegate Methods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TaskTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"taskCellID"];
    
    //tableView.rowHeight = tableView.frame.size.height/5.4;
    cell.points.text = @"4";
    cell.epicTag.text = @"home feed";
    cell.descriptionLabel.text = @"As a user, I want to see my Pivotal Tracker backlog/current task list for my current project";
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toSettingsID"])
    {
        SettingsViewController *settingsVC = segue.destinationViewController;
        settingsVC.hidesBottomBarWhenPushed = YES;
    }
}

@end
