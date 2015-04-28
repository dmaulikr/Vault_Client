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
    
#pragma mark - Convenience Stuff
    self.customGrey = [UIColor colorWithRed:(34/255.0) green:(34/255.0) blue:(34/255.0) alpha:1.0];
    
#pragma mark - UI
    self.view.backgroundColor = self.customGrey;
    
#pragma mark - Instantiate Auto Layout
    [self addAutoLayoutConstraints];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(void)addAutoLayoutConstraints
{
    [self.view removeConstraints:self.view.constraints];
    
    UIImageView *header = self.skillTreeHeader;
    UIButton *infoToggle = self.skillTreeToggleButton;
    
    NSDictionary *layoutViews = NSDictionaryOfVariableBindings(header, infoToggle);
    NSDictionary *layoutMetrics = @{@"imageWidth":[NSNumber numberWithInt:self.view.frame.size.width/4],
                                    @"imagePadding":[NSNumber numberWithInt:self.view.frame.size.width/2.7],
                                    @"imageHeight":[NSNumber numberWithInt:self.view.frame.size.height/15],
                                    @"smallPadding":@10};
    
    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-imagePadding-[header(imageWidth)]-50-[infoToggle]-|" options:0 metrics:layoutMetrics views:layoutViews];
    
    NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-smallPadding-[header(<=imageHeight)]-|" options:0 metrics:layoutMetrics views:layoutViews];
    
    verticalConstraints = [verticalConstraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-smallPadding-[infoToggle(<=imageHeight)]-|" options:0 metrics:layoutMetrics views:layoutViews]];
    
    [self.view addConstraints:horizontalConstraints];
    [self.view addConstraints:verticalConstraints];
}

@end
