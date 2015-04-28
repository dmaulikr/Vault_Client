//
//  SkillTreeViewController.m
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 4/9/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "SkillTreeViewController.h"
#import "Helpers.h"

@interface SkillTreeViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *skillTreeScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *skillTreeImageView;
@property (weak, nonatomic) IBOutlet UIImageView *mainTrackToken;
@property (weak, nonatomic) IBOutlet UIImageView *leftTrackToken;
@property (weak, nonatomic) IBOutlet UIImageView *rightTrackToken;

@end

@implementation SkillTreeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self skillTreeNodeSystem];
    [self initializeScrollView];
    [self setAllTrackTokens];
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

-(void)initializeScrollView
{
    self.skillTreeScrollView.delegate = self;
    self.skillTreeScrollView.minimumZoomScale = 1.0;
    self.skillTreeScrollView.maximumZoomScale = 4.0;
    self.skillTreeScrollView.contentSize = self.skillTreeImageView.frame.size;
}

-(void)skillTreeNodeSystem
{
    [self initializeTokenUI];
}

-(void)initializeTokenUI
{
    self.mainTrackToken.image = [Helpers getProfilePicFromDefault];
    self.mainTrackToken.layer.cornerRadius = self.mainTrackToken.frame.size.width/2;
    self.mainTrackToken.clipsToBounds = YES;
    self.mainTrackToken.layer.borderColor = [UIColor whiteColor].CGColor;
    self.mainTrackToken.layer.borderWidth = 5.0f;
}

-(void)setAllTrackTokens
{
    [self SetMainToken:1];
    [self SetLeftToken:1];
    [self SetRightToken:1];
}

-(void)SetMainToken:(int)mainTrack
{
    switch (mainTrack) {
        case 2:
            self.mainTrackToken.transform = CGAffineTransformMakeTranslation(0, -self.view.frame.size.height/5);
            break;
        case 3:
            self.mainTrackToken.transform = CGAffineTransformMakeTranslation(0, -self.view.frame.size.height/2.5);
            break;
        case 4:
            self.mainTrackToken.transform = CGAffineTransformMakeTranslation(0, -self.view.frame.size.height/1.67);
            break;
        case 5:
            self.mainTrackToken.transform = CGAffineTransformMakeTranslation(0, -self.view.frame.size.height/1.25);
            break;
        default:
            break;
    }
}

-(void)SetLeftToken:(int)leftTrack
{
    
}

-(void)SetRightToken:(int)rightTrack
{
    
}

@end
