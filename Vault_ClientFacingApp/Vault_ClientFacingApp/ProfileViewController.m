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
#import "HubVelocityViewController.h"
#import "CorePlotViewController.h"

@interface ProfileViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIAlertViewDelegate, UIScrollViewDelegate, UIPageViewControllerDataSource>

@property (weak, nonatomic) IBOutlet UIImageView *profileHeader;
@property (weak, nonatomic) IBOutlet UIButton *profileSkillTreeToggleButton;
@property (weak, nonatomic) IBOutlet UIButton *profileImageButton;
@property (strong, nonatomic) UIPageViewController *pageController;
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
@property (weak, nonatomic) IBOutlet UILabel *toNextLevelLabel;
@property int expToNextLevel;
@property NSArray *viewControllersArray;
@property NSArray *userAchievements;
@property (weak, nonatomic) IBOutlet UIScrollView *profileScrollView;

@end

@implementation ProfileViewController

- (void)viewDidLoad
{
    NSLog(@"User After:%@", _currentUser.authToken);
    
    [super viewDidLoad];
    [self initialSetup];
    [self initializePageController];
    [self setDeveloperInfo];
    [self setDeveloperPhoto];
    [self configureExpToNextLevel:1 exp:720];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(void)initialSetup
{
    self.customGrey = [UIColor colorWithRed:(34/255.0) green:(34/255.0) blue:(34/255.0) alpha:1.0];
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"exp_headerlogo"]];
    
    self.userAchievements = @[[UIImage imageNamed:@"acorn.png"],
                              [UIImage imageNamed:@"badge.png"],
                              [UIImage imageNamed:@"bronze.png"],
                              [UIImage imageNamed:@"cloud.png"],
                              [UIImage imageNamed:@"crosshair.png"],
                              [UIImage imageNamed:@"cut.png"],
                              [UIImage imageNamed:@"coffee.png"],
                              [UIImage imageNamed:@"barchart.png"],
                              [UIImage imageNamed:@"arrow.png"],
                              [UIImage imageNamed:@"arrow.png"],
                              ];
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
    self.toNextLevelProgressView.transform = CGAffineTransformMakeScale(1, 8);
    self.toNextLevelLabel.text = [NSString stringWithFormat:@"%d", (1000 - self.expToNextLevel)];
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

#pragma mark - UIPageController Datasource Methods
-(void)initializePageController
{
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageController.dataSource = self;
    
    [[self.pageController view] setFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.size.height/3, self.view.frame.size.width, self.view.frame.size.height/1.5)];
    
    HubVelocityViewController *velocity = [self viewControllerAtIndex:0];
    
    self.viewControllersArray = [NSArray arrayWithObject:velocity];
    
    [self.pageController setViewControllers:self.viewControllersArray direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    [self addChildViewController:self.pageController];
    [[self view] addSubview:[self.pageController view]];
    [self.pageController didMoveToParentViewController:self];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    
    NSUInteger index = [(HubVelocityViewController *)viewController index];
    
    if (index == 0) {
        return nil;
    }
    
    index--;
    
    return [self viewControllerAtIndex:index];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    
    NSUInteger index = [(CorePlotViewController *)viewController index];
    
    index++;
    
    if (index == 2)
    {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
    
}

- (UIViewController *)viewControllerAtIndex:(NSUInteger)index
{
    UIViewController *vc;
    
    if (index == 0)
    {
        HubVelocityViewController *velocity = [self.storyboard instantiateViewControllerWithIdentifier:@"velocityViewController"];
        velocity.index = index;
        vc = velocity;
    }else if (index == 1)
    {
        CorePlotViewController *achievements = [self.storyboard instantiateViewControllerWithIdentifier:@"CorePlotViewController"];
        achievements.index = index;
        vc = achievements;
    }
    
    return vc;
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    // The number of items reflected in the page indicator.
    return 2;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    // The selected item reflected in the page indicator.
    return 0;
}

#pragma mark - Prepare for Segue 
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"settingSegueID"])
    {
        UINavigationController *nav = segue.destinationViewController;
        SettingsViewController *settingsVC = [nav.viewControllers objectAtIndex:0];
        settingsVC.hidesBottomBarWhenPushed = YES;
        settingsVC.currentUser = _currentUser;
    }
}

@end
