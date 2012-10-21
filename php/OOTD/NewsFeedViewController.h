//
//  ManageFriendsViewController.h
//  Twee-Ta-Doo
//
//  Created by LARC User on 27/7/12.
//
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@class CustomTableViewCell;
@interface NewsFeedViewController :UIViewController<UITableViewDataSource,UITableViewDelegate>{
    IBOutlet CustomTableViewCell *customCell;
    UITableView *myTableView;
    UIButton *createGrp;
    IBOutlet UIButton* logout;
    IBOutlet UIButton* add;
    int count;
    int index;
}

@property (nonatomic, strong)IBOutlet UITableView *myTableView;
@property (strong, nonatomic) NSMutableArray *authorLabel;
@property (strong, nonatomic) NSMutableArray *timeStampLabel;
@property (strong, nonatomic) NSMutableArray *commentLabel;
@property (strong, nonatomic) NSMutableArray *commentImage;
@property (strong, nonatomic) NSMutableArray *profileImage;
@property (strong, nonatomic) NSMutableArray *selfComments;
@property (strong, nonatomic) NSMutableArray *likeCount;
@property (strong, nonatomic) UIImageView *takePic;
@property (strong, nonatomic) UITextView*comments;
@property (strong, nonatomic) UILabel*comments2;
@property (strong, nonatomic) UIImage *photoHolder;
@property (strong, nonatomic) UITextView*comments3;
@end
