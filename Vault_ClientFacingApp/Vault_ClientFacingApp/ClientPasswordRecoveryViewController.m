//
//  ClientPasswordRecoveryViewController.m
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 5/7/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "ClientPasswordRecoveryViewController.h"
#import "Helpers.h"
#import "CustomColors.h"

@interface ClientPasswordRecoveryViewController ()

@property (weak, nonatomic) IBOutlet UITextField *email;

@end

@implementation ClientPasswordRecoveryViewController

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
    
    self.email.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"CLIENT EMAIL" attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
}

@end
