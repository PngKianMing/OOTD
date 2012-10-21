//
//  CustomTableViewCell.m
//  IMHealthy
//
//  Created by Xebia on 24/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell
@synthesize likeButton=mLikeButton,commentButton=mCommentButton,timeStampLabel=mTimeStampLabel,commentImage=mCommentImage,commentLabel=mCommentLabel,authorLabel=mAuthorLabel,authorImage=mAuthorImage,likeLabel=mLikeLabel,commentLabel2=mCommentLabel2;

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
