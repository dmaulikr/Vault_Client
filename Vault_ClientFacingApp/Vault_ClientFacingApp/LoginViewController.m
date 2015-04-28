//
//  LoginViewController.m
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 4/7/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController () <NSURLConnectionDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *loginLogoImage;
@property (weak, nonatomic) IBOutlet UITextField *loginUsernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *loginPasswordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *loginRegisterButton;
@property (weak, nonatomic) IBOutlet UILabel *loginMotoLabel;

@property NSMutableData *responseData;
@property NSDictionary *loginCredentials;

@property UIColor *customGrey;

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

//Convenience Stuff
    self.customGrey = [UIColor colorWithRed:(34/255.0) green:(34/255.0) blue:(34/255.0) alpha:1.0];
    
//UI
    self.view.backgroundColor = self.customGrey;
    self.loginUsernameTextField.backgroundColor = self.customGrey;
    self.loginPasswordTextField.backgroundColor = self.customGrey;

    [self addAutoLayoutConstraints];
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
    NSString *username = self.loginUsernameTextField.text;
    NSString *password = self.loginPasswordTextField.text;
    
    self.loginCredentials = [[NSDictionary alloc]initWithObjectsAndKeys:@"username", username, @"password", password, nil];
    
    [self checkWithServer:self.loginCredentials];
}

#pragma mark - URL Post Request
-(void)checkWithServer: (NSDictionary*)userCredentials
{
    NSData *jsonData;
    NSError *error;
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@""]];
    request.HTTPMethod = @"POST";
    [request setValue:@"application/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    jsonData = [NSJSONSerialization dataWithJSONObject:userCredentials options:NSJSONWritingPrettyPrinted error:&error];
    request.HTTPBody = jsonData;
    
    [NSURLConnection sendAsynchronousRequest:request queue:NSOperationQueuePriorityNormal completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
    {
        [self performSegueWithIdentifier:@"" sender:self];
        
        if (connectionError)
        {
            UIAlertView *loginFailed = [[UIAlertView alloc] initWithTitle:@"Stop!" message:@"Your username and/or password is incorrect, please re-enter." delegate:self cancelButtonTitle:@"Dimiss" otherButtonTitles:nil];
            [loginFailed show];
        }
    }];
}

#pragma mark - URL Connection Delegate Methods
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    _responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // Append the new data to the instance variable you declared
    [_responseData appendData:data];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // The request is complete and data has been received
    // You can parse the stuff in your instance variable now
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
}

#pragma mark - Resign Responders
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.loginUsernameTextField resignFirstResponder];
    [self.loginPasswordTextField resignFirstResponder];
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

@end
