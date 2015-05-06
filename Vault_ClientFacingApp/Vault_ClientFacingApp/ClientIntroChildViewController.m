//
//  ClientIntroChildViewController.m
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 5/6/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "ClientIntroChildViewController.h"

@interface ClientIntroChildViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *clientIntroImageView;
@property (weak, nonatomic) IBOutlet UILabel *clientIntroLabel;

@end

@implementation ClientIntroChildViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.clientIntroLabel.text = [NSString stringWithFormat:@"Screen Number #%ld", self.pageIndex];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
