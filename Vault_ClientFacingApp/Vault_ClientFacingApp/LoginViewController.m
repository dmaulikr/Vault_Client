//
//  LoginViewController.m
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 4/7/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "LoginViewController.h"
#import "Helpers.h"
#import <Devise/Devise.h>

@interface LoginViewController () <NSURLConnectionDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *loginLogoImage;
@property (weak, nonatomic) IBOutlet UITextField *loginEmailTextField;
@property (weak, nonatomic) IBOutlet UITextField *loginPasswordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *loginRegisterButton;
@property (weak, nonatomic) IBOutlet UILabel *loginMotoLabel;
@property NSMutableData *responseData;
@property UIColor *customGrey;
@property NSInteger responseStatusCode;

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    [self customUI];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - Login Methods
- (IBAction)loginOnButtonPressed:(UIButton *)sender
{
    [self createUserInfoDictionary];
}

-(void)createUserInfoDictionary
{
    NSString *email = self.loginEmailTextField.text;
    NSString *password = self.loginPasswordTextField.text;
    
    NSDictionary *user = @{@"user":@{@"login":email, @"password":password}};
    
    [self checkWithServer:user];
}

#pragma mark - URL Post Request
-(void)checkWithServer: (NSDictionary*)userCredentials
{
    NSData *jsonData;
    NSError *error;
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"coderexp.herokuapp.com"]];
    request.HTTPMethod = @"POST";
    [request setValue:@"application/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    jsonData = [NSJSONSerialization dataWithJSONObject:userCredentials options:NSJSONWritingPrettyPrinted error:&error];
    request.HTTPBody = jsonData;
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (!connection)
    {
        UIAlertView *loginFailed = [[UIAlertView alloc] initWithTitle:@"Stop!" message:@"Server connection failed." delegate:self cancelButtonTitle:@"Dimiss" otherButtonTitles:nil];
        [loginFailed show];
    }
}

#pragma mark - URL Connection Delegate Methods
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    _responseData = [[NSMutableData alloc] init];
    
    if([Helpers handleServerErrors:response])
    {
        [self performSegueWithIdentifier:@"loginSuccessSegueID" sender:self];
    }
    else
    {
        UIAlertView *loginFailed = [[UIAlertView alloc] initWithTitle:@"Stop!" message:@"Status code != 202" delegate:self cancelButtonTitle:@"Dimiss" otherButtonTitles:nil];
        [loginFailed show];
    }
}

#pragma mark - Resign Responders
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.loginEmailTextField resignFirstResponder];
    [self.loginPasswordTextField resignFirstResponder];
}

#pragma mark - Auto Layout
-(void)customUI
{
    self.view.backgroundColor = UIColorFromRGB(DARK_GREY_HEX);
    self.loginRegisterButton.layer.borderColor = UIColorFromRGB(PINK_HEX).CGColor;
    self.loginRegisterButton.layer.borderWidth = 1.0;
    
    self.loginEmailTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"EMAIL" attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
    self.loginPasswordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"PASSWORD" attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
}

@end