//
//  LogViewController.m
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 4/21/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "LogViewController.h"
#import "SettingsViewController.h"
#import "LogTableViewCell.h"

@interface LogViewController ()

@end

@implementation LogViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - UITableView Delegate Methods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LogTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"logCellID"];
    
    //tableView.rowHeight = tableView.frame.size.height/9;
    cell.imageView.image = [UIImage imageNamed:@"Icon-180"];
    cell.imageView.layer.cornerRadius = cell.imageView.frame.size.width/2;
    cell.imageView.clipsToBounds = YES;
    
    cell.type.text = @"Earned";
    cell.nameOrComplete.text = @"AchievementName";
    cell.time.text = @"1d";
    cell.awardedToFrom.text = @"Horace Flournoy";

    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"logToSettingsSegueID"])
    {
        SettingsViewController *settingsVC = segue.destinationViewController;
        settingsVC.hidesBottomBarWhenPushed = YES;
    }
}

@end
