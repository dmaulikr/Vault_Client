//
//  DevIntroChildViewController.m
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 5/6/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "DevIntroChildViewController.h"

@interface DevIntroChildViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *introImageView;
@property (weak, nonatomic) IBOutlet UILabel *introLabel;


@end

@implementation DevIntroChildViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.introLabel.text = [NSString stringWithFormat:@"Intro Screen #%ld", (long)self.pageIndex];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
