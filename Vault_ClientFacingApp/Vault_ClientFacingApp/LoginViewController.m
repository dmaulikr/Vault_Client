//
//  LoginViewController.m
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 4/7/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *loginLogoImage;
@property (weak, nonatomic) IBOutlet UITextField *loginUsernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *loginPasswordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *loginRegisterButton;
@property (weak, nonatomic) IBOutlet UILabel *loginMotoLabel;

@property UIColor *customGrey;

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

#pragma mark - Convenience Stuff
    self.customGrey = [UIColor colorWithRed:(34/255.0) green:(34/255.0) blue:(34/255.0) alpha:1.0];
    
#pragma mark - UI
    self.view.backgroundColor = self.customGrey;
    self.loginUsernameTextField.backgroundColor = self.customGrey;
    self.loginPasswordTextField.backgroundColor = self.customGrey;

#pragma mark - Instantiate Auto Layout
    [self addAutoLayoutConstraints];
}

#pragma mark - Status Bar Appereance
-(BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - Auto Layout
-(void)addAutoLayoutConstraints
{
    [self.view removeConstraints:self.view.constraints];
    
    UIImageView *logo = self.loginLogoImage;
    UITextField *username = self.loginUsernameTextField;
    UITextField *password = self.loginPasswordTextField;
    UIButton *loginButton = self.loginButton;
    UIButton *registerButton = self.loginRegisterButton;
    UILabel *moto = self.loginMotoLabel;
    
    self.loginUsernameTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"USER NAME" attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
    self.loginPasswordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"PASSWORD" attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];

    
    NSDictionary *layoutViews = NSDictionaryOfVariableBindings(logo, username, password, loginButton, registerButton, moto);
    NSDictionary *layoutMetrics = @{@"textfieldWidth":[NSNumber numberWithInt:self.view.frame.size.width/2],
                                    @"assetHeight":@30,
                                    @"assetWidth":[NSNumber numberWithInt:logo.frame.size.width],
                                    @"imageHeight":[NSNumber numberWithInt:self.view.frame.size.height/6],
                                    @"imageWidth":[NSNumber numberWithInt:self.view.frame.size.width/2.5],
                                    @"imagePadding":[NSNumber numberWithInt:self.view.frame.size.width/3.2],
                                    @"largePadding":[NSNumber numberWithInt:username.frame.size.height*3],
                                    @"smallPadding":@10,
                                    @"frameTopPadding":[NSNumber numberWithInt:self.view.frame.size.width/3],
                                    @"frameSidePadding":[NSNumber numberWithInt:self.view.frame.size.width/5]
                                    };
    
    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-imagePadding-[logo(imageWidth)]-imagePadding-|" options:0 metrics:layoutMetrics views:layoutViews];
    
    horizontalConstraints = [horizontalConstraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-frameSidePadding-[username]-frameSidePadding-|" options:0 metrics:layoutMetrics views:layoutViews]];
    
    horizontalConstraints = [horizontalConstraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-frameSidePadding-[password]-frameSidePadding-|" options:0 metrics:layoutMetrics views:layoutViews]];
    
    horizontalConstraints = [horizontalConstraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-frameSidePadding-[loginButton]-frameSidePadding-|" options:0 metrics:layoutMetrics views:layoutViews]];
    
    horizontalConstraints = [horizontalConstraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-frameSidePadding-[registerButton]-frameSidePadding-|" options:0 metrics:layoutMetrics views:layoutViews]];
    
    horizontalConstraints = [horizontalConstraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-frameSidePadding-[moto]-frameSidePadding-|" options:0 metrics:layoutMetrics views:layoutViews]];
    
    NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-frameTopPadding-[logo(<=imageHeight)]-50-[username(assetHeight)]-smallPadding-[password(assetHeight)]-smallPadding-[loginButton(assetHeight)]-smallPadding-[registerButton(assetHeight)]-largePadding-[moto]-smallPadding-|" options:0 metrics:layoutMetrics views:layoutViews];
    
    [self.view addConstraints:horizontalConstraints];
    [self.view addConstraints:verticalConstraints];
}

#pragma mark - Login Methods
- (IBAction)loginOnButtonPressed:(UIButton *)sender
{
    [self validateLoginCredentials];
}

-(void)validateLoginCredentials
{
    //if error
    
    //else login
    [self performSegueWithIdentifier:@"" sender:self];
}

#pragma mark - Resign Responders
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.loginUsernameTextField resignFirstResponder];
    [self.loginPasswordTextField resignFirstResponder];
}

@end
