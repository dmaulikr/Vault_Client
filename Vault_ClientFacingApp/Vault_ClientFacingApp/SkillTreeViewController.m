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
    
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSData *imageData = [defaults dataForKey:@"profilePic"];
//    UIImage *profilePic = [UIImage imageWithData:imageData];
//    
//    if (!profilePic)
//    {
//        [self.startingPointLabel setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
//    }else{
//        [self.profileImageButton setBackgroundImage:profilePic forState:UIControlStateNormal];
//    }
    
    self.customGrey = [UIColor colorWithRed:(34/255.0) green:(34/255.0) blue:(34/255.0) alpha:1.0];
    self.view.backgroundColor = self.customGrey;
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
