//
//  PasswordRecoveryViewController.m
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 4/20/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "PasswordRecoveryViewController.h"
#import "CustomColors.h"

@interface PasswordRecoveryViewController ()

@property (weak, nonatomic) IBOutlet UITextField *passwordRecoveryEmailLabel;

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

@end
