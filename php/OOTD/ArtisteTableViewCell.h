//
//  CustomTableViewCell.h
//  IMHealthy
//
//  Created by Xebia on 24/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArtisteTableViewCell : UITableViewCell {
    
    IBOutlet UILabel  *mDayLabel;
    IBOutlet UILabel  *mMonthLabel;
    IBOutlet UILabel  *mTimeLabel;
    IBOutlet UILabel  *mCommentLabel;
    IBOutlet UIImageView*  mCommentImage;
    IBOutlet UIButton*  mEdit;
}

@property (strong)UILabel *dayLabel;
@property (strong)UILabel  *monthLabel;
@property (strong)UILabel  *timeLabel;
@property (strong)UILabel *commentLabel;
@property (strong)UIImageView* commentImage;
@property (strong)UIButton* edit;


@end
