//
//  HubVelocityViewController.m
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 4/27/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "HubVelocityViewController.h"
#import "CustomColors.h"
#import <KAProgressLabel/KAProgressLabel.h>

@interface HubVelocityViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet KAProgressLabel *progressLabel;
@property (weak, nonatomic) IBOutlet UILabel *velocityLabel;

@end

@implementation HubVelocityViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self intializeProgressLabel];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(void)intializeProgressLabel
{
    self.progressLabel.fillColor = [UIColor clearColor];
    self.progressLabel.trackColor = [UIColor clearColor];
    self.progressLabel.progressColor = UIColorFromRGB(GREEN_HEX);
    self.progressLabel.progress = .74;
    self.velocityLabel.text = [NSString stringWithFormat:@"%.1f", (self.progressLabel.progress * 10)];
    
    self.progressLabel.trackWidth = 17;         // Defaults to 5.0
    self.progressLabel.progressWidth = 17;        // Defaults to 5.0
    self.progressLabel.roundedCornersWidth = 0;
    self.progressLabel.transform = CGAffineTransformMakeRotation(M_PI_2 * 2);
    
    [self.view addSubview:self.progressLabel];
}

@end
