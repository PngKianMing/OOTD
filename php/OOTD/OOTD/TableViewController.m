//
//  TableViewController.m
//  OOTD
//
//  Created by LARC User on 22/10/12.
//  Copyright (c) 2012 SMU. All rights reserved.
//

#import "TableViewController.h"
#include "BAMEasyTable.h"
#import "USPresident.h"

@implementation TableViewController
@synthesize authorLabel;
@synthesize profileImage;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
    
    NSArray *names = [[NSArray alloc] initWithObjects:@"George Washington", @"John Adams", @"Thomas Jefferson", @"James Madison", nil];
    
    NSArray *filenameSubstrings = [[NSArray alloc] initWithObjects:@"Washington", @"Adams1", @"Jefferson", @"Madison", nil];
    
    
    // First I create an array to hold my custom objects.
    presidents = [[NSMutableArray alloc] init];
    
    // Then I iterate through the arrays to create a series of USPresident objects and add them to the array.
    for (int i=0; i < [names count]; i++) {
        USPresident *president = [[USPresident alloc] init];
        president.order = i + 1;
        president.name = [names objectAtIndex:i];
        president.filenameSubstring = [filenameSubstrings objectAtIndex:i];
        [presidents addObject:president];
    }
    
    // Initialize the BAMEasyTable. (I'm using the plain style.)
 	BAMEasyTable *bamEasyTable = [[BAMEasyTable alloc] initWithStyle:UITableViewStylePlain];
    bamEasyTable.title = @"US Presidents";
    bamEasyTable.delegate = self;
    bamEasyTable.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Presidents" style:UIBarButtonItemStyleBordered target:nil action:nil];
    
    // Setting options
    bamEasyTable.showCountInFooter = YES; // YES is default
    bamEasyTable.allowSearching = YES;    // YES is default.
    bamEasyTable.allowRemoving = YES;      // NO is default.
    bamEasyTable.allowMoving = NO;       // NO is default.
    bamEasyTable.cellStyle = UITableViewCellStyleSubtitle;         // UITableViewCellStyleDefault is default.
    //bamEasyTable.editButtonType = BAMEasyTableEditButtonTypeRight; // BAMEasyTableEditButtonTypeNone is default.
    bamEasyTable.searchType = BAMEasyTableSearchTypeWordBeginning; // BAMEasyTableSearchTypeWordBeginning is default. Can also  beBAMEasyTableSearchTypeWordBeginning, BAMEasyTableSearchTypeEndingOnly, BAMEasyTableSearchTypeWordEnding, or BAMEasyTableSearchTypeSubstring.
    
    // Any standard UITableView options can be set like this:
    bamEasyTable.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // These are just to make the footer prettier by saying "X Presidents" rather than the default "X Items".
    bamEasyTable.countLabelTextSingular = @"President";
    bamEasyTable.countLabelTextPlural = @"Presidents";
    
    // But if you don't want a footer with the count in your table, simply uncomment the line below.
    //bamEasyTable.showCountInFooter = NO;
    
    // *** THIS IS THE MEAT OF THIS DEMO ***
    // You can pass in the name of a method that returns a string for these two:
    bamEasyTable.textStringMethodName = @"name";
    //bamEasyTable.detailStringMethodName = @"termString";
    
    // *** AND THIS ONE, TOO ***
    // Or a method which returns an image for this one:
    bamEasyTable.imageMethodName = @"icon";
    
    // Since I only have a single containing array, I use the loadTableFromArray: method instaead of the loadTableFromArrayOfArrays: method.
    // NOTE: It is important to load the table after setting all of your options. Once the table is loaded, you should not change the options.
    [bamEasyTable loadTableFromArray:(NSArray *)presidents];
    //[self.navigationController pushViewController:bamEasyTable animated:YES];
    [self presentModalViewController:bamEasyTable animated:YES];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
