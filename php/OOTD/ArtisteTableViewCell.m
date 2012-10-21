//
//  CustomTableViewCell.m
//  IMHealthy
//
//  Created by Xebia on 24/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ArtisteTableViewCell.h"


@implementation ArtisteTableViewCell
@synthesize dayLabel=mDayLabel,commentImage=mCommentImage,commentLabel=mCommentLabel,monthLabel=mMonthLabel,timeLabel=mTimeLabel,edit=mEdit;

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
