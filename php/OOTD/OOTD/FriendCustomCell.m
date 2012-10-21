//
//  FriendCustomCell.m
//  OOTD
//
//  Created by LARC User on 21/10/12.
//  Copyright (c) 2012 SMU. All rights reserved.
//

#import "FriendCustomCell.h"

@implementation FriendCustomCell

@synthesize authorLabel=mAuthorLabel,authorImage=mAuthorImage,unfriendButton = munfriendButton;

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}


#pragma mark - View lifecycle


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

@end
