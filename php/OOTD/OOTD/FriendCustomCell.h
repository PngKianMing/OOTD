//
//  FriendCustomCell.h
//  OOTD
//
//  Created by LARC User on 21/10/12.
//  Copyright (c) 2012 SMU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendCustomCell : UITableViewCell{
    IBOutlet UILabel  *mAuthorLabel;
    IBOutlet UIImageView*  mAuthorImage;
    IBOutlet UIButton *munfriendButton;
}

@property (strong)UILabel *authorLabel;
@property (strong)UIButton *unfriendButton;
@property (strong)UIImageView* authorImage;
@end
