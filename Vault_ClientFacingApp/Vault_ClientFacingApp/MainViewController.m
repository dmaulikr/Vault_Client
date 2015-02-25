//
//  MainViewController.m
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 2/24/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

//initial view buttons
@property (weak, nonatomic) IBOutlet UIButton *mobileButton;
@property (weak, nonatomic) IBOutlet UIButton *webButton;
@property (weak, nonatomic) IBOutlet UIButton *mobielAndWebButton;

//overlay 1 buttons
@property (weak, nonatomic) IBOutlet UIButton *basicButton;
@property (weak, nonatomic) IBOutlet UIButton *complexButton;
@property (weak, nonatomic) IBOutlet UIButton *mvpButton;

@property NSString *productIdea;
@property NSString *productNeed;
@property NSString *teamNeed;
@property NSString *budget;
@property NSString *contactName;
@property NSString *contactEmail;
@property NSString *contactAppDescription;

@property (weak, nonatomic) IBOutlet UIView *overlayView1;

@property CGRect overlay1InitialFrame;
@property CGRect overlay2InitialFrame;

@property UIView *view2;

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mobileButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.mobileButton.layer.borderWidth = 1;
    self.webButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.webButton.layer.borderWidth = 1;
    self.mobielAndWebButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.mobielAndWebButton.layer.borderWidth = 1;
    
    self.basicButton.layer.borderColor = [UIColor blackColor].CGColor;
    self.basicButton.layer.borderWidth = 1;
    self.complexButton.layer.borderColor = [UIColor blackColor].CGColor;
    self.complexButton.layer.borderWidth = 1;
    self.mvpButton.layer.borderColor = [UIColor blackColor].CGColor;
    self.mvpButton.layer.borderWidth = 1;
    
    [[self navigationController] setNavigationBarHidden:YES];
    
    self.overlay1InitialFrame = self.overlayView1.frame;
    
    self.view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 600, 600, 600)];
    self.view2.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.view2];
    
//    PFObject *client = [PFObject objectWithClassName:@"Client"];
//    client[@"productIdea"] = self.productIdea;
//    client[@"productNeed"] = self.productNeed;
//    client[@"teamNeed"] = self.teamNeed;
//    client[@"budget"] = self.budget;
//    client[@"contactName"] = self.contactName;
//    client[@"contactEmail"] = self.contactEmail;
//    client[@"contactAppDescription"] = self.contactAppDescription;
//    [client saveInBackground];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(IBAction)selectProjectPlatform:(UIButton *)sender
{
    [[self navigationController] setNavigationBarHidden:NO];
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];

    self.productIdea = sender.titleLabel.text;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.overlayView1.frame = self.view.frame;
    }];
    
    NSLog(@"%@", self.productIdea);
}

-(IBAction)selectProductNeed:(UIButton *)sender
{
    self.productNeed = sender.titleLabel.text;

    [UIView animateWithDuration:0.3 animations:^{
        self.view2.frame = self.view.frame;
    }];
    
    NSLog(@"%@", self.productNeed);
}

- (IBAction)resignCurrentOverlay:(UIBarButtonItem *)sender
{
    [UIView animateWithDuration:0.3 animations:^{
        self.overlayView1.frame = self.overlay1InitialFrame;
    }];
}

@end
