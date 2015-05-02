

#import "ScoreViewController.h"

@interface ScoreViewController ()<UITextFieldDelegate>

@property (strong,nonatomic) UIScrollView *scrollView;

@property (strong,nonatomic) NSMutableArray *scoreLabels;

@property (nonatomic, strong) UITextField *name;

@end

@implementation ScoreViewController

CGFloat topRow = 25;
CGFloat margin = 15;
CGFloat top = 0;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat screenWidth = self.view.frame.size.width;
    CGFloat screenHeight = self.view.frame.size.height;
    
    self.scoreLabels = [NSMutableArray new];
    
    //create the scroll view
    
    self.scrollView = [UIScrollView new];
    
    self.title = @"Score Keeper";
    self.scrollView.frame = CGRectMake(0, topRow, screenWidth, screenHeight);
    self.scrollView.backgroundColor = [UIColor grayColor];
    //calling the scroll view - message to system.
    [self.view addSubview:self.scrollView];
    CGSize contentSize = CGSizeMake(screenWidth, screenHeight *2);
    self.scrollView.contentSize = contentSize;
    
    //for loop to add the 4 different lines or score labels.
    for (int i = 0; i<4; i++)
    {
        [self addScoreView : i];
    }
    
    
}
//adding addScoreView Methodd
-(void) addScoreView: (int)index
{
    CGFloat scrollViewWidth = self.view.frame.size.width;
    
    UIView *sectionView = [UIView new];
    sectionView.frame = CGRectMake(0, top +2, scrollViewWidth, 100);
    sectionView.backgroundColor = [UIColor whiteColor];
    //calling the scroll view and sections
    [self.scrollView addSubview:sectionView];
    //adding margin between sections.
    top +=110;
    
    //creating the name section;
    self.name = [UITextField new];
    self.name.delegate = self;
    self.name.frame = CGRectMake(margin - 5, 40, 70, 20);
    self.name.backgroundColor = [UIColor whiteColor];
    self.name.placeholder = @"name";
    //calling the sections view
    [sectionView addSubview:self.name];
    
    //creation of the score labe;
    UILabel *score = [UILabel new];
    score.frame = CGRectMake(120, 40, 35, 20);
    score.text = @"0";
    score.backgroundColor = [UIColor whiteColor];
    [sectionView addSubview:score];
    [self.scoreLabels addObject:score];
    
    //creation of the stepper
    UIStepper *button = [UIStepper new];
    button.minimumValue = -10;
    button.maximumValue = 100;
    //where was index declated?
    button.tag = index;
    button.frame = CGRectMake(scrollViewWidth- 125, 40, 50, 20);
    [button addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    //call the section and add the button
    [sectionView addSubview:button];
}


//creating the method for logging the change in value from the stepper
- (void)valueChanged:(UIStepper *)sender
{
    //naming the UIStepper stepper
    UIStepper *stepper = sender;
    NSInteger index = stepper.tag;
    int value = [stepper value];
    
    UILabel *label = self.scoreLabels[index];
    label.text = [NSString stringWithFormat:@"%d", value];
}
//
//- (void)textFieldDidBeginEditing:(UITextField *)textField {
//
//    [textField becomeFirstResponder];
//}

#pragma mark - TextField Delegate Methods

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end

