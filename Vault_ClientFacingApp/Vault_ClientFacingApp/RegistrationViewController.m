//
//  RegistrationViewController.m
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 4/7/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "RegistrationViewController.h"

@interface RegistrationViewController () <UIImagePickerControllerDelegate, UINavigationBarDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *registrationLogoHeader;
@property (weak, nonatomic) IBOutlet UITextField *registrationFullnameTextField;
@property (weak, nonatomic) IBOutlet UITextField *registrationUsernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *registrationPasswordTextField;
@property (weak, nonatomic) IBOutlet UITextField *registrationEmailTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *registrationTrackSegmentControl;
@property (weak, nonatomic) IBOutlet UIButton *registrationCompleteButton;
@property (weak, nonatomic) IBOutlet UIButton *registrationBackButton;
@property (weak, nonatomic) IBOutlet UILabel *registrationBottomMoto;

@property UIImage *profileImage;
//@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;

@property UIColor *customGrey;

@end

@implementation RegistrationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
#pragma mark - Convenience Stuff
    self.customGrey = [UIColor colorWithRed:(34/255.0) green:(34/255.0) blue:(34/255.0) alpha:1.0];
    
#pragma mark - UI
    self.view.backgroundColor = self.customGrey;
    self.registrationFullnameTextField.backgroundColor = self.customGrey;
    self.registrationUsernameTextField.backgroundColor = self.customGrey;
    self.registrationPasswordTextField.backgroundColor = self.customGrey;
    self.registrationEmailTextField.backgroundColor = self.customGrey;
    
#pragma mark - Instantiate Auto Layout
    [self addAutoLayoutConstraints];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(void)addAutoLayoutConstraints
{
    [self.view removeConstraints:self.view.constraints];
    
    UIImageView *header = self.registrationLogoHeader;
    UITextField *fullName = self.registrationFullnameTextField;
    UITextField *username = self.registrationUsernameTextField;
    UITextField *password = self.registrationPasswordTextField;
    UITextField *email = self.registrationEmailTextField;
    UISegmentedControl *track = self.registrationTrackSegmentControl;
    UIButton *submit = self.registrationCompleteButton;
    UIButton *back = self.registrationBackButton;
    UILabel *moto = self.registrationBottomMoto;
    
    self.registrationFullnameTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"FULL NAME" attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
    self.registrationUsernameTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"USER NAME" attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
    self.registrationPasswordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"PASSWORD" attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
    self.registrationEmailTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"EMAIL" attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
    
    NSDictionary *layoutViews = NSDictionaryOfVariableBindings(header, fullName, username, password, email, track, submit, back, moto);
    NSDictionary *layoutMetrics = @{@"textfieldWidth":[NSNumber numberWithInt:self.view.frame.size.width/2],
                                    @"assetHeight":@30,
                                    @"assetWidth":[NSNumber numberWithInt:self.view.frame.size.width/2.5],
                                    @"imageHeight":[NSNumber numberWithInt:self.view.frame.size.height/15],
                                    @"imageWidth":[NSNumber numberWithInt:self.view.frame.size.width/4],
                                    @"imagePadding":[NSNumber numberWithInt:self.view.frame.size.width/2.7],
                                    @"largePadding":[NSNumber numberWithInt:username.frame.size.height*3],
                                    @"smallPadding":@10,
                                    @"frameTopPadding":[NSNumber numberWithInt:self.view.frame.size.width/3],
                                    @"frameSidePadding":[NSNumber numberWithInt:self.view.frame.size.width/5]
                                    };
    
    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-imagePadding-[header(imageWidth)]-imagePadding-|" options:0 metrics:layoutMetrics views:layoutViews];
    
    horizontalConstraints = [horizontalConstraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-frameSidePadding-[fullName]-frameSidePadding-|" options:0 metrics:layoutMetrics views:layoutViews]];
    
    horizontalConstraints = [horizontalConstraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-frameSidePadding-[username]-frameSidePadding-|" options:0 metrics:layoutMetrics views:layoutViews]];
    
    horizontalConstraints = [horizontalConstraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-frameSidePadding-[password]-frameSidePadding-|" options:0 metrics:layoutMetrics views:layoutViews]];
    
    horizontalConstraints = [horizontalConstraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-frameSidePadding-[email]-frameSidePadding-|" options:0 metrics:layoutMetrics views:layoutViews]];
    
    horizontalConstraints = [horizontalConstraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-frameSidePadding-[track]-frameSidePadding-|" options:0 metrics:layoutMetrics views:layoutViews]];
    
    horizontalConstraints = [horizontalConstraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-frameSidePadding-[submit]-frameSidePadding-|" options:0 metrics:layoutMetrics views:layoutViews]];
    
    horizontalConstraints = [horizontalConstraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-frameSidePadding-[back]-frameSidePadding-|" options:0 metrics:layoutMetrics views:layoutViews]];
    
    horizontalConstraints = [horizontalConstraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-frameSidePadding-[moto]-frameSidePadding-|" options:0 metrics:layoutMetrics views:layoutViews]];
    
    NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[header(<=imageHeight)]-largePadding-[fullName(assetHeight)]-smallPadding-[username(assetHeight)]-smallPadding-[password(assetHeight)]-smallPadding-[email(assetHeight)]-smallPadding-[track(assetHeight)]-largePadding-[submit(assetHeight)]-smallPadding-[back(assetHeight)]-smallPadding-[moto]-smallPadding-|" options:NSLayoutFormatAlignAllCenterX metrics:layoutMetrics views:layoutViews];
    
    [self.view addConstraints:horizontalConstraints];
    [self.view addConstraints:verticalConstraints];
}

//- (IBAction)takeProfilePicture:(UIButton *)sender
//{
//    UIImagePickerController *imagePicker = [UIImagePickerController new];
//    imagePicker.delegate = self;
//    [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
//    [self presentViewController:imagePicker animated:YES completion:nil];
//}
//
//-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
//{
//    self.profileImage = info[UIImagePickerControllerOriginalImage];
//    [self.profileImageView setImage:self.profileImage];
//    
//    [self dismissViewControllerAnimated:YES completion:nil];
//}
//
//-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
//{
//    [self dismissViewControllerAnimated:YES completion:nil];
//}

- (IBAction)completeRegistrationOnButtonPressed:(UIButton *)sender
{
    [self checkRegistrationFieldCompletion];
}

-(void)checkRegistrationFieldCompletion
{
    [self registerNewUser];
}

-(void)registerNewUser
{
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.registrationFullnameTextField resignFirstResponder];
    [self.registrationUsernameTextField resignFirstResponder];
    [self.registrationPasswordTextField resignFirstResponder];
    [self.registrationEmailTextField resignFirstResponder];
}

@end
