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
@property (weak, nonatomic) IBOutlet UITextField *registrationPasswordConfirmation;
@property (weak, nonatomic) NSString *bootcampSelection;
@property (weak, nonatomic) NSString *developmentTrackSelection;
@property (weak, nonatomic) IBOutlet UIButton *registrationCompleteButton;
@property UIColor *customGrey;
@property NSDictionary *registrationCredentials;
@property NSInteger responseStatusCode;
@property NSMutableData *responseData;
@property NSInteger trackSelectionIndex;
@property NSArray *trackArray;
@property (weak, nonatomic) IBOutlet UIButton *iosButton;
@property (weak, nonatomic) IBOutlet UIButton *rubyButton;
@property (weak, nonatomic) IBOutlet UIButton *uiButton;
@property NSString *defaultURL;
@property NSString *loginURL;

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
    self.trackArray = @[@"SELECT ONE", @"MOBILE MAKERS", @"DEV BOOTCAMP", @"DESIGNATION", @"GENERAL ASSEMBLY", @"STARTUP INSTITUTE"];
    self.defaultURL = @"http://coderexp.herokuapp.com/api/v1/users";
    self.loginURL = @"coderexp.herokuapp.com/api/v1/users/sign_in";
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
    NSString *fullName = self.registrationFullnameTextField.text;
    NSString *username = self.registrationUsernameTextField.text;
    NSString *password = self.registrationPasswordTextField.text;
    NSString *email = self.registrationEmailTextField.text;
    NSString *confirmation = self.registrationPasswordConfirmation.text;
    
    NSDictionary *user = @{@"user": @{@"fullname":fullName,
                                      @"username":username,
                                      @"password":password,
                                      @"password_confirmation":confirmation,
                                      @"email":email,
                                     }};
    
    [self checkWithServer:user url:self.defaultURL];
}

-(void)checkWithServer: (NSDictionary*)userCredentials url:(NSString *)url
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
    //NSString *authToken = [Helpers getAuthToken:response];
    
    if([Helpers handleServerErrors:response]){
//        NSDictionary *user = @{@"email":self.registrationEmailTextField.text,
//                               @"password":self.registrationPasswordTextField.text,
//                               @"auth_token":authToken
//                               };
//        
//        [self checkWithServer:user url:self.loginURL];
        NSLog(@"Awesome");
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
    self.bootcampSelection = [self.trackArray objectAtIndex:indexPath.row];
}

#pragma mark - UI
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
    self.registrationPasswordConfirmation.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"PASSWORD CONFIRMATION" attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
    self.registrationEmailTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"EMAIL" attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
}

-(IBAction)selectDevelopmentTrack:(UIButton *)sender
{
    self.developmentTrackSelection = sender.titleLabel.text;
    
    NSArray *devTrackButtons = @[self.iosButton, self.rubyButton, self.uiButton];
    
    for (UIButton *button in devTrackButtons) {
        if (button != sender && sender.enabled) {
            button.backgroundColor = [UIColor clearColor];
            button.layer.borderWidth = 0;
        }else{
            button.layer.borderColor = [UIColor whiteColor].CGColor;
            button.layer.borderWidth = 1.0;
        }
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSArray *textFields = @[self.registrationFullnameTextField, self.registrationUsernameTextField, self.registrationPasswordTextField, self.registrationPasswordConfirmation, self.registrationEmailTextField];
    
    for (UITextField *field in textFields) {
        [field resignFirstResponder];
    }
}

@end
