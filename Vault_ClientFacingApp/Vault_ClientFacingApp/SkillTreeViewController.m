//
//  SkillTreeViewController.m
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 4/9/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "SkillTreeViewController.h"

@interface SkillTreeViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *skillTreeHeader;
@property (weak, nonatomic) IBOutlet UIButton *skillTreeToggleButton;
@property UIColor *customGrey;

@end

@implementation SkillTreeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.customGrey = [UIColor colorWithRed:(34/255.0) green:(34/255.0) blue:(34/255.0) alpha:1.0];
    self.view.backgroundColor = [UIColor blackColor];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
