//
//  MainViewController.m
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 2/24/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController () <MFMailComposeViewControllerDelegate>

//initial view buttons
@property (weak, nonatomic) IBOutlet UIButton *mobileButton;
@property (weak, nonatomic) IBOutlet UIButton *webButton;
@property (weak, nonatomic) IBOutlet UIButton *mobielAndWebButton;

@property NSString *productIdea;
@property NSString *productNeed;
@property NSString *teamNeed;
@property NSString *budget;
@property NSString *contactName;
@property NSString *contactEmail;
@property NSString *contactAppDescription;

@property UIView *view2;
@property UIView *view3;
@property UIView *view4;
@property UIView *view5;
@property UIView *view6;

@property UIColor *customGreen;
@property UIColor *customBlue;
@property UIColor *customPink;
@property UIColor *customDarkGrey;

@property UITextField *name;
@property UITextField *email;
@property UITextField *appDescription;

@property MFMailComposeViewController *mailVC;

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mailVC = [[MFMailComposeViewController alloc] init];
    
    self.mobileButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.mobileButton.layer.borderWidth = 1;
    self.webButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.webButton.layer.borderWidth = 1;
    self.mobielAndWebButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.mobielAndWebButton.layer.borderWidth = 1;

    [[self navigationController] setNavigationBarHidden:YES];
    
    self.customGreen = [UIColor colorWithRed:(168/255.0) green:(230/255.0) blue:(46/255.0) alpha:1.0];
    self.customBlue = [UIColor colorWithRed:(96/255.0) green:(213/255.0) blue:(240/255.0) alpha:1.0];
    self.customPink = [UIColor colorWithRed:(251/255.0) green:(38/255.0) blue:(108/255.0) alpha:1.0];
    self.customDarkGrey = [UIColor colorWithRed:(34/255.0) green:(34/255.0) blue:(34/255.0) alpha:1.0];
    
    //Product Need Overlay (#2)
    self.view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 465, 600, 600)];
    self.view2.backgroundColor = self.customBlue;
    [self.view addSubview:self.view2];
    
    UILabel *productNeedLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view2.frame.origin.x + 130, self.view2.frame.origin.y - 300, 345, 30)];
    productNeedLabel.text = @"Product Need";
    productNeedLabel.textColor = [UIColor blackColor];
    
    UIButton *mvp = [UIButton buttonWithType:UIButtonTypeCustom];
    mvp.frame = CGRectMake(self.view2.frame.origin.x + 15, self.view2.frame.origin.y - 225, 345, 30);
    [mvp setTitle:@"MVP" forState:UIControlStateNormal];
    [mvp addTarget:self action:@selector(selectProductNeed:) forControlEvents:UIControlEventTouchUpInside];
    [mvp setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [mvp.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [mvp.layer setBorderWidth:1];
    
    UIButton *basic = [UIButton buttonWithType:UIButtonTypeCustom];
    basic.frame = CGRectMake(self.view2.frame.origin.x + 15, self.view2.frame.origin.y - 175, 345, 30);
    [basic setTitle:@"Basic" forState:UIControlStateNormal];
    [basic addTarget:self action:@selector(selectProductNeed:) forControlEvents:UIControlEventTouchUpInside];
    [basic setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [basic.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [basic.layer setBorderWidth:1];
    
    UIButton *complex = [UIButton buttonWithType:UIButtonTypeCustom];
    complex.frame = CGRectMake(self.view2.frame.origin.x + 15, self.view2.frame.origin.y - 125, 345, 30);
    [complex setTitle:@"Complex" forState:UIControlStateNormal];
    [complex addTarget:self action:@selector(selectProductNeed:) forControlEvents:UIControlEventTouchUpInside];
    [complex setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [complex.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [complex.layer setBorderWidth:1];
    
    [self.view2 addSubview:productNeedLabel];
    [self.view2 addSubview: mvp];
    [self.view2 addSubview:basic];
    [self.view2 addSubview:complex];
    
    //Team Need Overlay (#3)
    self.view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 515, 600, 600)];
    self.view3.backgroundColor = self.customGreen;
    [self.view addSubview:self.view3];
    
    UILabel *teamNeedLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view3.frame.origin.x + 145, self.view3.frame.origin.y - 325, 345, 30)];
    teamNeedLabel.text = @"Team Need";
    teamNeedLabel.textColor = [UIColor blackColor];
    
    UIButton *onePerson = [UIButton buttonWithType:UIButtonTypeCustom];
    onePerson.frame = CGRectMake(self.view3.frame.origin.x + 15, self.view3.frame.origin.y - 250, 345, 30);
    [onePerson setTitle:@"One Person" forState:UIControlStateNormal];
    [onePerson addTarget:self action:@selector(selectTeamNeeded:) forControlEvents:UIControlEventTouchUpInside];
    [onePerson setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [onePerson.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [onePerson.layer setBorderWidth:1];
    
    UIButton *smallTeam = [UIButton buttonWithType:UIButtonTypeCustom];
    smallTeam.frame = CGRectMake(self.view3.frame.origin.x + 15, self.view3.frame.origin.y - 200, 345, 30);
    [smallTeam setTitle:@"Small Team" forState:UIControlStateNormal];
    [smallTeam addTarget:self action:@selector(selectTeamNeeded:) forControlEvents:UIControlEventTouchUpInside];
    [smallTeam setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [smallTeam.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [smallTeam.layer setBorderWidth:1];
    
    UIButton *largeTeam = [UIButton buttonWithType:UIButtonTypeCustom];
    largeTeam.frame = CGRectMake(self.view3.frame.origin.x + 15, self.view3.frame.origin.y - 150, 345, 30);
    [largeTeam setTitle:@"Large Team" forState:UIControlStateNormal];
    [largeTeam addTarget:self action:@selector(selectTeamNeeded:) forControlEvents:UIControlEventTouchUpInside];
    [largeTeam setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [largeTeam.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [largeTeam.layer setBorderWidth:1];
    
    [self.view3 addSubview:teamNeedLabel];
    [self.view3 addSubview: onePerson];
    [self.view3 addSubview:smallTeam];
    [self.view3 addSubview:largeTeam];
    
    //Budget Overlay (#4)
    self.view4 = [[UIView alloc] initWithFrame:CGRectMake(0, 565, 600, 600)];
    self.view4.backgroundColor = self.customPink;
    [self.view addSubview:self.view4];
    
    UILabel *budgetLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view4.frame.origin.x + 165, self.view4.frame.origin.y - 350, 345, 30)];
    budgetLabel.text = @"Budget";
    budgetLabel.textColor = [UIColor blackColor];
    
    UIButton *small = [UIButton buttonWithType:UIButtonTypeCustom];
    small.frame = CGRectMake(self.view4.frame.origin.x + 15, self.view4.frame.origin.y - 275, 345, 30);
    [small setTitle:@"Small" forState:UIControlStateNormal];
    [small addTarget:self action:@selector(selectBudget:) forControlEvents:UIControlEventTouchUpInside];
    [small setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [small.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [small.layer setBorderWidth:1];
    
    UIButton *medium = [UIButton buttonWithType:UIButtonTypeCustom];
    medium.frame = CGRectMake(self.view4.frame.origin.x + 15, self.view4.frame.origin.y - 225, 345, 30);
    [medium setTitle:@"Medium" forState:UIControlStateNormal];
    [medium addTarget:self action:@selector(selectBudget:) forControlEvents:UIControlEventTouchUpInside];
    [medium setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [medium.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [medium.layer setBorderWidth:1];
    
    UIButton *large = [UIButton buttonWithType:UIButtonTypeCustom];
    large.frame = CGRectMake(self.view4.frame.origin.x + 15, self.view4.frame.origin.y - 175, 345, 30);
    [large setTitle:@"Large" forState:UIControlStateNormal];
    [large addTarget:self action:@selector(selectBudget:) forControlEvents:UIControlEventTouchUpInside];
    [large setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [large.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [large.layer setBorderWidth:1];
    
    [self.view4 addSubview:budgetLabel];
    [self.view4 addSubview: small];
    [self.view4 addSubview:medium];
    [self.view4 addSubview:large];
    
    //Contact Info Overlay (#5)
    self.view5 = [[UIView alloc] initWithFrame:CGRectMake(0, 615, 600, 600)];
    self.view5.backgroundColor = self.customDarkGrey;
    [self.view addSubview:self.view5];
    
    UILabel *contactInfo = [[UILabel alloc] initWithFrame:CGRectMake(self.view5.frame.origin.x + 135, self.view5.frame.origin.y - 400, 345, 30)];
    contactInfo.text = @"Contact Info";
    contactInfo.textColor = [UIColor whiteColor];
    
    self.name = [[UITextField alloc] initWithFrame:CGRectMake(self.view5.frame.origin.x + 30, self.view5.frame.origin.y - 325, 315, 30)];
    self.name.layer.borderColor = [UIColor whiteColor].CGColor;
    self.name.layer.borderWidth = 1;
    self.name.textColor = [UIColor whiteColor];
    
    self.email = [[UITextField alloc] initWithFrame:CGRectMake(self.view5.frame.origin.x + 30, self.view5.frame.origin.y - 275, 315, 30)];
    self.email.layer.borderColor = [UIColor whiteColor].CGColor;
    self.email.layer.borderWidth = 1;
    self.email.textColor = [UIColor whiteColor];
    
    self.appDescription = [[UITextField alloc] initWithFrame:CGRectMake(self.view5.frame.origin.x + 30, self.view5.frame.origin.y - 225, 315, 150)];
    self.appDescription.layer.borderColor = [UIColor whiteColor].CGColor;
    self.appDescription.layer.borderWidth = 1;
    self.appDescription.textColor = [UIColor whiteColor];
    
    UIButton *meetingTimes = [UIButton buttonWithType:UIButtonTypeCustom];
    meetingTimes.frame = CGRectMake(self.view5.frame.origin.x + 30, self.view5.frame.origin.y - 450, 315, 30);
    [meetingTimes setTitle:@"Kick Off Meeting" forState:UIControlStateNormal];
    [meetingTimes addTarget:self action:@selector(pickMeeting:) forControlEvents:UIControlEventTouchUpInside];
    [meetingTimes setTitleColor:self.customDarkGrey forState:UIControlStateNormal];
    [meetingTimes.layer setBackgroundColor:self.customGreen.CGColor];
    
    [self.view5 addSubview:contactInfo];
    [self.view5 addSubview:self.name];
    [self.view5 addSubview:self.email];
    [self.view5 addSubview:self.appDescription];
    [self.view5 addSubview: meetingTimes];
    
    //Kick Off Meeting Overlay (#6)
    self.view6 = [[UIView alloc] initWithFrame:CGRectMake(0, 700, 600, 600)];
    self.view6.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.view6];
    
    UIButton *submit = [UIButton buttonWithType:UIButtonTypeCustom];
    submit.frame = CGRectMake(self.view5.frame.origin.x + 30, self.view5.frame.origin.y - 450, 315, 30);
    [submit setTitle:@"Submit" forState:UIControlStateNormal];
    [submit addTarget:self action:@selector(submitDetails:) forControlEvents:UIControlEventTouchUpInside];
    [submit setTitleColor:self.customDarkGrey forState:UIControlStateNormal];
    [submit.layer setBackgroundColor:self.customGreen.CGColor];
    
    [self.view6 addSubview:submit];
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
        self.view2.frame = self.view.frame;
    }];
}

-(IBAction)selectProductNeed:(UIButton *)sender
{
    self.navigationController.navigationBar.barTintColor = self.customBlue;
    
    self.productNeed = sender.titleLabel.text;

    [UIView animateWithDuration:0.3 animations:^{
        self.view3.frame = self.view.frame;
    }];
}

-(IBAction)selectTeamNeeded:(UIButton *)sender
{
    self.navigationController.navigationBar.barTintColor = self.customGreen;
    
    self.teamNeed = sender.titleLabel.text;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.view4.frame = self.view.frame;
    }];
}

-(IBAction)selectBudget:(UIButton *)sender
{
    self.navigationController.navigationBar.barTintColor = self.customPink;
    
    self.budget = sender.titleLabel.text;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.view5.frame = self.view.frame;
    }];
}

-(IBAction)pickMeeting:(id)sender
{
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    
    self.contactName = self.name.text;
    self.contactEmail = self.email.text;
    self.contactAppDescription = self.appDescription.text;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.view6.frame = self.view.frame;
    }];
    
    NSLog(@"%@, %@, %@, %@, %@, %@, %@", self.productIdea, self.productNeed, self.teamNeed, self.budget, self.contactName, self.contactEmail, self.contactAppDescription);
}

-(IBAction)submitDetails:(UIButton *)sender
{
    PFObject *client = [PFObject objectWithClassName:@"Client"];
    client[@"productIdea"] = self.productIdea;
    client[@"productNeed"] = self.productNeed;
    client[@"teamNeed"] = self.teamNeed;
    client[@"budget"] = self.budget;
    client[@"contactName"] = self.contactName;
    client[@"contactEmail"] = self.contactEmail;
    client[@"contactAppDescription"] = self.contactAppDescription;
    [client saveInBackground];
    
    [self cycleTheGlobalMailComposer];
    self.mailVC.mailComposeDelegate = self;
    
    NSArray *emails = @[@"harrison@coderexp.com"];
    NSString *subject = @"New Client";
    NSString *message = @"Test Message!";
    
    [self.mailVC setToRecipients:emails];
    [self.mailVC setSubject:subject];
    [self.mailVC setMessageBody:message isHTML:NO];
    [self presentViewController:self.mailVC animated:YES completion:nil];

    //[self performSegueWithIdentifier:@"faqSegueID" sender:self];
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self cycleTheGlobalMailComposer];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)cycleTheGlobalMailComposer
{
    // we are cycling the damned GlobalMailComposer... due to horrible iOS issue
    self.mailVC = nil;
    self.mailVC = [[MFMailComposeViewController alloc] init];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.name resignFirstResponder];
    [self.email resignFirstResponder];
    [self.appDescription resignFirstResponder];
}

//- (IBAction)resignCurrentOverlay:(UIBarButtonItem *)sender
//{
//    [[self navigationController] setNavigationBarHidden:YES];
//
//    [UIView animateWithDuration:0.3 animations:^{
//        self.view2.frame = CGRectMake(0, 475, 600, 600);
//    }];
//}

@end
