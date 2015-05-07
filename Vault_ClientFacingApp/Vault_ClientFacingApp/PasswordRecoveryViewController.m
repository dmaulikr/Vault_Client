//
//  PasswordRecoveryViewController.m
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 4/20/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "PasswordRecoveryViewController.h"
#import "CustomColors.h"
#import "Helpers.h"

@interface PasswordRecoveryViewController ()

@property (weak, nonatomic) IBOutlet UITextField *passwordRecoveryEmailLabel;
@property NSMutableData *responseData;

@end

@implementation PasswordRecoveryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self customUI];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(void)customUI
{
    self.view.backgroundColor = UIColorFromRGB(DARK_GREY_HEX);
    
    self.passwordRecoveryEmailLabel.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"EMAIL" attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.passwordRecoveryEmailLabel resignFirstResponder];
}

- (IBAction)submitEmailForPasswordRecovery:(UIButton *)sender
{
    [self checkWithServer:self.passwordRecoveryEmailLabel.text];
}

-(void)checkWithServer:(NSString *)email
{
    NSData *jsonData;
    NSError *error;
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"coderexp.herokuapp.com/api/v1/users/password"]];
    request.HTTPMethod = @"PUT";
    [request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    jsonData = [NSJSONSerialization dataWithJSONObject:email options:NSJSONWritingPrettyPrinted error:&error];
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
        [self performSegueWithIdentifier:@"passwordRecoverySucessID" sender:self];
        
        UIAlertView *passwordRecovery = [[UIAlertView alloc] initWithTitle:@"Alright!" message:@"Please check your email for directions to reset your password." delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        [passwordRecovery show];
        
        NSLog(@"Success Response:%@",response);
    }
    else{
        UIAlertView *registrationFailed = [[UIAlertView alloc] initWithTitle:@"Stop!" message:@"Status code != 200" delegate:self cancelButtonTitle:@"Dimiss" otherButtonTitles:nil];
        [registrationFailed show];
        NSLog(@"Failure Response:%@",response);
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

@end
