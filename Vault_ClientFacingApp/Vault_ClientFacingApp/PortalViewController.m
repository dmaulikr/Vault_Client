//
//  PortalViewController.m
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 5/6/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "PortalViewController.h"
#import "CustomColors.h"
#import "Helpers.h"

@interface PortalViewController ()

@end

@implementation PortalViewController

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
}

- (IBAction)clientButton:(id)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![defaults boolForKey:@"firstTimeClient"]) {
        [defaults setBool:YES forKey:@"firstTimeClient"];
        [self performSegueWithIdentifier:@"firstTimeClientSegueID" sender:self];
    }else{
        [self performSegueWithIdentifier:@"returningClientSegueID" sender:self];
    }
}

- (IBAction)devButton:(id)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![defaults boolForKey:@"firstTimeDev"]) {
        [defaults setBool:YES forKey:@"firstTimeDev"];
        [self performSegueWithIdentifier:@"firstTimeDevSegueID" sender:self];
    }else{
        [self performSegueWithIdentifier:@"returningDevSegueID" sender:self];
    }
}

@end
