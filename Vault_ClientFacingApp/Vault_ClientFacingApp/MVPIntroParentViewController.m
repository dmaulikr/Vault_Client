//
//  MVPIntroParentViewController.m
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 5/15/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "MVPIntroParentViewController.h"
#import "MVPIntroChildViewController.h"
#import "CustomColors.h"

@interface MVPIntroParentViewController () <UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageController;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation MVPIntroParentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColorFromRGB(DARK_GREY_HEX);
    
    _pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:0];
    _pageController.dataSource = self;
    _pageController.view.frame = self.view.frame;
    
    MVPIntroChildViewController *childVC = [self viewControllerAtIndex:0];
    
    [_pageController setViewControllers:@[childVC] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:_pageController];
    [self.view addSubview:_pageController.view];
    [_pageController didMoveToParentViewController:self];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [(MVPIntroChildViewController *)viewController index];
    
    if (index == 0) {
        return nil;
    }
    
    index--;
    
    return [self viewControllerAtIndex:index];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [(MVPIntroChildViewController *)viewController index];
    
    index++;
    
    if (index == 5) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
    
}

- (MVPIntroChildViewController *)viewControllerAtIndex:(NSUInteger)index
{
    MVPIntroChildViewController *childViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Child"];
    childViewController.index = index;
    
    return childViewController;
    
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
