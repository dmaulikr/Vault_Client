//
//  MainViewController.m
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 2/24/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController () <MFMailComposeViewControllerDelegate, UITextFieldDelegate, UITextViewDelegate>

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

@property NSArray *meetingButtonArry;
@property NSArray *meetingTimeArray;

@property UIView *header1;
@property UIView *view2;
@property UIView *view3;
@property UIView *view4;
@property UIView *view5;
@property UIView *view6;

@property UIColor *customGreen;
@property UIColor *customBlue;
@property UIColor *customPink;
@property UIColor *customDarkGrey;
@property UIColor *customPurple;

@property UIButton *meetingTimes;

@property CGSize keyboardSize;

@property UITextField *name;
@property UITextField *email;
@property UITextView *appDescription;

@property MFMailComposeViewController *mailVC;

@property UIImageView *topImage;
@property (weak, nonatomic) IBOutlet UIButton *backButton;

@property NSArray *viewArray;
@property NSArray *topImagesArray;
@property NSArray *originRectsArray;
@property NSArray *headerArray;
@property NSArray *imageToRemoveArray;
@property NSArray *backButtonsArray;
@property NSArray *logoArray;

@property int i;

@property UIImageView *header2;
@property UIImageView *header3;
@property UIImageView *header4;
@property UIImageView *header5;
@property UIImageView *header6;

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
    self.customPurple = [UIColor colorWithRed:(112/255.0) green:(87/255.0) blue:(161/255.0) alpha:1.0];
    
    //Product Platform Overlay (#1)
    UIImageView *mainLogo = [[UIImageView alloc] initWithFrame:CGRectMake(25, 25, self.view.frame.size.width - 75, self.view.frame.size.height /7)];
    mainLogo.image = [UIImage imageNamed:@"MainLogo"];
    
    UIImageView *headerLogo1 = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - self.view.frame.size.width/5, 5, self.view.frame.size.width/2.7, self.view.frame.size.height / 13.5)];
    headerLogo1.image = [UIImage imageNamed:@"LogoHeader.png"];
    
    self.header1 = [UIImageView new];
    self.header6 = [UIImageView new];
    [self.view addSubview:self.header1];
    
    _i = 1;
    
    UILabel *productIdeaLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 55, self.view.frame.size.height/4, 150, 30)];
    productIdeaLabel.text = @"PRODUCT PLATFORM";
    productIdeaLabel.textColor = [UIColor whiteColor];
    productIdeaLabel.font = [UIFont fontWithName:@"Avenir" size:12];
    
    UIButton *back1 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    UIButton *info1 = [UIButton buttonWithType:UIButtonTypeCustom];
    info1.frame = CGRectMake(self.view.frame.size.width - 55, self.view.frame.size.height/4, 30, 30);
    [info1 setImage:[UIImage imageNamed:@"Info@2x-17.png"] forState:UIControlStateNormal];
    [info1 addTarget:self action:@selector(infoCalloutOnButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    info1.tag = 1;
    
    UIButton *mobile = [UIButton buttonWithType:UIButtonTypeCustom];
    mobile.frame = CGRectMake(self.view.frame.origin.x + 25, productIdeaLabel.frame.origin.y + 65, self.view.frame.size.width - 50, 35);
    [mobile setTitle:@"MOBILE" forState:UIControlStateNormal];
    [mobile addTarget:self action:@selector(selectProjectIdea:) forControlEvents:UIControlEventTouchUpInside];
    [mobile setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [mobile.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [mobile.layer setBorderWidth:1];
    mobile.titleLabel.font = [UIFont fontWithName:@"Avenir" size:11];
    
    UIButton *web = [UIButton buttonWithType:UIButtonTypeCustom];
    web.frame = CGRectMake(self.view.frame.origin.x + 25, mobile.frame.origin.y + 50, self.view.frame.size.width - 50, 35);
    [web setTitle:@"WEB" forState:UIControlStateNormal];
    [web addTarget:self action:@selector(selectProjectIdea:) forControlEvents:UIControlEventTouchUpInside];
    [web setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [web.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [web.layer setBorderWidth:1];
    web.titleLabel.font = [UIFont fontWithName:@"Avenir" size:11];
    
    UIButton *both = [UIButton buttonWithType:UIButtonTypeCustom];
    both.frame = CGRectMake(self.view.frame.origin.x + 25, web.frame.origin.y + 50, self.view.frame.size.width - 50, 35);
    [both setTitle:@"BOTH" forState:UIControlStateNormal];
    [both addTarget:self action:@selector(selectProjectIdea:) forControlEvents:UIControlEventTouchUpInside];
    [both setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [both.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [both.layer setBorderWidth:1];
    both.titleLabel.font = [UIFont fontWithName:@"Avenir" size:11];
    
    [self.view addSubview:mainLogo];
    [self.view addSubview:productIdeaLabel];
    [self.view addSubview:back1];
    [self.view addSubview:info1];
    [self.view addSubview: mobile];
    [self.view addSubview:web];
    [self.view addSubview:both];
    
    //Product Need Overlay (#2)
    self.view2 = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/1.5, 600, 600)];
    self.view2.backgroundColor = self.customBlue;
    [self.view addSubview:self.view2];
    
    self.header2 = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 15, 10, 30, 30)];
    self.header2.image = [UIImage imageNamed:@"Product.png"];
    
    UIImageView *headerLogo2 = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - self.view.frame.size.width/5, 5, self.view.frame.size.width/2.7, self.view.frame.size.height / 13.5)];
    headerLogo2.image = [UIImage imageNamed:@"LogoHeader.png"];
    
    UILabel *productNeedLabel = [[UILabel alloc] initWithFrame:CGRectMake(productIdeaLabel.frame.origin.x, productIdeaLabel.frame.origin.y, productIdeaLabel.frame.size.width, productIdeaLabel.frame.size.height)];
    productNeedLabel.text = @"PRODUCT SCOPE";
    productNeedLabel.textColor = [UIColor whiteColor];
    productNeedLabel.font = [UIFont fontWithName:@"Avenir" size:12];
    
    UIButton *back2 = [UIButton buttonWithType:UIButtonTypeCustom];
    back2.frame = CGRectMake(0, 10, 100, 30);
    [back2 setTitle:@"BACK" forState:UIControlStateNormal];
    back2.titleLabel.textColor = [UIColor whiteColor];
    [back2 addTarget:self action:@selector(backButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *info2 = [UIButton buttonWithType:UIButtonTypeCustom];
    info2.frame = CGRectMake(self.view.frame.size.width - 55, self.view.frame.size.height/4, 30, 30);
    [info2 setImage:[UIImage imageNamed:@"Info@2x-17.png"] forState:UIControlStateNormal];
    [info2 addTarget:self action:@selector(infoCalloutOnButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    info2.tag = 2;
    
    UIButton *mvp = [UIButton buttonWithType:UIButtonTypeCustom];
    mvp.frame = CGRectMake(self.view.frame.origin.x + 25, productIdeaLabel.frame.origin.y + 65, self.view.frame.size.width - 50, 35);
    [mvp setTitle:@"MVP" forState:UIControlStateNormal];
    [mvp addTarget:self action:@selector(selectProductNeed:) forControlEvents:UIControlEventTouchUpInside];
    [mvp setTitleColor:self.customBlue forState:UIControlStateNormal];
    [mvp.layer setBorderColor:[self.customBlue CGColor]];
    [mvp.layer setBorderWidth:1];
    mvp.titleLabel.font = [UIFont fontWithName:@"Avenir" size:11];
    
    UIButton *basic = [UIButton buttonWithType:UIButtonTypeCustom];
    basic.frame = CGRectMake(self.view.frame.origin.x + 25, mobile.frame.origin.y + 50, self.view.frame.size.width - 50, 35);
    [basic setTitle:@"BASIC" forState:UIControlStateNormal];
    [basic addTarget:self action:@selector(selectProductNeed:) forControlEvents:UIControlEventTouchUpInside];
    [basic setTitleColor:self.customBlue forState:UIControlStateNormal];
    [basic.layer setBorderColor:[self.customBlue CGColor]];
    [basic.layer setBorderWidth:1];
    basic.titleLabel.font = [UIFont fontWithName:@"Avenir" size:11];
    
    UIButton *complex = [UIButton buttonWithType:UIButtonTypeCustom];
    complex.frame = CGRectMake(self.view.frame.origin.x + 25, web.frame.origin.y + 50, self.view.frame.size.width - 50, 35);
    [complex setTitle:@"COMPLEX" forState:UIControlStateNormal];
    [complex addTarget:self action:@selector(selectProductNeed:) forControlEvents:UIControlEventTouchUpInside];
    [complex setTitleColor:self.customBlue forState:UIControlStateNormal];
    [complex.layer setBorderColor:[self.customBlue CGColor]];
    [complex.layer setBorderWidth:1];
    complex.titleLabel.font = [UIFont fontWithName:@"Avenir" size:11];
    
    [self.view2 addSubview:self.header2];
    [self.view2 addSubview:back2];
    [self.view2 addSubview:info2];
    [self.view2 addSubview:productNeedLabel];
    [self.view2 addSubview: mvp];
    [self.view2 addSubview:basic];
    [self.view2 addSubview:complex];
    
    //Team Need Overlay (#3)
    self.view3 = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/1.35, 600, 600)];
    self.view3.backgroundColor = self.customGreen;
    [self.view addSubview:self.view3];
    
    self.header3 = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 15, 10, 30, 30)];
    self.header3.image = [UIImage imageNamed:@"Team.png"];
    
    UIImageView *headerLogo3 = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - self.view.frame.size.width/5, 5, self.view.frame.size.width/2.7, self.view.frame.size.height / 13.5)];
    headerLogo3.image = [UIImage imageNamed:@"LogoHeader.png"];
    
    UILabel *teamNeedLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 35, self.view.frame.size.height/4, 150, 30)];
    teamNeedLabel.text = @"TEAM SCALE";
    teamNeedLabel.textColor = [UIColor whiteColor];
    teamNeedLabel.font = [UIFont fontWithName:@"Avenir" size:12];
    
    UIButton *back3 = [UIButton buttonWithType:UIButtonTypeCustom];
    back3.frame = CGRectMake(0, 10, 100, 30);
    [back3 setTitle:@"BACK" forState:UIControlStateNormal];
    back3.titleLabel.textColor = [UIColor whiteColor];
    [back3 addTarget:self action:@selector(backButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *info3 = [UIButton buttonWithType:UIButtonTypeCustom];
    info3.frame = CGRectMake(self.view.frame.size.width - 55, self.view.frame.size.height/4, 30, 30);
    [info3 setImage:[UIImage imageNamed:@"Info@2x-17.png"] forState:UIControlStateNormal];
    [info3 addTarget:self action:@selector(infoCalloutOnButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    info3.tag = 3;
    
    UIButton *onePerson = [UIButton buttonWithType:UIButtonTypeCustom];
    onePerson.frame = CGRectMake(self.view.frame.origin.x + 25, productIdeaLabel.frame.origin.y + 65, self.view.frame.size.width - 50, 35);
    [onePerson setTitle:@"ONE PERSON" forState:UIControlStateNormal];
    [onePerson addTarget:self action:@selector(selectTeamNeeded:) forControlEvents:UIControlEventTouchUpInside];
    [onePerson setTitleColor:self.customGreen forState:UIControlStateNormal];
    [onePerson.layer setBorderColor:[self.customGreen CGColor]];
    [onePerson.layer setBorderWidth:1];
    onePerson.titleLabel.font = [UIFont fontWithName:@"Avenir" size:11];
    
    UIButton *smallTeam = [UIButton buttonWithType:UIButtonTypeCustom];
    smallTeam.frame = CGRectMake(self.view.frame.origin.x + 25, mobile.frame.origin.y + 50, self.view.frame.size.width - 50, 35);
    [smallTeam setTitle:@"SMALL TEAM" forState:UIControlStateNormal];
    [smallTeam addTarget:self action:@selector(selectTeamNeeded:) forControlEvents:UIControlEventTouchUpInside];
    [smallTeam setTitleColor:self.customGreen forState:UIControlStateNormal];
    [smallTeam.layer setBorderColor:[self.customGreen CGColor]];
    [smallTeam.layer setBorderWidth:1];
    smallTeam.titleLabel.font = [UIFont fontWithName:@"Avenir" size:11];
    
    UIButton *largeTeam = [UIButton buttonWithType:UIButtonTypeCustom];
    largeTeam.frame = CGRectMake(self.view.frame.origin.x + 25, web.frame.origin.y + 50, self.view.frame.size.width - 50, 35);
    [largeTeam setTitle:@"LARGE TEAM" forState:UIControlStateNormal];
    [largeTeam addTarget:self action:@selector(selectTeamNeeded:) forControlEvents:UIControlEventTouchUpInside];
    [largeTeam setTitleColor:self.customGreen forState:UIControlStateNormal];
    [largeTeam.layer setBorderColor:[self.customGreen CGColor]];
    [largeTeam.layer setBorderWidth:1];
    largeTeam.titleLabel.font = [UIFont fontWithName:@"Avenir" size:11];
    
    [self.view3 addSubview:self.header3];
    [self.view3 addSubview:info3];
    [self.view3 addSubview:back3];
    [self.view3 addSubview:teamNeedLabel];
    [self.view3 addSubview: onePerson];
    [self.view3 addSubview:smallTeam];
    [self.view3 addSubview:largeTeam];
    
    //Budget Overlay (#4)
    self.view4 = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/1.21, 600, 600)];
    self.view4.backgroundColor = self.customPink;
    [self.view addSubview:self.view4];
    
    self.header4 = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 15, 10, 30, 30)];
    self.header4.image = [UIImage imageNamed:@"Budget.png"];
    
    UIImageView *headerLogo4 = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - self.view.frame.size.width/5, 5, self.view.frame.size.width/2.7, self.view.frame.size.height / 13.5)];
    headerLogo4.image = [UIImage imageNamed:@"LogoHeader.png"];
    
    UIButton *back4 = [UIButton buttonWithType:UIButtonTypeCustom];
    back4.frame = CGRectMake(0, 10, 100, 30);
    [back4 setTitle:@"BACK" forState:UIControlStateNormal];
    back4.titleLabel.textColor = [UIColor whiteColor];
    [back4 addTarget:self action:@selector(backButton:) forControlEvents:UIControlEventTouchUpInside];
    
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
    small.frame = CGRectMake(self.view.frame.origin.x + 25, productIdeaLabel.frame.origin.y + 65, self.view.frame.size.width - 50, 35);
    [small setTitle:@"SMALL" forState:UIControlStateNormal];
    [small addTarget:self action:@selector(selectBudget:) forControlEvents:UIControlEventTouchUpInside];
    [small setTitleColor:self.customPink forState:UIControlStateNormal];
    [small.layer setBorderColor:[self.customPink CGColor]];
    [small.layer setBorderWidth:1];
    small.titleLabel.font = [UIFont fontWithName:@"Avenir" size:11];
    
    UIButton *medium = [UIButton buttonWithType:UIButtonTypeCustom];
    medium.frame = CGRectMake(self.view.frame.origin.x + 25, mobile.frame.origin.y + 50, self.view.frame.size.width - 50, 35);
    [medium setTitle:@"MEDIUM" forState:UIControlStateNormal];
    [medium addTarget:self action:@selector(selectBudget:) forControlEvents:UIControlEventTouchUpInside];
    [medium setTitleColor:self.customPink forState:UIControlStateNormal];
    [medium.layer setBorderColor:[self.customPink CGColor]];
    [medium.layer setBorderWidth:1];
    medium.titleLabel.font = [UIFont fontWithName:@"Avenir" size:11];
    
    UIButton *large = [UIButton buttonWithType:UIButtonTypeCustom];
    large.frame = CGRectMake(self.view.frame.origin.x + 25, web.frame.origin.y + 50, self.view.frame.size.width - 50, 35);
    [large setTitle:@"LARGE" forState:UIControlStateNormal];
    [large addTarget:self action:@selector(selectBudget:) forControlEvents:UIControlEventTouchUpInside];
    [large setTitleColor:self.customPink forState:UIControlStateNormal];
    [large.layer setBorderColor:[self.customPink CGColor]];
    [large.layer setBorderWidth:1];
    large.titleLabel.font = [UIFont fontWithName:@"Avenir" size:11];
    
    [self.view4 addSubview:self.header4];
    [self.view4 addSubview:info4];
    [self.view4 addSubview:back4];
    [self.view4 addSubview:budgetLabel];
    [self.view4 addSubview: small];
    [self.view4 addSubview:medium];
    [self.view4 addSubview:large];
    
    //Contact Info Overlay (#5)
    self.view5 = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/1.1, 600, 600)];
    self.view5.backgroundColor = self.customDarkGrey;
    [self.view addSubview:self.view5];
    
    [self registerForKeyboardNotifications];
    
    self.header5 = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 15, 10, 30, 30)];
    self.header5.image = [UIImage imageNamed:@"Idea.png"];
    
    UIImageView *headerLogo5 = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - self.view.frame.size.width/5, 5, self.view.frame.size.width/2.7, self.view.frame.size.height / 13.5)];
    headerLogo5.image = [UIImage imageNamed:@"LogoHeader.png"];
    
    UILabel *contactInfo = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 50, self.view.frame.size.height/4, 150, 30)];
    contactInfo.text = @"PRODUCT IDEA";
    contactInfo.textColor = [UIColor whiteColor];
    contactInfo.font = [UIFont fontWithName:@"Avenir" size:12];
    
    UIButton *back5 = [UIButton buttonWithType:UIButtonTypeCustom];
    back5.frame = CGRectMake(0, 10, 100, 30);
    [back5 setTitle:@"BACK" forState:UIControlStateNormal];
    back5.titleLabel.textColor = [UIColor whiteColor];
    [back5 addTarget:self action:@selector(backButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *info5 = [UIButton buttonWithType:UIButtonTypeCustom];
    info5.frame = CGRectMake(self.view.frame.size.width - 55, self.view.frame.size.height/4, 30, 30);
    [info5 setImage:[UIImage imageNamed:@"Info@2x-17.png"] forState:UIControlStateNormal];
    [info5 addTarget:self action:@selector(infoCalloutOnButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    info5.tag = 5;
    
    self.appDescription = [[UITextView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x + 25, productIdeaLabel.frame.origin.y + 65, self.view.frame.size.width - 50, 150)];
    self.appDescription.backgroundColor = [UIColor clearColor];
    self.appDescription.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.appDescription.layer.borderWidth = 1;
    self.appDescription.textColor = [UIColor lightGrayColor];
    [self.appDescription setText:@"BRIEF DESCRIPTION"];
    self.appDescription.font = [UIFont fontWithName:@"Avenir" size:11];
    [self.appDescription setTag:1];
    self.appDescription.delegate = self;
    
    UILabel *contactLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 50, self.appDescription.frame.origin.y + 175, self.view.frame.size.width - 50, 30)];
    contactLabel.text = @"CONTACT INFO";
    contactLabel.textColor = [UIColor whiteColor];
    contactLabel.font = [UIFont fontWithName:@"Avenir" size:12];
    
    self.name = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.origin.x + 25, contactLabel.frame.origin.y + 50, self.view.frame.size.width - 50, 35)];
    self.name.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.name.layer.borderWidth = 1;
    self.name.font = [UIFont fontWithName:@"Avenir" size:12];
    self.name.textColor = [UIColor whiteColor];
    self.name.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"   NAME" attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
    self.name.font = [UIFont fontWithName:@"Avenir" size:11];
    self.name.tag = 1;
    self.name.delegate = self;
    
    self.email = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.origin.x + 25, self.name.frame.origin.y + 50, self.view.frame.size.width - 50, 35)];
    self.email.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.email.layer.borderWidth = 1;
    self.email.textColor = [UIColor whiteColor];
    self.email.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"   EMAIL" attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
    self.email.font = [UIFont fontWithName:@"Avenir" size:11];
    self.email.tag = 2;
    self.email.delegate = self;
    
    self.meetingTimes = [UIButton buttonWithType:UIButtonTypeCustom];
    self.meetingTimes.frame = CGRectMake(self.view5.frame.origin.x + 25, self.view.frame.size.height - 50, self.view.frame.size.width - 50, 30);
    [self.meetingTimes setTitle:@"SCHEDULE MEETING" forState:UIControlStateNormal];
    [self.meetingTimes addTarget:self action:@selector(pickMeeting:) forControlEvents:UIControlEventTouchUpInside];
    [self.meetingTimes setTitleColor:self.customDarkGrey forState:UIControlStateNormal];
    [self.meetingTimes.layer setBackgroundColor:[UIColor whiteColor].CGColor];
    self.meetingTimes.titleLabel.font = [UIFont fontWithName:@"Avenir" size:11];
    
    [self.view5 addSubview:self.header5];
    [self.view5 addSubview:contactInfo];
    [self.view5 addSubview:back5];
    [self.view5 addSubview:info5];
    [self.view5 addSubview:contactLabel];
    [self.view5 addSubview:self.name];
    [self.view5 addSubview:self.email];
    [self.view5 addSubview:self.appDescription];
    [self.view5 addSubview: self.meetingTimes];
    
    //Kick Off Meeting Overlay (#6)
    self.view6 = [[UIView alloc] initWithFrame:CGRectMake(0, 800, 600, 600)];
    self.view6.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.view6];
    
    UILabel *selectMeetingTime = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 60, self.view.frame.size.height/4, 150, 30)];
    selectMeetingTime.text = @"KICKOFF MEETING TIME";
    selectMeetingTime.textColor = [UIColor whiteColor];
    selectMeetingTime.font = [UIFont fontWithName:@"Avenir" size:12];
    
    UIImageView *headerLogo6 = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - self.view.frame.size.width/5, 5, self.view.frame.size.width/2.7, self.view.frame.size.height / 13.5)];
    headerLogo6.image = [UIImage imageNamed:@"LogoHeader.png"];
    
    UIButton *back6 = [UIButton buttonWithType:UIButtonTypeCustom];
    back6.frame = CGRectMake(0, 10, 100, 30);
    [back6 setTitle:@"BACK" forState:UIControlStateNormal];
    back6.titleLabel.textColor = [UIColor whiteColor];
    [back6 addTarget:self action:@selector(backButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *info6 = [UIButton buttonWithType:UIButtonTypeCustom];
    info6.frame = CGRectMake(self.view.frame.size.width - 55, self.view.frame.size.height/4, 30, 30);
    [info6 setImage:[UIImage imageNamed:@"Info@2x-17.png"] forState:UIControlStateNormal];
    [info6 addTarget:self action:@selector(infoCalloutOnButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    info6.tag = 6;
    
    UIButton *day1 = [UIButton buttonWithType:UIButtonTypeCustom];
    day1.frame = CGRectMake(self.view.frame.origin.x + 25, productIdeaLabel.frame.origin.y + 65, self.view.frame.size.width - 50, 35);
    [day1 setTitle:self.day1String forState:UIControlStateNormal];
    [day1 addTarget:self action:@selector(scheduleMeeting:) forControlEvents:UIControlEventTouchUpInside];
    [day1 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [day1.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
    [day1.layer setBorderWidth:1];
    
    UIButton *day2 = [UIButton buttonWithType:UIButtonTypeCustom];
    day2.frame = CGRectMake(self.view.frame.origin.x + 25, mobile.frame.origin.y + 50, self.view.frame.size.width - 50, 35);
    [day2 setTitle:self.day2String forState:UIControlStateNormal];
    [day2 addTarget:self action:@selector(scheduleMeeting:) forControlEvents:UIControlEventTouchUpInside];
    [day2 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [day2.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
    [day2.layer setBorderWidth:1];
    
    UIButton *day3 = [UIButton buttonWithType:UIButtonTypeCustom];
    day3.frame = CGRectMake(self.view.frame.origin.x + 25, web.frame.origin.y + 50, self.view.frame.size.width - 50, 35);
    [day3 setTitle:self.day3String forState:UIControlStateNormal];
    [day3 addTarget:self action:@selector(scheduleMeeting:) forControlEvents:UIControlEventTouchUpInside];
    [day3 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [day3.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
    [day3.layer setBorderWidth:1];
    
    UIButton *day4 = [UIButton buttonWithType:UIButtonTypeCustom];
    day4.frame = CGRectMake(self.view.frame.origin.x + 25, day3.frame.origin.y + 50, self.view.frame.size.width - 50, 35);
    [day4 setTitle:self.day4String forState:UIControlStateNormal];
    [day4 addTarget:self action:@selector(scheduleMeeting:) forControlEvents:UIControlEventTouchUpInside];
    [day4 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [day4.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
    [day4.layer setBorderWidth:1];
    
    UIButton *day5 = [UIButton buttonWithType:UIButtonTypeCustom];
    day5.frame = CGRectMake(self.view.frame.origin.x + 25, day4.frame.origin.y + 50, self.view.frame.size.width - 50, 35);
    [day5 setTitle:self.day5String forState:UIControlStateNormal];
    [day5 addTarget:self action:@selector(scheduleMeeting:) forControlEvents:UIControlEventTouchUpInside];
    [day5 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [day5.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
    [day5.layer setBorderWidth:1];
    
    UIButton *time1 = [UIButton buttonWithType:UIButtonTypeCustom];
    time1.frame = CGRectMake(self.view.frame.origin.x + 25, day5.frame.origin.y + 50, day5.frame.size.width/ 3 - 10, 35);
    [time1 setTitle:@"10:00AM" forState:UIControlStateNormal];
    [time1 addTarget:self action:@selector(scheduleTime:) forControlEvents:UIControlEventTouchUpInside];
    [time1 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [time1.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
    [time1.layer setBorderWidth:1];
    
    UIButton *time2 = [UIButton buttonWithType:UIButtonTypeCustom];
    time2.frame = CGRectMake(time1.frame.origin.x + time1.frame.size.width + 15, time1.frame.origin.y, time1.frame.size.width, 35);
    [time2 setTitle:@"1:00PM" forState:UIControlStateNormal];
    [time2 addTarget:self action:@selector(scheduleTime:) forControlEvents:UIControlEventTouchUpInside];
    [time2 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [time2.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
    [time2.layer setBorderWidth:1];
    
    UIButton *time3 = [UIButton buttonWithType:UIButtonTypeCustom];
    time3.frame = CGRectMake(time2.frame.origin.x + time1.frame.size.width + 15, time1.frame.origin.y, time1.frame.size.width, 35);
    [time3 setTitle:@"3:00PM" forState:UIControlStateNormal];
    [time3 addTarget:self action:@selector(scheduleTime:) forControlEvents:UIControlEventTouchUpInside];
    [time3 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [time3.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
    [time3.layer setBorderWidth:1];
    
    UIButton *submit = [UIButton buttonWithType:UIButtonTypeCustom];
    submit.frame = CGRectMake(self.view5.frame.origin.x + 25, self.view.frame.size.height - 50, self.view.frame.size.width - 50, 35);
    [submit setTitle:@"Submit" forState:UIControlStateNormal];
    [submit addTarget:self action:@selector(submitDetails:) forControlEvents:UIControlEventTouchUpInside];
    [submit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [submit.layer setBackgroundColor:self.customPurple.CGColor];
    
    self.meetingButtonArry = @[day1, day2, day3, day4, day5];
    self.meetingTimeArray = @[time1, time2, time3];

    [self.view6 addSubview:selectMeetingTime];
    [self.view6 addSubview:back6];
    [self.view6 addSubview:info6];
    [self.view6 addSubview: day1];
    [self.view6 addSubview:day2];
    [self.view6 addSubview:day3];
    [self.view6 addSubview:day4];
    [self.view6 addSubview:day5];
    [self.view6 addSubview:time1];
    [self.view6 addSubview:time2];
    [self.view6 addSubview:time3];
    [self.view6 addSubview:submit];
    
    self.viewArray = @[self.view,
                       self.view2,
                       self.view3,
                       self.view4,
                       self.view5,
                       self.view6];
    
    self.originRectsArray = @[NSStringFromCGRect(self.view.frame),
                              NSStringFromCGRect(self.view2.frame),
                              NSStringFromCGRect(self.view3.frame),
                              NSStringFromCGRect(self.view4.frame),
                              NSStringFromCGRect(self.view5.frame),
                              NSStringFromCGRect(self.view6.frame)
                              ];
    
    self.headerArray = @[self.header1,
                         self.header2,
                         self.header3,
                         self.header4,
                         self.header5,
                         self.header6];
    
    self.backButtonsArray = @[back1,
                              back2,
                              back3,
                              back4,
                              back5,
                              back6];
    
    self.logoArray = @[headerLogo1,
                       headerLogo2,
                       headerLogo3,
                       headerLogo4,
                       headerLogo5,
                       headerLogo6];
    
    [self hideAllBackButtons];
    [self hideAllLogos];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(void)hideAllBackButtons
{
    for (UIButton *button in self.backButtonsArray) {
        [button setHidden:YES];
        [button setEnabled:YES];
    }
}

-(void)hideAllLogos
{
    for (UIImageView *logo in self.logoArray) {
        [logo setHidden:YES];
    }
}

-(UIButton *)hideBackButtonAtPageIndex
{
    UIButton *back = [self.backButtonsArray objectAtIndex:_i];
    return back;
}

-(UIImageView *)hideLogoAtPageIndex
{
    UIImageView *logo = [self.logoArray objectAtIndex:_i];
    return logo;
}

-(UIButton *)showButtonAtPageIndex
{
    UIButton *back = [self.backButtonsArray objectAtIndex:_i];
    [back setHidden:NO];
    [back setEnabled:YES];
    return back;
}

-(UIImageView *)showLogoAtPageIndex
{
    UIImageView *logo = [self.logoArray objectAtIndex:_i];
    [logo setHidden:NO];
    return logo;
}

-(IBAction)infoCalloutOnButtonTapped:(UIButton *)sender
{
    if (sender.tag == 1)
    {
        UIAlertView *platformCallout = [[UIAlertView alloc] initWithTitle:@"Product Platform" message:@"\nMobile: A Mobile App on iOS or Android\n\nWeb: A Ruby on Rails Web Application\n\nBoth: When you need an application integrated across web and mobile platforms." delegate:self cancelButtonTitle:@"Got It!" otherButtonTitles: nil];
        [platformCallout show];
    }
    else if(sender.tag == 2)
    {
        UIAlertView *scopeCallout = [[UIAlertView alloc] initWithTitle:@"Project Scope" message:@"\nMVP: An early first version of your product that fully enables a startup to build more features, measure its impact, revenue model of user generation and learn more about what the target user really wants.\n\nBasic: A full-scale application build that includes extensive API or framework integration and a robust backend database solution. This level of application usually requires moderate software architecture planning up front.\n\nComplex: Heavy cloud resources are required for deployment security and scalability. Also includes cross platform integrations across different operating systems." delegate:self cancelButtonTitle:@"Got It!" otherButtonTitles: nil];
        [scopeCallout show];
    }
    else if(sender.tag == 3)
    {
        UIAlertView *teamCallout = [[UIAlertView alloc] initWithTitle:@"Team Scale" message:@"\nOne Person: 1 Developer\nSmall: 2-4 Developers\nLarge: 5+ Developers" delegate:self cancelButtonTitle:@"Got It!" otherButtonTitles: nil];
        [teamCallout show];
    }
    else if(sender.tag == 4)
    {
        UIAlertView *budgetCallout = [[UIAlertView alloc] initWithTitle:@"Product Budget" message:@"\nSmall: $12,500 - $35,000\n\nMedium: $25,000 - $50,000 (suited for multiple platform builds)\n\nLarge: $50,000+ (suited for game development + complex web & app solutions)" delegate:self cancelButtonTitle:@"Got It!" otherButtonTitles: nil];
        [budgetCallout show];
    }
    else if(sender.tag == 5)
    {
        UIAlertView *infoCallout = [[UIAlertView alloc] initWithTitle:@"Product Idea" message:@"\nDescript your app to us in 400 characters or less. We will go into further detail during our KickOff Meeting." delegate:self cancelButtonTitle:@"Got It!" otherButtonTitles: nil];
        [infoCallout show];
    }
    else if(sender.tag == 6)
    {
        UIAlertView *meetingCallout = [[UIAlertView alloc] initWithTitle:@"Kickoff Meeting Time" message:@"\nGive us a time convenient for you to discuss your vision and we'll schedule a KickOff Meeting to get things started!" delegate:self cancelButtonTitle:@"Got It!" otherButtonTitles: nil];
        [meetingCallout show];
    }
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    textView.text = @"";
    
    return YES;
}

- (void)textViewDidEndEditing:(UITextView *) textView
{
    self.contactAppDescription = textView.text;
}

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:)name:UIKeyboardDidShowNotification object:nil];
}

- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    self.keyboardSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"" attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
    
    [UIView animateWithDuration:0.2 animations:^{
        CGRect keyboard = CGRectMake(0, self.view5.frame.origin.y - self.keyboardSize.height, self.view5.frame.size.width, self.view5.frame.size.height);
        self.view5.frame = keyboard;
    }];
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [UIView animateWithDuration:0.3 animations:^{
        self.view5.frame = self.view.frame;
    }];
}

-(IBAction)selectProjectIdea:(UIButton *)sender
{
    self.productIdea = [sender.titleLabel.text lowercaseString];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.view2.backgroundColor = [UIColor blackColor];
        self.view2.frame = self.view.frame;
        
        UILabel *topLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height / 10)];
        topLabel.backgroundColor = self.customBlue;
        
        UIImageView *view2Image = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 15, self.view.frame.size.height / 6, 30, 30)];
        view2Image.image = [UIImage imageNamed:@"Product.png"];
        
        _i += 1;
        
        [self.view2 addSubview:topLabel];
        [self.view2 addSubview:[self showLogoAtPageIndex]];
        [self.view2 addSubview:[self showButtonAtPageIndex]];
        [self.view2 addSubview:view2Image];
        [self.view2 addSubview:self.topImage];
    }];
}

-(IBAction)selectProductNeed:(UIButton *)sender
{
    self.productNeed = [sender.titleLabel.text lowercaseString];

    [UIView animateWithDuration:0.3 animations:^{
        self.view3.backgroundColor = [UIColor blackColor];
        self.view3.frame = self.view.frame;
        
        UILabel *topLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height / 10)];
        topLabel.backgroundColor = self.customGreen;
        
        UIImageView *view3Image = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 15, self.view.frame.size.height / 6, 30, 30)];
        view3Image.image = [UIImage imageNamed:@"Team.png"];
        
        _i += 1;
        
        [self.view3 addSubview:topLabel];
        [self.view3 addSubview:[self showButtonAtPageIndex]];
        [self.view3 addSubview:[self showLogoAtPageIndex]];
        [self.view3 addSubview:view3Image];
        [self.view3 addSubview:self.topImage];
    }];
}

-(IBAction)selectTeamNeeded:(UIButton *)sender
{
    self.teamNeed = [sender.titleLabel.text lowercaseString];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.view4.backgroundColor = [UIColor blackColor];
        self.view4.frame = self.view.frame;
        
        UILabel *topLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height / 10)];
        topLabel.backgroundColor = self.customPink;
        
        UIImageView *view4Image = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 15, self.view.frame.size.height / 6, 30, 30)];
        view4Image.image = [UIImage imageNamed:@"Budget"];
        
        _i += 1;
        
        [self.view4 addSubview:topLabel];
        [self.view4 addSubview:[self showButtonAtPageIndex]];
        [self.view4 addSubview:[self showLogoAtPageIndex]];
        [self.view4 addSubview:view4Image];
        [self.view4 addSubview:self.topImage];
    }];
}

-(IBAction)selectBudget:(UIButton *)sender
{
    self.budget = [sender.titleLabel.text lowercaseString];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.view5.backgroundColor = [UIColor blackColor];
        self.view5.frame = self.view.frame;
        
        UILabel *topLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height / 10)];
        topLabel.backgroundColor = self.customDarkGrey;
        
        UIImageView *view5Image = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 15, self.view.frame.size.height / 6, 30, 30)];
        view5Image.image = [UIImage imageNamed:@"Idea"];
        
        _i += 1;
        
        [self.view5 addSubview:topLabel];
        [self.view5 addSubview:[self showButtonAtPageIndex]];
        [self.view5 addSubview:[self showLogoAtPageIndex]];
        [self.view5 addSubview:view5Image];
        [self.view5 addSubview:self.topImage];
    }];
}

-(IBAction)pickMeeting:(id)sender
{
    self.contactName = self.name.text;
    self.contactEmail = self.email.text;
    self.contactAppDescription = self.appDescription.text;
    
    if ([self.appDescription.text isEqualToString:@""] || [self.name.text isEqualToString:@""] || [self.email.text isEqualToString:@""])
    {
        UIAlertView *emptyFieldsAlert = [[UIAlertView alloc] initWithTitle:@"Hold it" message:@"All fields must be filled out before we can complete your project request." delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        [emptyFieldsAlert show];
    }
    else
    {
        [UIView animateWithDuration:0.3 animations:^{
            
            [self.name resignFirstResponder];
            [self.email resignFirstResponder];
            [self.appDescription resignFirstResponder];
            
            self.view6.backgroundColor = [UIColor blackColor];
            self.view6.frame = self.view.frame;
            
            UILabel *topLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height / 10)];
            topLabel.backgroundColor = self.customDarkGrey;
            
            UIImageView *view6Image = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 15, self.view.frame.size.height / 6, 30, 30)];
            view6Image.image = [UIImage imageNamed:@"Calendar.png"];
            
            _i += 1;
            
            [self.view6 addSubview:topLabel];
            [self.view6 addSubview:[self showButtonAtPageIndex]];
            [self.view6 addSubview:[self showLogoAtPageIndex]];
            [self.view6 addSubview:view6Image];
            [self.view6 addSubview:self.topImage];
        }];
    }
}

-(IBAction)scheduleMeeting:(UIButton *)sender
{
    self.meetingDay = sender.titleLabel.text;
 
    for (UIButton *button in self.meetingButtonArry)
    {
        UIButton *buttonPressed = (UIButton *)button;
        
        if (buttonPressed != sender && button.enabled)
        {
            [button setBackgroundColor:[UIColor blackColor]];
            [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            button.layer.borderColor = [UIColor lightGrayColor].CGColor;
        }
        else
        {
            [button setBackgroundColor:self.customPurple];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            button.layer.borderColor = [UIColor clearColor].CGColor;
        }
    }
}

-(IBAction)scheduleTime:(UIButton *)sender
{
    self.meetingTime = sender.titleLabel.text;
    
    for (UIButton *button in self.meetingTimeArray)
    {
        UIButton *buttonPressed = (UIButton *)button;
        
        if (buttonPressed != sender && button.enabled)
        {
            [button setBackgroundColor:[UIColor blackColor]];
            [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            button.layer.borderColor = [UIColor lightGrayColor].CGColor;
        }
        else
        {
            [button setBackgroundColor:self.customPurple];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            button.layer.borderColor = [UIColor clearColor].CGColor;
        }
    }
}

-(void)getTime
{
    //set up date formatters
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateFormatter *dateAndTimeFormat = [[NSDateFormatter alloc] init];
    [dateAndTimeFormat setDateFormat:@"EEEE MM/dd/YYYY"];
    [dateAndTimeFormat setLocale:[NSLocale currentLocale]];
    
    NSDate *today = [cal dateByAddingUnit:NSCalendarUnitDay value:1 toDate:[NSDate date] options:0];
    NSMutableArray *dateArray = [[NSMutableArray alloc] init];
    
    //get the next 7 days
    for (int i = 0; i <7; i++)
    {
        NSDateFormatter *weekdayFormat = [[NSDateFormatter alloc] init];
        [weekdayFormat setDateFormat:@"EEEE"];
        NSDate *weekday = [cal dateByAddingUnit:NSCalendarUnitDay value:i toDate:today options:0];
        NSString *stringDate = [weekdayFormat stringFromDate:weekday];
        NSString *stringDateFinal = [dateAndTimeFormat stringFromDate:weekday];
        
        //check and remove saturday and sunday
        if ([stringDate isEqualToString:@"Saturday"] || [stringDate isEqualToString:@"Sunday"])
        {
            
        }
        else
        {
            [dateArray addObject:stringDateFinal];
        }
    }
    
    //set button strings for selection
    self.day1String = [dateArray objectAtIndex:0];
    self.day2String = [dateArray objectAtIndex:1];
    self.day3String = [dateArray objectAtIndex:2];
    self.day4String = [dateArray objectAtIndex:3];
    self.day5String = [dateArray objectAtIndex:4];
    
    self.meetingTime = @"";
    self.meetingDay = @"";
}

-(IBAction)submitDetails:(UIButton *)sender
{
    self.meetingFinal = [NSString stringWithFormat:@"%@ %@", self.meetingDay, self.meetingTime];
    
    if ([self.meetingDay isEqualToString:@""] || [self.meetingTime isEqualToString:@""])
    {
        UIAlertView *emptyFieldsAlert = [[UIAlertView alloc] initWithTitle:@"Hold it" message:@"Please select a day and time for the project kickoff meeting." delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        [emptyFieldsAlert show];
    }
    else
    {
        NSString *alertMessage = [NSString stringWithFormat:@"Is this correct?\n\nPlatform: %@\nProduct Need: %@\nTeam Need: %@\nBudget: %@\nContact Name: %@\nContact Email: %@\nApplication Description: %@\nMeeting Time: %@", self.productIdea, self.productNeed, self.teamNeed, self.budget, self.contactName, self.contactEmail, self.contactAppDescription, self.meetingFinal];
        
        UIAlertView *emailAlert = [[UIAlertView alloc] initWithTitle:@"Check Your Order" message:alertMessage delegate:self cancelButtonTitle:@"No, Restart" otherButtonTitles:@"Yes!", nil];
        emailAlert.tag = 2;
        [emailAlert show];
    }
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self cycleTheGlobalMailComposer];
    [self dismissViewControllerAnimated:YES completion:^{
        [self performSegueWithIdentifier:@"faqSegueID" sender:self];
    }];
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
        
        NSArray *emails = @[@"team@coderexp.com"];
        NSString *subject = @"Welcome to Coder[EXP]!";
        NSString *message = [NSString stringWithFormat:@"Platform: %@\nProduct Need: %@\nTeam Need: %@\nBudget: %@\nContact Name: %@\nContact Email: %@\nApplication Description: %@\nKickoff Meeting: %@", self.productIdea, self.productNeed, self.teamNeed, self.budget, self.contactName, self.contactEmail, self.contactAppDescription, self.meetingFinal];
        
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

- (IBAction)backButton:(UIButton *)sender
{
    [[self hideBackButtonAtPageIndex] removeFromSuperview];
    [[self hideLogoAtPageIndex] removeFromSuperview];

    if (_i > 1) {
        _i--;
        
        [UIView animateWithDuration:0.3 animations:^{
            //Paging navigation
            UIView *previousView = [self.viewArray objectAtIndex:_i];
            CGRect previousOrigin = CGRectFromString([self.originRectsArray objectAtIndex:_i]);
            previousView.frame = previousOrigin;
            
            //Show/hide title images and back buttons
            [previousView addSubview:[self.headerArray objectAtIndex:_i]];
        }];
    }
}

@end
