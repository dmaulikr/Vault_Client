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

@property NSString *meetingDay;
@property NSString *meetingTime;
@property NSString *meetingFinal;

@property UISegmentedControl *chooseTime;

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

@property UIImageView *topImage;

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
    UIImageView *mainLogo = [[UIImageView alloc] initWithFrame:CGRectMake(25, 25, self.view.frame.size.width - 75, self.view.frame.size.height /7)];
    mainLogo.image = [UIImage imageNamed:@"MainLogo"];
    
    UILabel *productIdeaLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 55, self.view.frame.size.height/4, 150, 30)];
    productIdeaLabel.text = @"PRODUCT PLATFORM";
    productIdeaLabel.textColor = [UIColor whiteColor];
    productIdeaLabel.font = [UIFont fontWithName:@"Avenir" size:12];
    
    UIButton *info1 = [UIButton buttonWithType:UIButtonTypeCustom];
    info1.frame = CGRectMake(self.view.frame.size.width - 55, self.view.frame.size.height/4, 30, 30);
    [info1 setImage:[UIImage imageNamed:@"Info@2x-17.png"] forState:UIControlStateNormal];
    [info1 addTarget:self action:@selector(infoCalloutOnButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    info1.tag = 1;
    
    UIButton *mobile = [UIButton buttonWithType:UIButtonTypeCustom];
    mobile.frame = CGRectMake(self.view.frame.origin.x + 25, productIdeaLabel.frame.origin.y + 50, self.view.frame.size.width - 50, 30);
    [mobile setTitle:@"MOBILE" forState:UIControlStateNormal];
    [mobile addTarget:self action:@selector(selectProjectIdea:) forControlEvents:UIControlEventTouchUpInside];
    [mobile setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [mobile.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [mobile.layer setBorderWidth:1];
    mobile.titleLabel.font = [UIFont fontWithName:@"Avenir" size:11];
    
    UIButton *web = [UIButton buttonWithType:UIButtonTypeCustom];
    web.frame = CGRectMake(self.view.frame.origin.x + 25, mobile.frame.origin.y + 50, self.view.frame.size.width - 50, 30);
    [web setTitle:@"WEB" forState:UIControlStateNormal];
    [web addTarget:self action:@selector(selectProjectIdea:) forControlEvents:UIControlEventTouchUpInside];
    [web setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [web.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [web.layer setBorderWidth:1];
    web.titleLabel.font = [UIFont fontWithName:@"Avenir" size:11];
    
    UIButton *both = [UIButton buttonWithType:UIButtonTypeCustom];
    both.frame = CGRectMake(self.view.frame.origin.x + 25, web.frame.origin.y + 50, self.view.frame.size.width - 50, 30);
    [both setTitle:@"BOTH" forState:UIControlStateNormal];
    [both addTarget:self action:@selector(selectProjectIdea:) forControlEvents:UIControlEventTouchUpInside];
    [both setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [both.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [both.layer setBorderWidth:1];
    both.titleLabel.font = [UIFont fontWithName:@"Avenir" size:11];
    
    [self.view addSubview:mainLogo];
    [self.view addSubview:productIdeaLabel];
    [self.view addSubview:info1];
    [self.view addSubview: mobile];
    [self.view addSubview:web];
    [self.view addSubview:both];
    
    //Product Need Overlay (#2)
    self.view2 = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/1.5, 600, 600)];
    self.view2.backgroundColor = self.customBlue;
    [self.view addSubview:self.view2];
    
    UIImageView *view2Image = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 15, 10, 30, 30)];
    view2Image.image = [UIImage imageNamed:@"Product.png"];
    
    UILabel *productNeedLabel = [[UILabel alloc] initWithFrame:CGRectMake(productIdeaLabel.frame.origin.x, productIdeaLabel.frame.origin.y, productIdeaLabel.frame.size.width, productIdeaLabel.frame.size.height)];
    productNeedLabel.text = @"PRODUCT SCOPE";
    productNeedLabel.textColor = [UIColor whiteColor];
    productNeedLabel.font = [UIFont fontWithName:@"Avenir" size:12];
    
    UIButton *info2 = [UIButton buttonWithType:UIButtonTypeCustom];
    info2.frame = CGRectMake(self.view.frame.size.width - 55, self.view.frame.size.height/4, 30, 30);
    [info2 setImage:[UIImage imageNamed:@"Info@2x-17.png"] forState:UIControlStateNormal];
    [info2 addTarget:self action:@selector(infoCalloutOnButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    info2.tag = 2;
    
    UIButton *mvp = [UIButton buttonWithType:UIButtonTypeCustom];
    mvp.frame = CGRectMake(self.view.frame.origin.x + 25, productIdeaLabel.frame.origin.y + 55, self.view.frame.size.width - 50, 30);
    [mvp setTitle:@"MVP" forState:UIControlStateNormal];
    [mvp addTarget:self action:@selector(selectProductNeed:) forControlEvents:UIControlEventTouchUpInside];
    [mvp setTitleColor:self.customBlue forState:UIControlStateNormal];
    [mvp.layer setBorderColor:[self.customBlue CGColor]];
    [mvp.layer setBorderWidth:1];
    mvp.titleLabel.font = [UIFont fontWithName:@"Avenir" size:11];
    
    UIButton *basic = [UIButton buttonWithType:UIButtonTypeCustom];
    basic.frame = CGRectMake(self.view.frame.origin.x + 25, mobile.frame.origin.y + 50, self.view.frame.size.width - 50, 30);
    [basic setTitle:@"Basic" forState:UIControlStateNormal];
    [basic addTarget:self action:@selector(selectProductNeed:) forControlEvents:UIControlEventTouchUpInside];
    [basic setTitleColor:self.customBlue forState:UIControlStateNormal];
    [basic.layer setBorderColor:[self.customBlue CGColor]];
    [basic.layer setBorderWidth:1];
    basic.titleLabel.font = [UIFont fontWithName:@"Avenir" size:11];
    
    UIButton *complex = [UIButton buttonWithType:UIButtonTypeCustom];
    complex.frame = CGRectMake(self.view.frame.origin.x + 25, web.frame.origin.y + 50, self.view.frame.size.width - 50, 30);
    [complex setTitle:@"Complex" forState:UIControlStateNormal];
    [complex addTarget:self action:@selector(selectProductNeed:) forControlEvents:UIControlEventTouchUpInside];
    [complex setTitleColor:self.customBlue forState:UIControlStateNormal];
    [complex.layer setBorderColor:[self.customBlue CGColor]];
    [complex.layer setBorderWidth:1];
    complex.titleLabel.font = [UIFont fontWithName:@"Avenir" size:11];
    
    [self.view2 addSubview:view2Image];
    [self.view2 addSubview:info2];
    [self.view2 addSubview:productNeedLabel];
    [self.view2 addSubview: mvp];
    [self.view2 addSubview:basic];
    [self.view2 addSubview:complex];
    
    //Team Need Overlay (#3)
    self.view3 = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/1.35, 600, 600)];
    self.view3.backgroundColor = self.customGreen;
    [self.view addSubview:self.view3];
    
    UIImageView *view3Image = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 15, 10, 30, 30)];
    view3Image.image = [UIImage imageNamed:@"Team.png"];
    
    UILabel *teamNeedLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 35, self.view.frame.size.height/4, 150, 30)];
    teamNeedLabel.text = @"TEAM SCALE";
    teamNeedLabel.textColor = [UIColor whiteColor];
    teamNeedLabel.font = [UIFont fontWithName:@"Avenir" size:12];
    
    UIButton *info3 = [UIButton buttonWithType:UIButtonTypeCustom];
    info3.frame = CGRectMake(self.view.frame.size.width - 55, self.view.frame.size.height/4, 30, 30);
    [info3 setImage:[UIImage imageNamed:@"Info@2x-17.png"] forState:UIControlStateNormal];
    [info3 addTarget:self action:@selector(infoCalloutOnButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    info3.tag = 3;
    
    UIButton *onePerson = [UIButton buttonWithType:UIButtonTypeCustom];
    onePerson.frame = CGRectMake(self.view.frame.origin.x + 25, productIdeaLabel.frame.origin.y + 55, self.view.frame.size.width - 50, 30);
    [onePerson setTitle:@"One Person" forState:UIControlStateNormal];
    [onePerson addTarget:self action:@selector(selectTeamNeeded:) forControlEvents:UIControlEventTouchUpInside];
    [onePerson setTitleColor:self.customGreen forState:UIControlStateNormal];
    [onePerson.layer setBorderColor:[self.customGreen CGColor]];
    [onePerson.layer setBorderWidth:1];
    onePerson.titleLabel.font = [UIFont fontWithName:@"Avenir" size:11];
    
    UIButton *smallTeam = [UIButton buttonWithType:UIButtonTypeCustom];
    smallTeam.frame = CGRectMake(self.view.frame.origin.x + 25, mobile.frame.origin.y + 50, self.view.frame.size.width - 50, 30);
    [smallTeam setTitle:@"Small Team" forState:UIControlStateNormal];
    [smallTeam addTarget:self action:@selector(selectTeamNeeded:) forControlEvents:UIControlEventTouchUpInside];
    [smallTeam setTitleColor:self.customGreen forState:UIControlStateNormal];
    [smallTeam.layer setBorderColor:[self.customGreen CGColor]];
    [smallTeam.layer setBorderWidth:1];
    smallTeam.titleLabel.font = [UIFont fontWithName:@"Avenir" size:11];
    
    UIButton *largeTeam = [UIButton buttonWithType:UIButtonTypeCustom];
    largeTeam.frame = CGRectMake(self.view.frame.origin.x + 25, web.frame.origin.y + 50, self.view.frame.size.width - 50, 30);
    [largeTeam setTitle:@"Large Team" forState:UIControlStateNormal];
    [largeTeam addTarget:self action:@selector(selectTeamNeeded:) forControlEvents:UIControlEventTouchUpInside];
    [largeTeam setTitleColor:self.customGreen forState:UIControlStateNormal];
    [largeTeam.layer setBorderColor:[self.customGreen CGColor]];
    [largeTeam.layer setBorderWidth:1];
    largeTeam.titleLabel.font = [UIFont fontWithName:@"Avenir" size:11];
    
    [self.view3 addSubview:view3Image];
    [self.view3 addSubview:info3];
    [self.view3 addSubview:teamNeedLabel];
    [self.view3 addSubview: onePerson];
    [self.view3 addSubview:smallTeam];
    [self.view3 addSubview:largeTeam];
    
    //Budget Overlay (#4)
    self.view4 = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/1.21, 600, 600)];
    self.view4.backgroundColor = self.customPink;
    [self.view addSubview:self.view4];
    
    UIImageView *view4Image = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 15, 10, 30, 30)];
    view4Image.image = [UIImage imageNamed:@"Budget.png"];
    
    UIButton *info4 = [UIButton buttonWithType:UIButtonTypeCustom];
    info4.frame = CGRectMake(self.view.frame.size.width - 55, self.view.frame.size.height/4, 30, 30);
    [info4 setImage:[UIImage imageNamed:@"Info@2x-17.png"] forState:UIControlStateNormal];
    [info4 addTarget:self action:@selector(infoCalloutOnButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    info4.tag = 4;
    
    UILabel *budgetLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 50, self.view.frame.size.height/4, 150, 30)];
    budgetLabel.text = @"PRODUCT BUDGET";
    budgetLabel.textColor = [UIColor whiteColor];
    budgetLabel.font = [UIFont fontWithName:@"Avenir" size:12];
    
    UIButton *small = [UIButton buttonWithType:UIButtonTypeCustom];
    small.frame = CGRectMake(self.view.frame.origin.x + 25, productIdeaLabel.frame.origin.y + 55, self.view.frame.size.width - 50, 30);
    [small setTitle:@"Small" forState:UIControlStateNormal];
    [small addTarget:self action:@selector(selectBudget:) forControlEvents:UIControlEventTouchUpInside];
    [small setTitleColor:self.customPink forState:UIControlStateNormal];
    [small.layer setBorderColor:[self.customPink CGColor]];
    [small.layer setBorderWidth:1];
    small.titleLabel.font = [UIFont fontWithName:@"Avenir" size:11];
    
    UIButton *medium = [UIButton buttonWithType:UIButtonTypeCustom];
    medium.frame = CGRectMake(self.view.frame.origin.x + 25, mobile.frame.origin.y + 50, self.view.frame.size.width - 50, 30);
    [medium setTitle:@"Medium" forState:UIControlStateNormal];
    [medium addTarget:self action:@selector(selectBudget:) forControlEvents:UIControlEventTouchUpInside];
    [medium setTitleColor:self.customPink forState:UIControlStateNormal];
    [medium.layer setBorderColor:[self.customPink CGColor]];
    [medium.layer setBorderWidth:1];
    medium.titleLabel.font = [UIFont fontWithName:@"Avenir" size:11];
    
    UIButton *large = [UIButton buttonWithType:UIButtonTypeCustom];
    large.frame = CGRectMake(self.view.frame.origin.x + 25, web.frame.origin.y + 50, self.view.frame.size.width - 50, 30);
    [large setTitle:@"Large" forState:UIControlStateNormal];
    [large addTarget:self action:@selector(selectBudget:) forControlEvents:UIControlEventTouchUpInside];
    [large setTitleColor:self.customPink forState:UIControlStateNormal];
    [large.layer setBorderColor:[self.customPink CGColor]];
    [large.layer setBorderWidth:1];
    large.titleLabel.font = [UIFont fontWithName:@"Avenir" size:11];
    
    [self.view4 addSubview:view4Image];
    [self.view4 addSubview:info4];
    [self.view4 addSubview:budgetLabel];
    [self.view4 addSubview: small];
    [self.view4 addSubview:medium];
    [self.view4 addSubview:large];
    
    //Contact Info Overlay (#5)
    self.view5 = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/1.1, 600, 600)];
    self.view5.backgroundColor = self.customDarkGrey;
    [self.view addSubview:self.view5];
    
    UIImageView *view5Image = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 15, 10, 30, 30)];
    view5Image.image = [UIImage imageNamed:@"Idea.png"];
    
    UILabel *contactInfo = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 50, self.view.frame.size.height/4, 150, 30)];
    contactInfo.text = @"Contact Info";
    contactInfo.textColor = self.customPink;
    contactInfo.font = [UIFont fontWithName:@"Avenir" size:12];
    
    self.name = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.origin.x + 25, productIdeaLabel.frame.origin.y + 75, self.view.frame.size.width - 50, 30)];
    self.name.layer.borderColor = self.customPink.CGColor;
    self.name.layer.borderWidth = 1;
    self.name.font = [UIFont fontWithName:@"Avenir" size:12];
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
    
    [self.view5 addSubview:view5Image];
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
    [day1 addTarget:self action:@selector(scheduleMeeting:) forControlEvents:UIControlEventTouchUpInside];
    [day1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [day1.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [day1.layer setBorderWidth:1];
    
    UIButton *day2 = [UIButton buttonWithType:UIButtonTypeCustom];
    day2.frame = CGRectMake(self.view.frame.origin.x + 25, mobile.frame.origin.y + 50, self.view.frame.size.width - 50, 30);
    [day2 setTitle:self.day2String forState:UIControlStateNormal];
    [day2 addTarget:self action:@selector(scheduleMeeting:) forControlEvents:UIControlEventTouchUpInside];
    [day2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [day2.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [day2.layer setBorderWidth:1];
    
    UIButton *day3 = [UIButton buttonWithType:UIButtonTypeCustom];
    day3.frame = CGRectMake(self.view.frame.origin.x + 25, web.frame.origin.y + 50, self.view.frame.size.width - 50, 30);
    [day3 setTitle:self.day3String forState:UIControlStateNormal];
    [day3 addTarget:self action:@selector(scheduleMeeting:) forControlEvents:UIControlEventTouchUpInside];
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
    self.chooseTime = [[UISegmentedControl alloc] initWithItems:timeArray];
    self.chooseTime.frame = CGRectMake(self.view.frame.origin.x + 25, web.frame.origin.y + 100, self.view.frame.size.width - 50, 30);
    [self.chooseTime addTarget:self action:@selector(meetingTimeSegmentedController:) forControlEvents:UIControlEventValueChanged];
    self.chooseTime.segmentedControlStyle = UISegmentedControlStyleBar;
    self.chooseTime.tintColor = [UIColor whiteColor];

    
    [self.view6 addSubview:selectMeetingTime];
    [self.view6 addSubview: day1];
    [self.view6 addSubview:day2];
    [self.view6 addSubview:day3];
    [self.view6 addSubview:self.chooseTime];
    [self.view6 addSubview:submit];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(IBAction)infoCalloutOnButtonTapped:(UIButton *)sender
{
    if (sender.tag == 1)
    {
        UIAlertView *platformCallout = [[UIAlertView alloc] initWithTitle:@"Product Platform" message:@"Testing..." delegate:self cancelButtonTitle:@"Got It!" otherButtonTitles: nil];
        [platformCallout show];
    }
    else if(sender.tag == 2)
    {
        UIAlertView *scopeCallout = [[UIAlertView alloc] initWithTitle:@"Project Scope" message:@"Testing..." delegate:self cancelButtonTitle:@"Got It!" otherButtonTitles: nil];
        [scopeCallout show];
    }
    else if(sender.tag == 3)
    {
        UIAlertView *teamCallout = [[UIAlertView alloc] initWithTitle:@"Team Scale" message:@"Testing..." delegate:self cancelButtonTitle:@"Got It!" otherButtonTitles: nil];
        [teamCallout show];
    }
    else if(sender.tag == 4)
    {
        UIAlertView *budgetCallout = [[UIAlertView alloc] initWithTitle:@"Product Budget" message:@"Testing..." delegate:self cancelButtonTitle:@"Got It!" otherButtonTitles: nil];
        [budgetCallout show];
    }
}

-(IBAction)selectProjectIdea:(UIButton *)sender
{
    self.productIdea = sender.titleLabel.text;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.view2.backgroundColor = [UIColor blackColor];
        self.view2.frame = self.view.frame;
        
        UILabel *topLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
        topLabel.backgroundColor = self.customBlue;
        
        self.topImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - self.view.frame.size.width/5, 5, self.view.frame.size.width/2.5, 40)];
        self.topImage.image = [UIImage imageNamed:@"LogoHeader.png"];
        
        UIImageView *view2Image = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 15, self.view.frame.origin.y + 100, 30, 30)];
        view2Image.image = [UIImage imageNamed:@"Product.png"];
        
        [self.view2 addSubview:topLabel];
        [self.view2 addSubview:view2Image];
        [self.view2 addSubview:self.topImage];
    }];
}

-(IBAction)selectProductNeed:(UIButton *)sender
{
    self.productNeed = sender.titleLabel.text;

    [UIView animateWithDuration:0.3 animations:^{
        self.view3.backgroundColor = [UIColor blackColor];
        self.view3.frame = self.view.frame;
        
        UILabel *topLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
        topLabel.backgroundColor = self.customGreen;
        
        self.topImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - self.view.frame.size.width/5, 5, self.view.frame.size.width/2.5, 40)];
        self.topImage.image = [UIImage imageNamed:@"LogoHeader.png"];
        
        UIImageView *view3Image = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 15, self.view.frame.origin.y + 100, 30, 30)];
        view3Image.image = [UIImage imageNamed:@"Team.png"];
        
        [self.view3 addSubview:topLabel];
        [self.view3 addSubview:view3Image];
        [self.view3 addSubview:self.topImage];
    }];
}

-(IBAction)selectTeamNeeded:(UIButton *)sender
{
    self.teamNeed = sender.titleLabel.text;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.view4.backgroundColor = [UIColor blackColor];
        self.view4.frame = self.view.frame;
        
        UILabel *topLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
        topLabel.backgroundColor = self.customPink;
        
        self.topImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - self.view.frame.size.width/5, 5, self.view.frame.size.width/2.5, 40)];
        self.topImage.image = [UIImage imageNamed:@"LogoHeader.png"];
        
        UIImageView *view4Image = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 15, self.view.frame.origin.y + 100, 30, 30)];
        view4Image.image = [UIImage imageNamed:@"Budget"];
        
        [self.view4 addSubview:topLabel];
        [self.view4 addSubview:view4Image];
        [self.view4 addSubview:self.topImage];
    }];
}

-(IBAction)selectBudget:(UIButton *)sender
{
    self.budget = sender.titleLabel.text;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.view5.backgroundColor = [UIColor blackColor];
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
        self.view6.backgroundColor = [UIColor blackColor];
        self.view6.frame = self.view.frame;
    }];
}

-(IBAction)scheduleMeeting:(UIButton *)sender
{
    self.meetingDay = sender.titleLabel.text;
    [sender setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    
    [sender setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    sender.backgroundColor = [UIColor whiteColor];
}

-(IBAction)meetingTimeSegmentedController:(UISegmentedControl *)sender
{
    if (self.chooseTime.selectedSegmentIndex == 0)
    {
        self.meetingTime = @"10:00AM";
    }
    else if(self.chooseTime.selectedSegmentIndex == 1)
    {
        self.meetingTime = @"1:00PM";
    }
    else if(self.chooseTime.selectedSegmentIndex == 2)
    {
        self.meetingTime = @"3:00PM";
    }
    
    NSLog(@"%@", self.meetingTime);
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
    self.meetingFinal = [NSString stringWithFormat:@"%@ %@", self.meetingDay, self.meetingTime];

    NSString *alertMessage = [NSString stringWithFormat:@"Is this correct?\n\nPlatform: %@\nProduct Need: %@\nTeam Need: %@\nBudget: %@\nContact Name: %@\nContact Email: %@\nApplication Description: %@\nMeeting Time: %@", self.productIdea, self.productNeed, self.teamNeed, self.budget, self.contactName, self.contactEmail, self.contactAppDescription, self.meetingFinal];
    
    UIAlertView *emailAlert = [[UIAlertView alloc] initWithTitle:@"Check Your Order" message:alertMessage delegate:self cancelButtonTitle:@"No, Restart" otherButtonTitles:@"Yes!", nil];
    emailAlert.tag = 2;
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
    if(alertView.tag == 2 && buttonIndex == 0)
    {
        [self performSegueWithIdentifier:@"faqSegueID" sender:self];
    }
    else if (alertView.tag == 2 && buttonIndex == 1)
    {
        PFObject *client = [PFObject objectWithClassName:@"Client"];
        client[@"productIdea"] = self.productIdea;
        client[@"productNeed"] = self.productNeed;
        client[@"teamNeed"] = self.teamNeed;
        client[@"budget"] = self.budget;
        client[@"contactName"] = self.contactName;
        client[@"contactEmail"] = self.contactEmail;
        client[@"contactAppDescription"] = self.contactAppDescription;
        client[@"meetingTime"] = self.meetingFinal;
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

@end
