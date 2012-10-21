#import "JournalViewController.h"
#import "AppDelegate.h"
#import "ArtisteTableViewCell.h"
#import "KGModal.h"
#import "SVProgressHUD.h"
#import <QuartzCore/QuartzCore.h>
#import "AddJournalViewController.h"
#import "EditJournalViewController.h"


@implementation JournalViewController

@synthesize myTableView = _tableView;
@synthesize dayLabel,monthLabel;
@synthesize commentLabel;
@synthesize commentImage,photoHolder,takePic,comments,timeStampLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:@"JournalViewController" bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refresh) name:@"AddJournal" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(save2) name:@"EditJournal" object:nil];
        
        self.title = NSLocalizedString(@"Journal", @"Journal");
        self.tabBarItem.image = [UIImage imageNamed:@"tab-me.png"];
        
        dayLabel = [[NSMutableArray alloc]initWithCapacity:0];
        commentLabel = [[NSMutableArray alloc]initWithCapacity:0];
        commentImage = [[NSMutableArray alloc]initWithCapacity:0];
        monthLabel = [[NSMutableArray alloc]initWithCapacity:0];
        timeStampLabel= [[NSMutableArray alloc]initWithCapacity:0];
     
        UIImage* image4 = [UIImage imageNamed:@"j1.jpeg"];
        UIImage* image5 = [UIImage imageNamed:@"j2.jpeg"];
        UIImage* image6 = [UIImage imageNamed:@"j3.jpeg"];
        [commentImage addObject:image4];
        [commentImage addObject:image5];
        [commentImage addObject:image6];
        
        [commentLabel addObject:@"Finally saved up enough to buy this !!"];
        [commentLabel addObject:@"Can't remember when i bought this :("];
        [commentLabel addObject:@"This is my new favourite for this month !!"];
        
        [dayLabel addObject:@"23"];
        [dayLabel addObject:@"14"];
        [dayLabel addObject:@"03"];
        
        [monthLabel addObject:@"Jul"];
        [monthLabel addObject:@"Sep"];
        [monthLabel addObject:@"Mar"];
        
        [timeStampLabel addObject:@"4:51 PM"];
        [timeStampLabel addObject:@"5:15 PM"];
        [timeStampLabel addObject:@"8:00 PM"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    myTableView = nil;
    myTableView.delegate = nil;
    dayLabel = nil;
    commentLabel = nil;
    commentImage = nil;
    monthLabel = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation == UIInterfaceOrientationPortrait) || (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return commentLabel.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    ArtisteTableViewCell *cell = (ArtisteTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        [[NSBundle mainBundle] loadNibNamed:@"ArtisteTableViewCell" owner:self options:nil];
        cell = customCell;
	}  
    
    cell.commentImage.image = [commentImage objectAtIndex:indexPath.row];
    
    cell.commentLabel.text = [[@"\" " stringByAppendingString:[commentLabel objectAtIndex:indexPath.row]] stringByAppendingString:@" \""];
    [cell.edit setTag:indexPath.row];
    cell.dayLabel.text = [dayLabel objectAtIndex:indexPath.row];
    cell.monthLabel.text = [monthLabel objectAtIndex:indexPath.row];
    cell.timeLabel.text = [timeStampLabel objectAtIndex:indexPath.row];
    [cell.edit addTarget:self action:@selector(edit:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];    
        
    return cell;
}

- (void)showAction:(int)index{
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 280, 300)];
    
    UIImageView* commentImage2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 280, 300)];
    commentImage2.image = [commentImage objectAtIndex:index];
    [contentView addSubview:commentImage2];
    
    [[KGModal sharedInstance] showWithContentView:contentView andAnimated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    // NSLog(@"If this message is shown means SUCCESS!!!!!");
    
    [self showAction:indexPath.row];
}

-(IBAction)add:(id)sender{
    AddJournalViewController* ctrl = [[AddJournalViewController alloc]initWithNibName:@"AddJournalViewController" bundle:nil];
    [self presentModalViewController:ctrl animated:YES];
}

-(void)takePhoto{
  
    photoHolder = [UIImage imageNamed:@"cam1.png"];
    takePic.image = photoHolder;
}

-(void)edit:(UIButton*)sender{
    EditJournalViewController* ctrl = [[EditJournalViewController alloc]initWithNibName:@"EditJournalViewController" bundle:nil];
    index = sender.tag;
    ctrl.photo = [commentImage objectAtIndex:sender.tag];
    ctrl.editComments = [commentLabel objectAtIndex:sender.tag];
    [self presentModalViewController:ctrl animated:YES];
}

-(void)save2{
    NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"EditJournalImage"];
    UIImage* image = [UIImage imageWithData:imageData];
    NSString *savedValue = [[NSUserDefaults standardUserDefaults]
                            stringForKey:@"EditJournalText"];
    
    if(image && savedValue){
        NSDate *today = [NSDate date];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"dd"];
        NSInteger dayInYear = [[dateFormat stringFromDate:today] integerValue];
        NSString *inStr = [NSString stringWithFormat:@"%d", dayInYear];
        [dateFormat setDateFormat:@"MMM"];
        NSString* month = [dateFormat stringFromDate:today] ;
        [dateFormat setDateFormat:[NSDateFormatter dateFormatFromTemplate:@"hh:mm a" options:0 locale:[NSLocale currentLocale]]];
        NSString *theTime = [dateFormat stringFromDate:today];
        [commentImage replaceObjectAtIndex:index withObject:image];
        [commentLabel replaceObjectAtIndex:index withObject:savedValue];
        [dayLabel replaceObjectAtIndex:index withObject:inStr];
        [monthLabel replaceObjectAtIndex:index withObject:month];
        [timeStampLabel replaceObjectAtIndex:index withObject:theTime];
        [[KGModal sharedInstance] hide];
        [_tableView reloadData];
        [SVProgressHUD showSuccessWithStatus:@"Changes Saved !"];

    }else{
        [SVProgressHUD showErrorWithStatus:@"Post a Pic !"];
    }
}

-(void)dismissKeyboard {
    [comments resignFirstResponder];
    NSLog(@"photo taken !!");
}

-(void)refresh{
    NSLog(@"Message recieved!!");
    NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"JournalImage"];
    UIImage* image = [UIImage imageWithData:imageData];
    NSString *savedValue = [[NSUserDefaults standardUserDefaults]
                            stringForKey:@"JournalText"];
    
    if(image && savedValue){
        NSDate *today = [NSDate date];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"dd"];
        NSInteger dayInYear = [[dateFormat stringFromDate:today] integerValue];
        NSString *inStr = [NSString stringWithFormat:@"%d", dayInYear];
        [dateFormat setDateFormat:@"MMM"];
        NSString* month = [dateFormat stringFromDate:today] ;
        [dateFormat setDateFormat:[NSDateFormatter dateFormatFromTemplate:@"hh:mm a" options:0 locale:[NSLocale currentLocale]]];
        NSString *theTime = [dateFormat stringFromDate:today];
        NSLog(@"photo taken !! %@",theTime);
        [commentImage addObject:image];
        [commentLabel addObject:savedValue];
        [dayLabel addObject:inStr];
        [monthLabel addObject:month];
        [timeStampLabel addObject:theTime];
        [_tableView reloadData];
        [[KGModal sharedInstance] hide];
        [SVProgressHUD showSuccessWithStatus:@"Journal Updated !"];
    }else{
        [SVProgressHUD showErrorWithStatus:@"Post a Pic !"];
    }
}


@end
