//
//  SettingsViewController.m
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 4/15/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property UIColor *customGrey;

@end

@implementation SettingsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.customGrey = [UIColor colorWithRed:(34/255.0) green:(34/255.0) blue:(34/255.0) alpha:1.0];
    self.view.backgroundColor = self.customGrey;
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
