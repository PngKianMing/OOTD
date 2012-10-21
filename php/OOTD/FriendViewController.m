//
//  FriendViewController.m
//  OOTD
//
//  Created by LARC User on 21/10/12.
//  Copyright (c) 2012 SMU. All rights reserved.
//

#import "FriendViewController.h"
#import "FriendCustomCell.h"
#import "SVProgressHUD.h"

@interface FriendViewController ()

@end

@implementation FriendViewController

@synthesize myTableView = _tableView;
@synthesize authorLabel;
@synthesize profileImage;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:@"FriendViewController" bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Friend", @"Newsfeed");
        self.tabBarItem.image = [UIImage imageNamed:@"group.png"];
        
        authorLabel = [[NSMutableArray alloc]initWithCapacity:0];
        profileImage = [[NSMutableArray alloc]initWithCapacity:0];
 
        UIImage* image1 = [UIImage imageNamed:@"jessprofile.jpg"];
        UIImage* image2 = [UIImage imageNamed:@"emmaprofile.jpg"];
        UIImage* image3 = [UIImage imageNamed:@"bradprofile.jpg"];
        UIImage* image4 = [UIImage imageNamed:@"ted.jpeg"];
        UIImage* image5 = [UIImage imageNamed:@"Tony.jpeg"];
        
        [profileImage addObject:image1];
        [profileImage addObject:image2];
        [profileImage addObject:image3];
        [profileImage addObject:image4];
        [profileImage addObject:image5];

        
        [authorLabel addObject:@"Jessica Alba"];
        [authorLabel addObject:@"Emma Watson"];
        [authorLabel addObject:@"Brad Pitt"];
        [authorLabel addObject:@"Ted"];
        [authorLabel addObject:@"Tony Stark"];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
    FriendCustomCell *cell = (FriendCustomCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        [[NSBundle mainBundle] loadNibNamed:@"FriendCustomCell" owner:self options:nil];
        cell = customCell;
	}
    cell.authorImage.image = [profileImage objectAtIndex:indexPath.row];
    cell.authorLabel.text = [authorLabel objectAtIndex:indexPath.row] ;
    [cell.unfriendButton setTag:indexPath.row];
    [cell.unfriendButton addTarget:self
                        action:@selector(unfriend:)
              forControlEvents:UIControlEventTouchUpInside];
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor=[UIColor clearColor];
    return cell;
}

-(void)unfriend:(UIButton*)sender{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Unfriending" message:@"Really remove friend?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Remove", nil];
    [alert setTag:1];
    [alert show];
    tag = sender.tag;
   
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
            [authorLabel removeObjectAtIndex:tag];
            [profileImage removeObjectAtIndex:tag];
            [_tableView reloadData];
            [SVProgressHUD showSuccessWithStatus:@"Friend Removed !"];
        }
    }
}

-(IBAction)addFriend:(id)sender{
    [SVProgressHUD showErrorWithStatus:@"Sorry Not Implemented !"];
}

@end
