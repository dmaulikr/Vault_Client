//
//  MVPIntroChildViewController.m
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 5/15/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "MVPIntroChildViewController.h"
#import "CustomColors.h"

@interface MVPIntroChildViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong, nonatomic) NSArray *screensArray;
@property (weak, nonatomic) IBOutlet UIButton *startButton;

@end

@implementation MVPIntroChildViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _screensArray = @[[UIImage imageNamed:@"Intro_Intro-45"],
                      [UIImage imageNamed:@"Intro_Intro-46"],
                      [UIImage imageNamed:@"Intro_Intro-47"],
                      [UIImage imageNamed:@"Intro_Intro-48"],
                      [UIImage imageNamed:@"Intro_Intro-49"]];
    
    _imageView.image = [_screensArray objectAtIndex:_index];
    _imageView.frame = self.view.frame;
    _pageControl.frame = CGRectMake(self.view.frame.size.width/2 - _pageControl.frame.size.width/2, self.view.frame.size.height/3, _pageControl.frame.size.width, _pageControl.frame.size.height);
    _startButton.frame = CGRectMake(self.view.frame.size.width/2 - _startButton.frame.size.width/2, self.view.frame.size.height/2.2, _startButton.frame.size.width, _startButton.frame.size.height);
    _pageControl.pageIndicatorTintColor = [UIColor blackColor];
    [_pageControl setEnabled:NO];
    [_pageControl setCurrentPage:_index];
    self.view.backgroundColor = UIColorFromRGB(DARK_GREY_HEX);
    
    if (_index > 3) {
        [_startButton setHidden:NO];
        [_startButton setEnabled:YES];
        _pageControl.transform = CGAffineTransformMakeTranslation(0, -10);
    }else{
        [_startButton setHidden:YES];
        [_startButton setEnabled:NO];
    }
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
