//
//  SkillTreeViewController.m
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 4/9/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "SkillTreeViewController.h"

@interface SkillTreeViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *skillTreeScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *skillTreeImageView;

@end

@implementation SkillTreeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    self.skillTreeScrollView.delegate = self;
    self.skillTreeScrollView.minimumZoomScale = 1.0;
    self.skillTreeScrollView.maximumZoomScale = 4.0;
    self.skillTreeScrollView.contentSize = self.skillTreeImageView.frame.size;
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - UIScrollView Delegate Methods
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.skillTreeImageView;
}

@end
