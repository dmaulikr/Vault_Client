//
//  HubAchievementViewController.m
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 4/27/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "HubAchievementViewController.h"
#import "HubAchievementTableViewCell.h"

@interface HubAchievementViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation HubAchievementViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HubAchievementTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hubAchievementCellID"];
    
    cell.cellImage.image = [UIImage imageNamed:@"bolt.png"];
    
    return cell;
}

@end
