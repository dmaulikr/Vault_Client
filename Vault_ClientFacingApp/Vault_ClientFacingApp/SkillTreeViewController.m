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
@property (weak, nonatomic) IBOutlet UIImageView *mainTrackSubToken;

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
    
    [self.skillTreeImageView addSubview:self.mainTrackToken];
    [self.skillTreeImageView addSubview:self.leftTrackToken];
    [self.skillTreeImageView addSubview:self.rightTrackToken];
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
    
    self.leftTrackToken.image = [Helpers getProfilePicFromDefault];
    self.leftTrackToken.layer.cornerRadius = self.mainTrackToken.frame.size.width/2;
    self.leftTrackToken.clipsToBounds = YES;
    self.leftTrackToken.layer.borderColor = [UIColor whiteColor].CGColor;
    self.leftTrackToken.layer.borderWidth = 5.0f;
    
    self.rightTrackToken.image = [Helpers getProfilePicFromDefault];
    self.rightTrackToken.layer.cornerRadius = self.mainTrackToken.frame.size.width/2;
    self.rightTrackToken.clipsToBounds = YES;
    self.rightTrackToken.layer.borderColor = [UIColor whiteColor].CGColor;
    self.rightTrackToken.layer.borderWidth = 5.0f;
}

-(void)setAllTrackTokens
{
    [self SetMainToken:4 sub:5];
    [self SetLeftToken:3];
    [self SetRightToken:1];
}

-(double)setSubLevelRange:(int)sub
{
    return (-self.view.frame.size.height/2.5 - -self.view.frame.size.height/5) / 20 * sub - self.view.frame.size.height/4.95;
}

-(void)SetMainToken:(int)mainTrack sub:(int)mainSubTrack
{
    if (mainTrack > 0 && mainTrack <= 5 && mainSubTrack > 0 && mainSubTrack <=10) {
        switch (mainTrack) {
            case 1:
                self.mainTrackToken.transform = CGAffineTransformMakeTranslation(0, 0);
                self.mainTrackSubToken.transform = CGAffineTransformMakeTranslation(0, (-self.view.frame.size.height/4.95)/20 * mainSubTrack);
                break;
            case 2:
                self.mainTrackToken.transform = CGAffineTransformMakeTranslation(0, -self.view.frame.size.height/5);
                self.mainTrackSubToken.transform = CGAffineTransformMakeTranslation(0, [self setSubLevelRange:mainSubTrack]);
                break;
            case 3:
                self.mainTrackToken.transform = CGAffineTransformMakeTranslation(0, -self.view.frame.size.height/2.5);
                self.mainTrackSubToken.transform = CGAffineTransformMakeTranslation(0, [self setSubLevelRange:mainSubTrack] - self.view.frame.size.height/4.95);
                break;
            case 4:
                self.mainTrackToken.transform = CGAffineTransformMakeTranslation(0, -self.view.frame.size.height/1.67);
                self.mainTrackSubToken.transform = CGAffineTransformMakeTranslation(0, [self setSubLevelRange:mainSubTrack] - self.view.frame.size.height/4.95 * 2);
                break;
            case 5:
                self.mainTrackToken.transform = CGAffineTransformMakeTranslation(0, -self.view.frame.size.height/1.25);
                self.mainTrackSubToken.transform = CGAffineTransformMakeTranslation(0, 500);
                break;
            default:
                break;
        }
    }else{
        UIAlertView *incorrectLevels = [[UIAlertView alloc] initWithTitle:@"Nope!" message:@"Wrong levels" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles: nil];
        [incorrectLevels show];
    }
}

-(void)SetLeftToken:(int)leftTrack
{
    switch (leftTrack) {
        case 0:
            self.leftTrackToken.transform = CGAffineTransformMakeTranslation(0, 500);
            break;
        case 1:
            self.leftTrackToken.transform = CGAffineTransformMakeTranslation(0, 0);
            break;
        case 2:
            self.leftTrackToken.transform = CGAffineTransformMakeTranslation(0, -self.view.frame.size.height/5);
            break;
        case 3:
            self.leftTrackToken.transform = CGAffineTransformMakeTranslation(0, -self.view.frame.size.height/2.5);
            break;
        default:
            break;
    }
}

-(void)SetRightToken:(int)rightTrack
{
    switch (rightTrack) {
        case 0:
            self.leftTrackToken.transform = CGAffineTransformMakeTranslation(0, 500);
            break;
        case 1:
            self.rightTrackToken.transform = CGAffineTransformMakeTranslation(0, 0);
            break;
        case 2:
            self.rightTrackToken.transform = CGAffineTransformMakeTranslation(0, -self.view.frame.size.height/5);
            break;
        case 3:
            self.rightTrackToken.transform = CGAffineTransformMakeTranslation(0, -self.view.frame.size.height/2.5);
            break;
        default:
            break;
    }
}

@end
