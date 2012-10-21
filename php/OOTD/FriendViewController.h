//
//  FriendViewController.h
//  OOTD
//
//  Created by LARC User on 21/10/12.
//  Copyright (c) 2012 SMU. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FriendCustomCell;
@interface FriendViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    IBOutlet FriendCustomCell *customCell;
    IBOutlet UIButton *addFriend;
    int tag;
}
@property (nonatomic, strong)IBOutlet UITableView *myTableView;
@property (strong, nonatomic) NSMutableArray *authorLabel;
@property (strong, nonatomic) NSMutableArray *profileImage;
@property (strong, nonatomic) UILabel*comments2;


@end
