//
//  ClientRegistrationViewController.m
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 5/7/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "ClientRegistrationViewController.h"
#import "Helpers.h"
#import "CustomColors.h"

@interface ClientRegistrationViewController ()

@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *confirmation;
@property (weak, nonatomic) IBOutlet UITextField *email;

@end

@implementation ClientRegistrationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupUI];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(void)setupUI
{
    self.view.backgroundColor = UIColorFromRGB(DARK_GREY_HEX);
    
    self.name.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"CLIENT/COMPANY NAME" attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
    self.username.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"USER NAME" attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
    self.password.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"PASSWORD" attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
    self.confirmation.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"PASSWORD CONFIRMATION" attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
    self.email.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"CONTACT EMAIL" attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
}

- (IBAction)submitOnButtonPressed:(UIButton *)sender
{
    
}

@end
