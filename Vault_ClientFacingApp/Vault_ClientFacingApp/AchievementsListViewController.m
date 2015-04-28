//
//  AchievementsListViewController.m
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 4/21/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "AchievementsListViewController.h"
#import "AchievementListCollectionViewCell.h"

@interface AchievementsListViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property NSArray *achievementsArrayComplete;

@end

@implementation AchievementsListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.achievementsArrayComplete = @[[UIImage imageNamed:@"acorn.png"],
                                       [UIImage imageNamed:@"adduser.png"],
                                       [UIImage imageNamed:@"badge.png"],
                                       [UIImage imageNamed:@"bronze.png"],
                                       [UIImage imageNamed:@"cloud.png"],
                                       [UIImage imageNamed:@"crosshair.png"],
                                       [UIImage imageNamed:@"cut.png"],
                                       [UIImage imageNamed:@"coffee.png"],
                                       [UIImage imageNamed:@"barchart.png"],
                                       [UIImage imageNamed:@"arrow.png"],
                                       [UIImage imageNamed:@"adduser.png"],
                                       [UIImage imageNamed:@"arrow.png"],
                                       [UIImage imageNamed:@"acorn.png"],
                                       [UIImage imageNamed:@"adduser.png"],
                                       [UIImage imageNamed:@"badge.png"],
                                       [UIImage imageNamed:@"bronze.png"],
                                       [UIImage imageNamed:@"cloud.png"],
                                       [UIImage imageNamed:@"crosshair.png"],
                                       [UIImage imageNamed:@"cut.png"],
                                       [UIImage imageNamed:@"coffee.png"],
                                       [UIImage imageNamed:@"barchart.png"],
                                       [UIImage imageNamed:@"arrow.png"],
                                       [UIImage imageNamed:@"adduser.png"],
                                       [UIImage imageNamed:@"arrow.png"],
                                       [UIImage imageNamed:@"acorn.png"],
                                       [UIImage imageNamed:@"adduser.png"],
                                       [UIImage imageNamed:@"badge.png"],
                                       [UIImage imageNamed:@"bronze.png"],
                                       [UIImage imageNamed:@"cloud.png"],
                                       [UIImage imageNamed:@"crosshair.png"],
                                       [UIImage imageNamed:@"cut.png"],
                                       [UIImage imageNamed:@"coffee.png"],
                                       [UIImage imageNamed:@"barchart.png"],
                                       [UIImage imageNamed:@"arrow.png"],
                                       [UIImage imageNamed:@"adduser.png"],
                                       [UIImage imageNamed:@"arrow.png"],
                                       ];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - UICollectionView Delegate Methods
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.achievementsArrayComplete.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AchievementListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"achievementCellID" forIndexPath:indexPath];
    
    cell.badgeImage.image = [self.achievementsArrayComplete objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertView *badgeInfo = [[UIAlertView alloc] initWithTitle:@"Badge Name" message:@"Bagde Description" delegate:self cancelButtonTitle:@"Dimiss" otherButtonTitles: nil];
    [badgeInfo show];
}

@end
