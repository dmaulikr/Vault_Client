//
//  DevIntroParentViewController.m
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 5/6/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "DevIntroParentViewController.h"
#import "DevIntroChildViewController.h"

@interface DevIntroParentViewController () <UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageController;
@property UIButton *continueToApp;

@end

@implementation DevIntroParentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initializePageController];
    
    _continueToApp = [UIButton buttonWithType:UIButtonTypeCustom];
    _continueToApp.frame = CGRectMake(self.view.frame.size.width/2 - 50, self.view.frame.size.height/3, 100, 50);
    [_continueToApp setTitle:@"CONTINUE" forState:UIControlStateNormal];
    [_continueToApp setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_continueToApp addTarget:self action:@selector(continueToAppSegue:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_continueToApp];
    [self hideContinueButton];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(void)showContinueButton
{
    [_continueToApp setHidden:NO];
    [_continueToApp setEnabled:YES];
}

-(void)hideContinueButton
{
    [_continueToApp setHidden:YES];
    [_continueToApp setEnabled:NO];
}

-(IBAction)continueToAppSegue:(UIButton *)sender
{
    [self performSegueWithIdentifier:@"enterAppSegueID" sender:self];
}

-(void)initializePageController
{
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageController.dataSource = self;
    self.pageController.view.frame = self.view.frame;
    
    DevIntroChildViewController *firstVC = [self viewControllerAtIndex:0];
    NSArray *vcs = @[firstVC];
    [self.pageController setViewControllers:vcs direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.pageController];
    [self.view addSubview:self.pageController.view];
    [self.pageController didMoveToParentViewController:self];
}

#pragma mark - UIPageController Datasource Methods
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return 4;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [(DevIntroChildViewController *)viewController pageIndex];
    
    if (index == 0) {
        return nil;
    }
    
    index--;
    
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [(DevIntroChildViewController *)viewController pageIndex];

    index++;
    
    if (index == 4) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
}

- (DevIntroChildViewController *)viewControllerAtIndex:(NSUInteger)index
{
    DevIntroChildViewController *childViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"devIntroChildViewController"];
    childViewController.pageIndex = index;
    
    if (index >= 3) {
        [self showContinueButton];
    }else{
        [self hideContinueButton];
    }
    
    return childViewController;
    
}

@end
