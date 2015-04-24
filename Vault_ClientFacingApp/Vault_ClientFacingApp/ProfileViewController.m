//
//  ProfileViewController.m
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 4/9/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "ProfileViewController.h"
#import "CustomColors.h"
#import "SettingsViewController.h"
#import "Helpers.h"
#import "UserAchievementsCollectionViewCell.h"

@interface ProfileViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIAlertViewDelegate, UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *profileHeader;

@property (weak, nonatomic) IBOutlet UIButton *profileSkillTreeToggleButton;
@property (weak, nonatomic) IBOutlet UIButton *profileImageButton;

@property UIColor *customGrey;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *classLabel;
@property (weak, nonatomic) IBOutlet UILabel *levelLabel;
@property (weak, nonatomic) IBOutlet UILabel *missionLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentExpLabel;

@property UIImagePickerController *imagePickerController;
@property UIImage *profileImage;

@property (weak, nonatomic) IBOutlet UICollectionView *achievementsCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *userTrackingCollectionView;
@property (weak, nonatomic) IBOutlet UIProgressView *toNextLevelProgressView;

@property int expToNextLevel;

@property NSArray *userAchievements;
@property (weak, nonatomic) IBOutlet UIScrollView *profileScrollView;

@end

@implementation ProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
            
    self.customGrey = [UIColor colorWithRed:(34/255.0) green:(34/255.0) blue:(34/255.0) alpha:1.0];
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"exp_headerlogo"]];

    self.userAchievements = @[[UIImage imageNamed:@"acorn.png"],
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
    //[self setUpCustomViews];
    [self setDeveloperInfo];
    [self setDeveloperPhoto];
    [self configureExpToNextLevel:1 exp:720];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - Get/Set Developer Info
-(void)setDeveloperInfo
{
    self.nameLabel.text = [NSString stringWithFormat:@"HARRISON"];
    self.classLabel.text = @"iOS";
    self.levelLabel.text = @"1";
    self.missionLabel.text = @"CODER";
    self.currentExpLabel.text = @"720";
}

-(void)setDeveloperPhoto
{
    UIImage *profilePic = [Helpers getProfilePicFromDefault];
    
    if (!profilePic){
        [self.profileImageButton setBackgroundImage:[UIImage imageNamed:@"Icon-180.png"] forState:UIControlStateNormal];
    }
    else{
        [self.profileImageButton setBackgroundImage:profilePic forState:UIControlStateNormal];
    }
}

-(void)configureExpToNextLevel:(int)currentLevel exp:(int)exp
{
    if (currentLevel != 1)
    {
        int expBase = exp - (currentLevel * 1000);
        self.expToNextLevel = expBase;
    }
    else
    {
        self.expToNextLevel = exp;
    }
    
    self.toNextLevelProgressView.progress = (float)self.expToNextLevel/1000;
}

- (IBAction)takeProfilePicture:(UIButton *)sender
{
    UIAlertView *photoFormat = [[UIAlertView alloc] initWithTitle:@"Your Picture" message:@"Choose from your Photo Library or take a picture on your Camera" delegate:self cancelButtonTitle:@"Dimiss" otherButtonTitles:@"Photo Library", @"Camera", nil];
    [photoFormat show];
}

#pragma mark - UIAlertView Delegate Methods
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //Photo Library
    if (buttonIndex == 1)
    {
        [self photoFromLibrary];
    }
    //Camera
    else if(buttonIndex == 2)
    {
        //[self photoFromCamera];
    }
}

#pragma mark - UIImagePickerController Delegate Methods
-(void)photoFromLibrary
{
    self.imagePickerController = [UIImagePickerController new];
    self.imagePickerController.delegate = self;
    [self.imagePickerController setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [self presentViewController:self.imagePickerController animated:YES completion:nil];
}

//-(void)photoFromCamera
//{
//    self.imagePickerController = [UIImagePickerController new];
//    self.imagePickerController.delegate = self;
//    [self.imagePickerController setSourceType:UIImagePickerControllerSourceTypeCamera];
//    [self presentViewController:self.imagePickerController animated:YES completion:nil];
//}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    self.profileImage = info[UIImagePickerControllerOriginalImage];
    [self.profileImageButton setBackgroundImage:self.profileImage forState:UIControlStateNormal];
    
    [Helpers setProfilePicFromDefault:self.profileImage];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UICollectionView Delegate Methods
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.userAchievements.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UserAchievementsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"achievementsCellID" forIndexPath:indexPath];
    
    cell.userAchievementsImage.image = [self.userAchievements objectAtIndex:indexPath.row];
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(collectionView.bounds.size.width/5.7, collectionView.bounds.size.width/5.7);
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"achievementsSegueID" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"settingSegueID"])
    {
        SettingsViewController *settingsVC = segue.destinationViewController;
        settingsVC.hidesBottomBarWhenPushed = YES;
    }
}

@end
