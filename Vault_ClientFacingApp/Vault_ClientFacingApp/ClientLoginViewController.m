//
//  ClientLoginViewController.m
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 5/7/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "ClientLoginViewController.h"
#import "Helpers.h"
#import "CustomColors.h"

@interface ClientLoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;

@end

@implementation ClientLoginViewController

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
    self.registerButton.layer.borderColor = UIColorFromRGB(PINK_HEX).CGColor;
    self.registerButton.layer.borderWidth = 1.0;
    
    self.email.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"CLIENT EMAIL" attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
    self.password.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"CLIENT PASSWORD" attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
}

- (IBAction)loginOnButtonPressed:(UIButton *)sender
{
    
}

@end
