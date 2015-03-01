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
@property NSString *productIdea;
@property NSString *productNeed;
@property NSString *teamNeed;
@property NSString *budget;
@property NSString *contactName;
@property NSString *contactEmail;
@property NSString *contactAppDescription;

@property NSString *day1String;
@property NSString *day2String;
@property NSString *day3String;
@property NSString *day4String;
@property NSString *day5String;

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
@property UITextView *appDescription;

@property MFMailComposeViewController *mailVC;

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self getTime];
    
    self.mailVC = [[MFMailComposeViewController alloc] init];

    [[self navigationController] setNavigationBarHidden:YES];
    
    self.customGreen = [UIColor colorWithRed:(168/255.0) green:(230/255.0) blue:(46/255.0) alpha:1.0];
    self.customBlue = [UIColor colorWithRed:(96/255.0) green:(213/255.0) blue:(240/255.0) alpha:1.0];
    self.customPink = [UIColor colorWithRed:(251/255.0) green:(38/255.0) blue:(108/255.0) alpha:1.0];
    self.customDarkGrey = [UIColor colorWithRed:(34/255.0) green:(34/255.0) blue:(34/255.0) alpha:1.0];
    
    //Product Platform Overlay (#1)
    UILabel *productIdeaLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 50, self.view.frame.size.height/4, 150, 30)];
    productIdeaLabel.text = @"Product Idea";
    productIdeaLabel.textColor = [UIColor whiteColor];
    
    UIButton *mobile = [UIButton buttonWithType:UIButtonTypeCustom];
    mobile.frame = CGRectMake(self.view.frame.origin.x + 25, productIdeaLabel.frame.origin.y + 75, self.view.frame.size.width - 50, 30);
    [mobile setTitle:@"Mobile" forState:UIControlStateNormal];
    [mobile addTarget:self action:@selector(selectProjectIdea:) forControlEvents:UIControlEventTouchUpInside];
    [mobile setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [mobile.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [mobile.layer setBorderWidth:1];
    
    UIButton *web = [UIButton buttonWithType:UIButtonTypeCustom];
    web.frame = CGRectMake(self.view.frame.origin.x + 25, mobile.frame.origin.y + 50, self.view.frame.size.width - 50, 30);
    [web setTitle:@"Web" forState:UIControlStateNormal];
    [web addTarget:self action:@selector(selectProjectIdea:) forControlEvents:UIControlEventTouchUpInside];
    [web setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [web.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [web.layer setBorderWidth:1];
    
    UIButton *both = [UIButton buttonWithType:UIButtonTypeCustom];
    both.frame = CGRectMake(self.view.frame.origin.x + 25, web.frame.origin.y + 50, self.view.frame.size.width - 50, 30);
    [both setTitle:@"Both" forState:UIControlStateNormal];
    [both addTarget:self action:@selector(selectProjectIdea:) forControlEvents:UIControlEventTouchUpInside];
    [both setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [both.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [both.layer setBorderWidth:1];
    
    [self.view addSubview:productIdeaLabel];
    [self.view addSubview: mobile];
    [self.view addSubview:web];
    [self.view addSubview:both];
    
    //Product Need Overlay (#2)
    self.view2 = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/1.5, 600, 600)];
    self.view2.backgroundColor = self.customBlue;
    [self.view addSubview:self.view2];
    
    UILabel *productNeedLabel = [[UILabel alloc] initWithFrame:CGRectMake(productIdeaLabel.frame.origin.x, productIdeaLabel.frame.origin.y, productIdeaLabel.frame.size.width, productIdeaLabel.frame.size.height)];
    productNeedLabel.text = @"Product Need";
    productNeedLabel.textColor = [UIColor whiteColor];
    
    UIButton *mvp = [UIButton buttonWithType:UIButtonTypeCustom];
    mvp.frame = CGRectMake(self.view.frame.origin.x + 25, productIdeaLabel.frame.origin.y + 75, self.view.frame.size.width - 50, 30);
    [mvp setTitle:@"MVP" forState:UIControlStateNormal];
    [mvp addTarget:self action:@selector(selectProductNeed:) forControlEvents:UIControlEventTouchUpInside];
    [mvp setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [mvp.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [mvp.layer setBorderWidth:1];
    
    UIButton *basic = [UIButton buttonWithType:UIButtonTypeCustom];
    basic.frame = CGRectMake(self.view.frame.origin.x + 25, mobile.frame.origin.y + 50, self.view.frame.size.width - 50, 30);
    [basic setTitle:@"Basic" forState:UIControlStateNormal];
    [basic addTarget:self action:@selector(selectProductNeed:) forControlEvents:UIControlEventTouchUpInside];
    [basic setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [basic.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [basic.layer setBorderWidth:1];
    
    UIButton *complex = [UIButton buttonWithType:UIButtonTypeCustom];
    complex.frame = CGRectMake(self.view.frame.origin.x + 25, web.frame.origin.y + 50, self.view.frame.size.width - 50, 30);
    [complex setTitle:@"Complex" forState:UIControlStateNormal];
    [complex addTarget:self action:@selector(selectProductNeed:) forControlEvents:UIControlEventTouchUpInside];
    [complex setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [complex.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [complex.layer setBorderWidth:1];
    
    [self.view2 addSubview:productNeedLabel];
    [self.view2 addSubview: mvp];
    [self.view2 addSubview:basic];
    [self.view2 addSubview:complex];
    
    //Team Need Overlay (#3)
    self.view3 = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/1.35, 600, 600)];
    self.view3.backgroundColor = self.customGreen;
    [self.view addSubview:self.view3];
    
    UILabel *teamNeedLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 50, self.view.frame.size.height/4, 150, 30)];
    teamNeedLabel.text = @"Team Need";
    teamNeedLabel.textColor = self.customBlue;
    
    UIButton *onePerson = [UIButton buttonWithType:UIButtonTypeCustom];
    onePerson.frame = CGRectMake(self.view.frame.origin.x + 25, productIdeaLabel.frame.origin.y + 75, self.view.frame.size.width - 50, 30);
    [onePerson setTitle:@"One Person" forState:UIControlStateNormal];
    [onePerson addTarget:self action:@selector(selectTeamNeeded:) forControlEvents:UIControlEventTouchUpInside];
    [onePerson setTitleColor:self.customBlue forState:UIControlStateNormal];
    [onePerson.layer setBorderColor:[self.customBlue CGColor]];
    [onePerson.layer setBorderWidth:1];
    
    UIButton *smallTeam = [UIButton buttonWithType:UIButtonTypeCustom];
    smallTeam.frame = CGRectMake(self.view.frame.origin.x + 25, mobile.frame.origin.y + 50, self.view.frame.size.width - 50, 30);
    [smallTeam setTitle:@"Small Team" forState:UIControlStateNormal];
    [smallTeam addTarget:self action:@selector(selectTeamNeeded:) forControlEvents:UIControlEventTouchUpInside];
    [smallTeam setTitleColor:self.customBlue forState:UIControlStateNormal];
    [smallTeam.layer setBorderColor:[self.customBlue CGColor]];
    [smallTeam.layer setBorderWidth:1];
    
    UIButton *largeTeam = [UIButton buttonWithType:UIButtonTypeCustom];
    largeTeam.frame = CGRectMake(self.view.frame.origin.x + 25, web.frame.origin.y + 50, self.view.frame.size.width - 50, 30);
    [largeTeam setTitle:@"Large Team" forState:UIControlStateNormal];
    [largeTeam addTarget:self action:@selector(selectTeamNeeded:) forControlEvents:UIControlEventTouchUpInside];
    [largeTeam setTitleColor:self.customBlue forState:UIControlStateNormal];
    [largeTeam.layer setBorderColor:[self.customBlue CGColor]];
    [largeTeam.layer setBorderWidth:1];
    
    [self.view3 addSubview:teamNeedLabel];
    [self.view3 addSubview: onePerson];
    [self.view3 addSubview:smallTeam];
    [self.view3 addSubview:largeTeam];
    
    //Budget Overlay (#4)
    self.view4 = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/1.21, 600, 600)];
    self.view4.backgroundColor = self.customPink;
    [self.view addSubview:self.view4];
    
    UILabel *budgetLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 25, self.view.frame.size.height/4, 150, 30)];
    budgetLabel.text = @"Budget";
    budgetLabel.textColor = self.customGreen;
    
    UIButton *small = [UIButton buttonWithType:UIButtonTypeCustom];
    small.frame = CGRectMake(self.view.frame.origin.x + 25, productIdeaLabel.frame.origin.y + 75, self.view.frame.size.width - 50, 30);
    [small setTitle:@"Small" forState:UIControlStateNormal];
    [small addTarget:self action:@selector(selectBudget:) forControlEvents:UIControlEventTouchUpInside];
    [small setTitleColor:self.customGreen forState:UIControlStateNormal];
    [small.layer setBorderColor:[self.customGreen CGColor]];
    [small.layer setBorderWidth:1];
    
    UIButton *medium = [UIButton buttonWithType:UIButtonTypeCustom];
    medium.frame = CGRectMake(self.view.frame.origin.x + 25, mobile.frame.origin.y + 50, self.view.frame.size.width - 50, 30);
    [medium setTitle:@"Medium" forState:UIControlStateNormal];
    [medium addTarget:self action:@selector(selectBudget:) forControlEvents:UIControlEventTouchUpInside];
    [medium setTitleColor:self.customGreen forState:UIControlStateNormal];
    [medium.layer setBorderColor:[self.customGreen CGColor]];
    [medium.layer setBorderWidth:1];
    
    UIButton *large = [UIButton buttonWithType:UIButtonTypeCustom];
    large.frame = CGRectMake(self.view.frame.origin.x + 25, web.frame.origin.y + 50, self.view.frame.size.width - 50, 30);
    [large setTitle:@"Large" forState:UIControlStateNormal];
    [large addTarget:self action:@selector(selectBudget:) forControlEvents:UIControlEventTouchUpInside];
    [large setTitleColor:self.customGreen forState:UIControlStateNormal];
    [large.layer setBorderColor:[self.customGreen CGColor]];
    [large.layer setBorderWidth:1];
    
    [self.view4 addSubview:budgetLabel];
    [self.view4 addSubview: small];
    [self.view4 addSubview:medium];
    [self.view4 addSubview:large];
    
    //Contact Info Overlay (#5)
    self.view5 = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/1.1, 600, 600)];
    self.view5.backgroundColor = self.customDarkGrey;
    [self.view addSubview:self.view5];
    
    UILabel *contactInfo = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 50, self.view.frame.size.height/4, 150, 30)];
    contactInfo.text = @"Contact Info";
    contactInfo.textColor = self.customPink;
    
    self.name = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.origin.x + 25, productIdeaLabel.frame.origin.y + 75, self.view.frame.size.width - 50, 30)];
    self.name.layer.borderColor = self.customPink.CGColor;
    self.name.layer.borderWidth = 1;
    self.name.textColor = [UIColor whiteColor];
    self.name.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"   NAME" attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
    
    self.email = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.origin.x + 25, mobile.frame.origin.y + 50, self.view.frame.size.width - 50, 30)];
    self.email.layer.borderColor = self.customPink.CGColor;
    self.email.layer.borderWidth = 1;
    self.email.textColor = [UIColor whiteColor];
    self.email.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"   EMAIL" attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
    
    self.appDescription = [[UITextView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x + 25, web.frame.origin.y + 50, self.view.frame.size.width - 50, 150)];
    self.appDescription.backgroundColor = [UIColor clearColor];
    self.appDescription.layer.borderColor = self.customPink.CGColor;
    self.appDescription.layer.borderWidth = 1;
    self.appDescription.textColor = [UIColor lightGrayColor];
    self.appDescription.text = @"App Description (Optional)";
    
    UIButton *meetingTimes = [UIButton buttonWithType:UIButtonTypeCustom];
    meetingTimes.frame = CGRectMake(self.view5.frame.origin.x + 30, self.view5.frame.origin.y - 50, 315, 30);
    [meetingTimes setTitle:@"Schedule Meeting" forState:UIControlStateNormal];
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
    
    UILabel *selectMeetingTime = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 50, self.view.frame.size.height/4, 150, 30)];
    selectMeetingTime.text = @"Select Time";
    selectMeetingTime.textColor = [UIColor whiteColor];
    
    UIButton *day1 = [UIButton buttonWithType:UIButtonTypeCustom];
    day1.frame = CGRectMake(self.view.frame.origin.x + 25, productIdeaLabel.frame.origin.y + 75, self.view.frame.size.width - 50, 30);
    [day1 setTitle:self.day1String forState:UIControlStateNormal];
    //[day1 addTarget:self action:@selector(selectBudget:) forControlEvents:UIControlEventTouchUpInside];
    [day1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [day1.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [day1.layer setBorderWidth:1];
    
    UIButton *day2 = [UIButton buttonWithType:UIButtonTypeCustom];
    day2.frame = CGRectMake(self.view.frame.origin.x + 25, mobile.frame.origin.y + 50, self.view.frame.size.width - 50, 30);
    [day2 setTitle:self.day2String forState:UIControlStateNormal];
    //[day2 addTarget:self action:@selector(selectBudget:) forControlEvents:UIControlEventTouchUpInside];
    [day2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [day2.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [day2.layer setBorderWidth:1];
    
    UIButton *day3 = [UIButton buttonWithType:UIButtonTypeCustom];
    day3.frame = CGRectMake(self.view.frame.origin.x + 25, web.frame.origin.y + 50, self.view.frame.size.width - 50, 30);
    [day3 setTitle:self.day3String forState:UIControlStateNormal];
    //[day3 addTarget:self action:@selector(selectBudget:) forControlEvents:UIControlEventTouchUpInside];
    [day3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [day3.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [day3.layer setBorderWidth:1];
    
    UIButton *submit = [UIButton buttonWithType:UIButtonTypeCustom];
    submit.frame = CGRectMake(self.view5.frame.origin.x + 30, self.view5.frame.origin.y - 50, 315, 30);
    [submit setTitle:@"Submit" forState:UIControlStateNormal];
    [submit addTarget:self action:@selector(submitDetails:) forControlEvents:UIControlEventTouchUpInside];
    [submit setTitleColor:self.customDarkGrey forState:UIControlStateNormal];
    [submit.layer setBackgroundColor:self.customGreen.CGColor];
    
    NSArray *timeArray = @[@"10:00AM", @"1:00PM", @"3:00PM"];
    UISegmentedControl *chooseTime = [[UISegmentedControl alloc] initWithItems:timeArray];
    chooseTime.frame = CGRectMake(self.view.frame.origin.x + 25, web.frame.origin.y + 100, self.view.frame.size.width - 50, 30);
    chooseTime.segmentedControlStyle = UISegmentedControlStyleBar;
    chooseTime.tintColor = [UIColor whiteColor];
    
    [self.view6 addSubview:selectMeetingTime];
    [self.view6 addSubview: day1];
    [self.view6 addSubview:day2];
    [self.view6 addSubview:day3];
    [self.view6 addSubview:chooseTime];
    [self.view6 addSubview:submit];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(IBAction)selectProjectIdea:(UIButton *)sender
{
    [[self navigationController] setNavigationBarHidden:NO];
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    
    self.productIdea = sender.titleLabel.text;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.view2.backgroundColor = self.customDarkGrey;
        self.view2.frame = self.view.frame;
    }];
}

-(IBAction)selectProductNeed:(UIButton *)sender
{
    self.navigationController.navigationBar.barTintColor = self.customBlue;
    
    self.productNeed = sender.titleLabel.text;

    [UIView animateWithDuration:0.3 animations:^{
        self.view3.backgroundColor = self.customDarkGrey;
        self.view3.frame = self.view.frame;
    }];
}

-(IBAction)selectTeamNeeded:(UIButton *)sender
{
    self.navigationController.navigationBar.barTintColor = self.customGreen;
    
    self.teamNeed = sender.titleLabel.text;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.view4.backgroundColor = self.customDarkGrey;
        self.view4.frame = self.view.frame;
    }];
}

-(IBAction)selectBudget:(UIButton *)sender
{
    self.navigationController.navigationBar.barTintColor = self.customPink;
    
    self.budget = sender.titleLabel.text;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.view5.backgroundColor = self.customDarkGrey;
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
        self.view6.backgroundColor = self.customDarkGrey;
        self.view6.frame = self.view.frame;
    }];
    
    NSLog(@"%@, %@, %@, %@, %@, %@, %@", self.productIdea, self.productNeed, self.teamNeed, self.budget, self.contactName, self.contactEmail, self.contactAppDescription);
}

-(void)getTime
{
    //set up date formatters
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateFormatter *dateAndTimeFormat = [[NSDateFormatter alloc] init];
    [dateAndTimeFormat setDateFormat:@"EEEE MM/dd/YYYY"];
    [dateAndTimeFormat setLocale:[NSLocale currentLocale]];
    
    NSDate *today = [cal dateByAddingUnit:NSCalendarUnitDay value:3 toDate:[NSDate date] options:0];
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    //get the next 7 days
    for (int i = 0; i <7; i++)
    {
        NSDateFormatter *weekdayFormat = [[NSDateFormatter alloc] init];
        [weekdayFormat setDateFormat:@"EEEE"];
        NSDate *weekday = [cal dateByAddingUnit:NSCalendarUnitDay value:i + 1 toDate:today options:0];
        NSString *stringDate = [weekdayFormat stringFromDate:weekday];
        
        [array addObject:stringDate];
        
        //check and remove saturday and sunday
        if ([stringDate isEqualToString:@"Saturday"] || [stringDate isEqualToString:@"Sunday"])
        {
            [array removeObject:stringDate];
        }
    }
    
    //set button strings for selection
    self.day1String = [array objectAtIndex:0];
    self.day2String = [array objectAtIndex:1];
    self.day3String = [array objectAtIndex:2];
    self.day4String = [array objectAtIndex:3];
    self.day5String = [array objectAtIndex:4];
}

-(IBAction)submitDetails:(UIButton *)sender
{
    NSString *alertMessage = [NSString stringWithFormat:@"Is this correct?\n\nPlatform: %@\nProduct Need: %@\nTeam Need: %@\nBudget: %@\nContact Name: %@\nContact Email: %@\nApplication Description: %@", self.productIdea, self.productNeed, self.teamNeed, self.budget, self.contactName, self.contactEmail, self.contactAppDescription];
    
    UIAlertView *emailAlert = [[UIAlertView alloc] initWithTitle:@"Check Your Order" message:alertMessage delegate:self cancelButtonTitle:@"No, Restart" otherButtonTitles:@"Yes!", nil];
    [emailAlert show];
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self cycleTheGlobalMailComposer];
    [self dismissViewControllerAnimated:YES completion:nil];
    [self performSegueWithIdentifier:@"faqSegueID" sender:self];
}

-(void)cycleTheGlobalMailComposer
{
    self.mailVC = nil;
    self.mailVC = [[MFMailComposeViewController alloc] init];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 0)
    {
        [self performSegueWithIdentifier:@"faqSegueID" sender:self];
    }
    else if (buttonIndex == 1)
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
        NSString *message = [NSString stringWithFormat:@"Platform: %@\nProduct Need: %@\nTeam Need: %@\nBudget: %@\nContact Name: %@\nContact Email: %@\nApplication Description: %@", self.productIdea, self.productNeed, self.teamNeed, self.budget, self.contactName, self.contactEmail, self.contactAppDescription];
        
        [self.mailVC setToRecipients:emails];
        [self.mailVC setSubject:subject];
        [self.mailVC setMessageBody:message isHTML:NO];
        [self presentViewController:self.mailVC animated:YES completion:nil];
    }
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
