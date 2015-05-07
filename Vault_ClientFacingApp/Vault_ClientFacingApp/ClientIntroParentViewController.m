//
//  ClientIntroParentViewController.m
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 5/6/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "ClientIntroParentViewController.h"
#import "ClientIntroChildViewController.h"

@interface ClientIntroParentViewController () <UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageController;
@property UIButton *continueToApp;

@end

@implementation ClientIntroParentViewController

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
    [self performSegueWithIdentifier:@"enterClientAppSegueID" sender:self];
}

-(void)initializePageController
{
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageController.dataSource = self;
    self.pageController.view.frame = self.view.frame;
    
    ClientIntroChildViewController *firstVC = [self viewControllerAtIndex:0];
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
    NSUInteger index = [(ClientIntroChildViewController *)viewController pageIndex];
    
    if (index == 0) {
        return nil;
    }
    
    index--;
    
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [(ClientIntroChildViewController *)viewController pageIndex];
    
    index++;
    
    if (index == 4) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
}

- (ClientIntroChildViewController *)viewControllerAtIndex:(NSUInteger)index
{
    ClientIntroChildViewController *childViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"clientIntroChildViewController"];
    childViewController.pageIndex = index;
    
    if (index >= 3) {
        [self showContinueButton];
    }else{
        [self hideContinueButton];
    }
    
    return childViewController;
    
}


@end
