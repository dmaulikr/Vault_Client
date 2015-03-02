//
//  FAQViewController.m
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 2/24/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "FAQViewController.h"

@interface FAQViewController ()

@end

@implementation FAQViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[self navigationController] setNavigationBarHidden:YES];
    [self performSegueWithIdentifier:@"faqSegueID" sender:self];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
