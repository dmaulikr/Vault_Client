//
//  LoginViewController.m
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 4/7/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "LoginViewController.h"
#import "Helpers.h"
#import "Users.h"
#import "ProfileViewController.h"
#import "SkillTreeViewController.h"

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
@property Users *currentUser;
@property BOOL success;

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self customUI];
    _success = false;
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - Login Methods
- (IBAction)loginOnButtonPressed:(UIButton *)sender
{
    if ([self.loginEmailTextField.text isEqualToString:@""] ||
        [self.loginPasswordTextField.text isEqualToString:@""])
    {
        UIAlertView *fieldCompletionFailed = [[UIAlertView alloc] initWithTitle:@"Hold Up" message:@"All fields must be completed" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        [fieldCompletionFailed show];
    }else{
        [self createUserInfoDictionary];
    }
}

-(void)createUserInfoDictionary
{
    NSString *email = self.loginEmailTextField.text;
    NSString *password = self.loginPasswordTextField.text;
    
    NSDictionary *user = @{@"user": @{@"email":email,
                                      @"password":password}};
    
    [self checkWithServer:user];
}

#pragma mark - URL Post Request
-(void)checkWithServer: (NSDictionary*)userCredentials
{
    NSData *jsonData;
    NSError *error;
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://coderexp.herokuapp.com/api/v1/users/sign_in"]];
    request.HTTPMethod = @"POST";
    [request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
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
    if([Helpers handleServerErrors:response]){
        NSLog(@"Awesome");
        _success = true;
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSError *error;
    
    [_responseData appendData:data];
    NSLog(@"String sent from server %@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    
    //get json dictionary of user info, transfer it to currentUser object and pass to other vc's
    NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];

    _currentUser = [Users new];
    _currentUser.authToken = [responseDict objectForKey:@"token"];
    
    if (![_currentUser.authToken isEqualToString:@""] && _success) {
        [self performSegueWithIdentifier:@"loginSuccessSegueID" sender:self];
    }else{
        UIAlertView *loginFailed = [[UIAlertView alloc] initWithTitle:@"Halt!" message:@"Login failed" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles: nil];
        [loginFailed show];
    }
    NSLog(@"Token Response:%@", _currentUser.authToken);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Connection:%@", connection);
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Error: %@", error);
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"loginSuccessSegueID"]) {
        UITabBarController *tab = (UITabBarController *)segue.destinationViewController;
        UINavigationController *nav = [tab.viewControllers objectAtIndex:1];
        ProfileViewController *profileVC = (ProfileViewController *)[nav.viewControllers objectAtIndex:0];
        profileVC.currentUser = _currentUser;
        NSLog(@"User Before:%@", _currentUser.authToken);
    }
}

@end
