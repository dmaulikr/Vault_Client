//
//  SettingsViewController.m
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 4/15/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "SettingsViewController.h"
#import "Helpers.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *confirmPassword;
@property NSMutableData *responseData;

@end

@implementation SettingsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"Settings User:%@", _currentUser.authToken);
    [self initializeUI];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

- (IBAction)saveEditedProfileInfo:(UIButton *)sender
{
    if ([self.name.text isEqualToString:@""] ||
        [self.username.text isEqualToString:@""] ||
        [self.email.text isEqualToString:@""] ||
        [self.password.text isEqualToString:@""] ||
        [self.confirmPassword.text isEqualToString:@""])
    {
        UIAlertView *fieldCompletionFailed = [[UIAlertView alloc] initWithTitle:@"Hold Up" message:@"All fields must be completed" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        [fieldCompletionFailed show];
    }else{
        [self createUserSettingsEditDictionary];
    }
}

-(void)createUserSettingsEditDictionary
{
    NSString *name = self.name.text;
    NSString *username = self.username.text;
    NSString *email = self.email.text;
    NSString *password = self.password.text;
    NSString *confirmation = self.confirmPassword.text;
    
    NSDictionary *user = @{@"user": @{@"name": name, @"username": username, @"email": email, @"password": password, @"confirmation": confirmation}};
    [self checkWithServer:user];
}

-(void)checkWithServer:(NSDictionary *)userSettingsEdited
{
    NSData *jsonData;
    NSError *error;
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://coderexp.herokuapp.com/api/v1/users"]];
    request.HTTPMethod = @"PUT";
    [request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    jsonData = [NSJSONSerialization dataWithJSONObject:userSettingsEdited options:NSJSONWritingPrettyPrinted error:&error];
    request.HTTPBody = jsonData;
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (!connection){
        UIAlertView *registrationFailed = [[UIAlertView alloc] initWithTitle:@"Stop!" message:@"Server connection failed." delegate:self cancelButtonTitle:@"Dimiss" otherButtonTitles:nil];
        [registrationFailed show];
    }
}

#pragma mark - URL Connection Delegate Methods
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    if([Helpers handleServerErrors:response]){
        UIAlertView *settingsInfoSaved = [[UIAlertView alloc] initWithTitle:@"Yay!" message:@"User Information Saved" delegate:self cancelButtonTitle:@"Dimiss" otherButtonTitles:nil];
        [settingsInfoSaved show];
        
        [self performSegueWithIdentifier:@"settingsSavedSegueID" sender:self];
    }
    else{
        UIAlertView *registrationFailed = [[UIAlertView alloc] initWithTitle:@"Stop!" message:@"Status code != 200" delegate:self cancelButtonTitle:@"Dimiss" otherButtonTitles:nil];
        [registrationFailed show];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_responseData appendData:data];
    NSLog(@"String sent from server %@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Connection:%@", connection);
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Error: %@", error);
}

- (IBAction)accountLogout:(UIButton *)sender
{
    NSDictionary *authToken = @{@"auth_token":_currentUser.authToken};
    [self checkWithServerForLogout:authToken];
}

-(void)checkWithServerForLogout:(NSDictionary *)authToken
{
    NSData *jsonData;
    NSError *error;
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://coderexp.herokuapp.com/api/v1/users"]];
    request.HTTPMethod = @"DELETE";
    [request setValue:@"appplication/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    jsonData = [NSJSONSerialization dataWithJSONObject:authToken options:NSJSONWritingPrettyPrinted error:&error];
    request.HTTPBody = jsonData;
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (!connection) {
        UIAlertView *registrationFailed = [[UIAlertView alloc] initWithTitle:@"Stop!" message:@"Server connection failed." delegate:self cancelButtonTitle:@"Dimiss" otherButtonTitles:nil];
        [registrationFailed show];
    }
}

-(void)initializeUI
{
    NSArray *textFields = @[self.name, self.username, self.email, self.password, self.confirmPassword];
    
    for (UITextField *field in textFields) {
           field.attributedPlaceholder = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@", field.placeholder] attributes:@{NSForegroundColorAttributeName: [UIColor darkGrayColor]}];
        field.tintColor = [UIColor whiteColor];
    }
}

@end
