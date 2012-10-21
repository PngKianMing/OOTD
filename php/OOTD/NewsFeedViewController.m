//
//  ManageFriendsViewController.m
//  Twee-Ta-Doo
//
//  Created by LARC User on 27/7/12.
//
//

#import "NewsFeedViewController.h"
#import "CustomTableViewCell.h"
#import "KGModal.h"
#import "SVProgressHUD.h"
#import <QuartzCore/QuartzCore.h>
#import "AddNewsViewController.h"

@implementation NewsFeedViewController

@synthesize myTableView = _tableView;
@synthesize authorLabel;
@synthesize timeStampLabel;
@synthesize commentLabel;
@synthesize commentImage;
@synthesize profileImage,takePic,comments,photoHolder,comments2,comments3,selfComments,likeCount;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:@"NewsFeedViewController" bundle:nil];
    if (self){
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refresh) name:@"refresh" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refresh2) name:@"AddNewsFeed" object:nil];
        
        self.title = NSLocalizedString(@"Newsfeed", @"Newsfeed");
        self.tabBarItem.image = [UIImage imageNamed:@"news.png"];
        authorLabel = [[NSMutableArray alloc]initWithCapacity:0];
        timeStampLabel = [[NSMutableArray alloc]initWithCapacity:0];
        commentLabel = [[NSMutableArray alloc]initWithCapacity:0];
        commentImage = [[NSMutableArray alloc]initWithCapacity:0];
        profileImage = [[NSMutableArray alloc]initWithCapacity:0];
        selfComments = [[NSMutableArray alloc]initWithCapacity:0];
        likeCount = [[NSMutableArray alloc]initWithCapacity:0];
        
        UIImage* image1 = [UIImage imageNamed:@"jessprofile.jpg"];
        UIImage* image2 = [UIImage imageNamed:@"emmaprofile.jpg"];
        UIImage* image3 = [UIImage imageNamed:@"bradprofile.jpg"];
        
        [profileImage addObject:image1];
        [profileImage addObject:image2];
        [profileImage addObject:image3];
        
        UIImage* image4 = [UIImage imageNamed:@"jess.jpg"];
        UIImage* image5 = [UIImage imageNamed:@"emma.jpg"];
        UIImage* image6 = [UIImage imageNamed:@"brad.jpg"];
        [commentImage addObject:image4];
        [commentImage addObject:image5];
        [commentImage addObject:image6];
        
        [commentLabel addObject:@"Check out my Dress !!"];
        [commentLabel addObject:@"Do I look pretty ??!!"];
        [commentLabel addObject:@"I am so cool in this coat!!"];
        
        [authorLabel addObject:@"Jessica Alba"];
        [authorLabel addObject:@"Emma Watson"];
        [authorLabel addObject:@"Brad Pitt"];
        
        [timeStampLabel addObject:@"1 min ago"];
        [timeStampLabel addObject:@"6 min ago"];
        [timeStampLabel addObject:@"13 min ago"];
        
        [selfComments addObject:@" "];
        [selfComments addObject:@" "];
        [selfComments addObject:@" "];
        
        [likeCount addObject:[NSNumber numberWithInt:10]];
        [likeCount addObject:[NSNumber numberWithInt:4]];
        [likeCount addObject:[NSNumber numberWithInt:0]];
	}
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //_tableView.separatorColor=[UIColor clearColor];
    //_tableView.backgroundColor = [UIColor clearColor];
    

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    myTableView.delegate = nil;
    myTableView = nil;
  
    authorLabel = nil;
    timeStampLabel = nil;
    commentLabel = nil;
    commentImage = nil;
    profileImage = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation == UIInterfaceOrientationPortrait) || (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return profileImage.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    CustomTableViewCell *cell = (CustomTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        [[NSBundle mainBundle] loadNibNamed:@"CustomTableViewCell" owner:self options:nil];
        cell = customCell;
	}
    cell.authorImage.image = [profileImage objectAtIndex:indexPath.row];
    cell.commentImage.image = [commentImage objectAtIndex:indexPath.row];
    cell.commentLabel2.text = [selfComments objectAtIndex:indexPath.row];
    cell.commentLabel.text = [[@"\" " stringByAppendingString:[commentLabel objectAtIndex:indexPath.row]] stringByAppendingString:@" \""];
    cell.authorLabel.text = [[authorLabel objectAtIndex:indexPath.row] stringByAppendingString:@" says"];
    cell.timeStampLabel.text = [timeStampLabel objectAtIndex:indexPath.row];
    [cell.likeButton setTag:indexPath.row];
    [cell.likeButton addTarget:self
                        action:@selector(like:)
                        forControlEvents:UIControlEventTouchUpInside];
    
    NSString *inStr = [NSString stringWithFormat:@"%d", [[likeCount objectAtIndex:indexPath.row]intValue]];
    cell.likeLabel.text = inStr;
    [cell.commentButton setTag:indexPath.row];
    [cell.commentButton addTarget:self action:@selector(post:) forControlEvents:UIControlEventTouchUpInside];
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor=[UIColor clearColor];
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   // NSLog(@"If this message is shown means SUCCESS!!!!!");
  
    [self showAction:indexPath.row];
}

-(void)didReceiveMemoryWarning{
    
    [super didReceiveMemoryWarning];
}

-(void)like:(UIButton*)sender{
    
    int number = [[likeCount objectAtIndex:sender.tag] intValue] +1;
    [likeCount replaceObjectAtIndex:sender.tag withObject:[NSNumber numberWithInt:number]];
    [_tableView reloadData];
}

- (void)showAction:(int)index{
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 280, 400)];
    
    UIImageView* commentImage2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 280, 400)];
    commentImage2.image = [commentImage objectAtIndex:index];
    [contentView addSubview:commentImage2];
    
    [[KGModal sharedInstance] showWithContentView:contentView andAnimated:YES];
}

-(IBAction)add:(id)sender{
    AddNewsViewController* ctrl = [[AddNewsViewController alloc]initWithNibName:@"AddNewsViewController" bundle:nil];
    [self presentModalViewController:ctrl animated:YES];}

-(void)save{
    if(photoHolder){
        [commentImage addObject:photoHolder];
        [commentLabel addObject:@"This is my new collection"];
        [profileImage addObject:[UIImage imageNamed:@"stickman3.jpg"]];
        [authorLabel addObject:@"tommy"];
        [timeStampLabel addObject:@"1 sec ago"];
        [selfComments addObject:@" "];
        [likeCount addObject:[NSNumber numberWithInt:0]];
        [_tableView reloadData];
        [[KGModal sharedInstance] hide];
        [SVProgressHUD showSuccessWithStatus:@"Post Created !"];
    }else{
        [SVProgressHUD showErrorWithStatus:@"Post a Pic !"];
    }
}

-(void)post:(UIButton*)sender{
    NSLog(@"edit button pressed at %d",sender.tag);
        UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 300, 280, 120)];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [contentView addGestureRecognizer:tap];
    
    index = sender.tag;
    //comments.delegate = contentView;
    comments2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 280, 45)];
    comments2.textAlignment = UITextAlignmentCenter;
    comments2.text = @"What says you ??";
    comments2.adjustsFontSizeToFitWidth = YES;
    [comments2 setFont:[UIFont fontWithName:@"GillSans-Bold" size:19]];
    comments2.backgroundColor =[UIColor colorWithRed:250.0f/255.0f green:240.0f/255.0f blue:245.0f/255.0f alpha:0.9f];
    [comments2 setUserInteractionEnabled:FALSE];

    [contentView addSubview:comments2];
    
    comments3 = [[UITextView alloc]initWithFrame:CGRectMake(3, 43, 275, 40)];
    comments3.textAlignment = UITextAlignmentCenter;
    [comments3 setFont:[UIFont fontWithName:@"GillSans" size:13]];
    comments3.text = @"Tommy says : so pretty !!";
    comments2.adjustsFontSizeToFitWidth = YES;
    [comments2.layer setCornerRadius:8];
    comments3.backgroundColor =[UIColor colorWithRed:245.0f/255.0f green:245.0f/255.0f blue:245.0f/255.0f alpha:0.8f];
    [contentView addSubview:comments3];
    
    UIButton* anotherButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [anotherButton setFrame:CGRectMake(245, 90, 35, 25)];
    [anotherButton setBackgroundImage:[UIImage imageNamed:@"save.png"] forState:UIControlStateNormal];
    anotherButton.backgroundColor = [UIColor clearColor];
    
    [contentView addSubview:anotherButton];
    [anotherButton addTarget:self action:@selector(save2) forControlEvents:UIControlEventTouchUpInside];
    [[KGModal sharedInstance] showWithContentView:contentView andAnimated:YES];
}

-(void)dismissKeyboard {
    [comments3 resignFirstResponder];
    NSLog(@"Tapped Out !!");
}

-(void)save2{
    [selfComments replaceObjectAtIndex:index withObject:comments3.text];
    [[KGModal sharedInstance] hide];
    [_tableView reloadData];
    [SVProgressHUD showSuccessWithStatus:@"Comments Posted !"];
}

-(void)takePhoto{
    
    photoHolder = [UIImage imageNamed:@"cam1.png"];
    takePic.image = photoHolder;
}

-(void)refresh{
    NSLog(@"Message recieved!!");
    NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"image"];
    UIImage* image = [UIImage imageWithData:imageData];
    NSString *savedValue = [[NSUserDefaults standardUserDefaults]
                            stringForKey:@"preferenceName"];
    
    
    if(image && savedValue){
        [commentImage addObject:image];
        [commentLabel addObject:savedValue];
        [profileImage addObject:[UIImage imageNamed:@"stickman3.jpg"]];
        [authorLabel addObject:@"tommy"];
        [timeStampLabel addObject:@"1 sec ago"];
        [selfComments addObject:@" "];
        [likeCount addObject:[NSNumber numberWithInt:0]];
        [_tableView reloadData];

    }else{
    
    }
       //[[KGModal sharedInstance] hide];
    //[SVProgressHUD showSuccessWithStatus:@"Post Created !"];
}

-(IBAction)logout:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sign Out" message:@"Confirm your choice?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Sign Out", nil];
    [alert setTag:1];
    [alert show];

    
}

- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    // the user clicked one of the OK/Cancel buttons
    
    if(actionSheet.tag == 1)
    {
        if (buttonIndex == 0)
        {
            
        }
        else
        {
            [self dismissModalViewControllerAnimated:YES];
            [SVProgressHUD showErrorWithStatus:@"Sign Out Successful !"];}
        }
}

-(void)refresh2{
    NSLog(@"Message recieved!!");
    NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"NewsImage"];
    UIImage* image = [UIImage imageWithData:imageData];
    NSString *savedValue = [[NSUserDefaults standardUserDefaults]
                            stringForKey:@"NewsText"];
   
    if(image && savedValue){
        [commentImage addObject:image];
        [commentLabel addObject:savedValue];
        [profileImage addObject:[UIImage imageNamed:@"stickman3.jpg"]];
        [authorLabel addObject:@"tommy"];
        [timeStampLabel addObject:@"1 sec ago"];
        [selfComments addObject:@" "];
        [likeCount addObject:[NSNumber numberWithInt:0]];
        [_tableView reloadData];
    }else{
        [SVProgressHUD showErrorWithStatus:@"Post a Pic !"];
    }
}

@end
