//
//  SettingsViewController.m
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 4/15/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *confirmPassword;

@end

@implementation SettingsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initializeUI];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
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
