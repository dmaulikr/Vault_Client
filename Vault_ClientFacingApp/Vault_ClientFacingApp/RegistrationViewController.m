//
//  RegistrationViewController.m
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 4/7/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "RegistrationViewController.h"
#import "Helpers.h"
#import "CustomColors.h"
#import "RegistrationCollectionViewCell.h"
#import <Devise/Devise.h>

@interface RegistrationViewController () <UIImagePickerControllerDelegate, UINavigationBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate, NSURLConnectionDataDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *registrationLogoHeader;
@property (weak, nonatomic) IBOutlet UITextField *registrationFullnameTextField;
@property (weak, nonatomic) IBOutlet UITextField *registrationUsernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *registrationEmailTextField;
@property (weak, nonatomic) IBOutlet UITextField *registrationPasswordTextField;
@property (weak, nonatomic) IBOutlet UIButton *registrationCompleteButton;
@property UIColor *customGrey;
@property NSDictionary *registrationCredentials;
@property NSInteger responseStatusCode;
@property NSMutableData *responseData;
@property NSInteger trackSelectionIndex;
@property NSArray *trackArray;

@end

@implementation RegistrationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initialSetup];
    [self customUI];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(void)initialSetup
{
    self.trackSelectionIndex = 1;
    self.trackArray = @[@"SELECT ONE", @"MOBILE MAKERS", @"DEV BOOTCAMP", @"DESIGNATION", @"GENERAL ASSEMBLY", @"STARTUP INSTITUTE"];
}

- (IBAction)completeRegistrationOnButtonPressed:(UIButton *)sender
{
    if ([self.registrationFullnameTextField.text isEqualToString:@""] ||
        [self.registrationUsernameTextField.text isEqualToString:@""] ||
        [self.registrationEmailTextField.text isEqualToString:@""] ||
        [self.registrationPasswordTextField.text isEqualToString:@""])
    {
        UIAlertView *fieldCompletionFailed = [[UIAlertView alloc] initWithTitle:@"Hold Up" message:@"All fields must be completed" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        [fieldCompletionFailed show];
    }else{
        [self createUserRegistrationDictionary];
    }
}

-(void)createUserRegistrationDictionary
{
    //NSString *fullName = self.registrationFullnameTextField.text;
    //NSString *username = self.registrationUsernameTextField.text;
    //NSString *password = self.registrationPasswordTextField.text;
    //NSString *email = self.registrationEmailTextField.text;
    //NSString *class = [self.registrationTrackSegmentControl titleForSegmentAtIndex:self.trackSelectionIndex];
    
    NSDictionary *user = @{@"user": @{@"email":@"harrison@coderexp.com", @"password":@"test1234", @"password_confirmation":@"test1234"}};
    
    [self checkWithServer:user];
}

-(void)checkWithServer: (NSDictionary*)userCredentials
{
    NSData *jsonData;
    NSError *error;
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://coderexp.herokuapp.com/api/v1/users"]];
    request.HTTPMethod = @"POST";
    [request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    jsonData = [NSJSONSerialization dataWithJSONObject:userCredentials options:NSJSONWritingPrettyPrinted error:&error];
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
        [self performSegueWithIdentifier:@"registrationSuccessSegueID" sender:self];
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

#pragma mark - UICollectionView Delegate Methods
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.trackArray.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    RegistrationCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"trackSelectionCellID" forIndexPath:indexPath];
    cell.backgroundColor = UIColorFromRGB(DARK_GREY_HEX);
    collectionView.backgroundColor = UIColorFromRGB(DARK_GREY_HEX);
    cell.cellLabel.text = [self.trackArray objectAtIndex:indexPath.row];
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize cellSize = CGSizeMake(collectionView.bounds.size.width, collectionView.bounds.size.height);
    return cellSize;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(void)customUI
{
    self.view.backgroundColor = UIColorFromRGB(DARK_GREY_HEX);
    self.registrationFullnameTextField.backgroundColor = self.customGrey;
    self.registrationUsernameTextField.backgroundColor = self.customGrey;
    self.registrationPasswordTextField.backgroundColor = self.customGrey;
    self.registrationEmailTextField.backgroundColor = self.customGrey;
    
    self.registrationFullnameTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"NAME" attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
    self.registrationUsernameTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"USER NAME" attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
    self.registrationPasswordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"PASSWORD" attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
    self.registrationEmailTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"EMAIL" attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.registrationFullnameTextField resignFirstResponder];
    [self.registrationUsernameTextField resignFirstResponder];
    [self.registrationPasswordTextField resignFirstResponder];
    [self.registrationEmailTextField resignFirstResponder];
}

@end
