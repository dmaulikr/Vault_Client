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
    [self setAllTrackTokens];
    [self initializeScrollView];
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
    [self SetMainToken:2];
    [self SetLeftToken:1];
    [self SetRightToken:1];
}

-(void)SetMainToken:(int)mainTrack
{
    [self.view removeConstraints:self.view.constraints];
    
    UIImageView *mainTrackToken = self.mainTrackToken;
    UIImageView *leftTrackToken = self.leftTrackToken;
    UIImageView *rightTrackToken = self.rightTrackToken;
    UIImageView *skillTree = self.skillTreeImageView;
    UIScrollView *scroll = self.skillTreeScrollView;
    
    double mainTokenYValue;
    
    switch (mainTrack) {
        case 1:
            mainTokenYValue = self.view.frame.size.height/5;
            break;
        case 2:
            break;
        case 3:
            break;
        case 4:
            break;
        case 5:
            break;
        default:
            break;
    }
    
    NSDictionary *assets = NSDictionaryOfVariableBindings(mainTrackToken, leftTrackToken, rightTrackToken, skillTree, scroll);
    NSDictionary *metrics = @{@"tokenWidth": @50,
                              @"tokenHeight":@50,
                              @"mainTokenYValue":@50,
                              };
    
    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[skillTree]-|" options:NSLayoutFormatAlignAllCenterX metrics:metrics views:assets];
    horizontalConstraints = [horizontalConstraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[scroll]-|" options:NSLayoutFormatAlignAllCenterX metrics:metrics views:assets]];
    
    NSArray *verticalCosntraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[scroll]-|" options:NSLayoutFormatAlignAllCenterX metrics:metrics views:assets];
    
    [self.view addConstraints:horizontalConstraints];
    [self.view addConstraints:verticalCosntraints];
}

-(void)SetLeftToken:(int)leftTrack
{
    
}

-(void)SetRightToken:(int)rightTrack
{
    
}

@end
