//
//  CustomTableViewCell.h
//  IMHealthy
//
//  Created by Xebia on 24/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell {
    
    IBOutlet UIButton *mLikeButton;
    IBOutlet UIButton *mCommentButton;
    IBOutlet UILabel  *mTimeStampLabel;
    IBOutlet UILabel  *mCommentLabel;
    IBOutlet UILabel  *mCommentLabel2;
    IBOutlet UILabel  *mAuthorLabel;
    IBOutlet UILabel  *mLikeLabel;
    IBOutlet UIImageView*  mAuthorImage;
    IBOutlet UIImageView*  mCommentImage;
}

@property (strong)UIButton *likeButton;
@property (strong)UIButton *commentButton;
@property (strong)UILabel *timeStampLabel;
@property (strong)UILabel *commentLabel;
@property (strong)UILabel *commentLabel2;
@property (strong)UILabel *authorLabel;
@property (strong)UILabel *likeLabel;
@property (strong)UIImageView* authorImage;
@property (strong)UIImageView* commentImage;


@end
