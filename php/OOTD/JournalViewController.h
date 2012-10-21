//
//  ProfileViewController.h
//  Tweeky
//
//  Created by LARC User on 31/7/12.
//
//

#import <UIKit/UIKit.h>


@class ArtisteTableViewCell;
@interface JournalViewController : UIViewController<UITableViewDataSource,UITableViewDelegate> {
   
    UIImage* imageForCell;
    UITableView *myTableView;
 
    IBOutlet UIButton* add;
    IBOutlet ArtisteTableViewCell *customCell;
    IBOutlet UILabel* status;
    int index;
}

@property (nonatomic, strong)IBOutlet UITableView *myTableView;
@property (strong, nonatomic) NSMutableArray *dayLabel;
@property (strong, nonatomic) NSMutableArray *monthLabel;
@property (strong, nonatomic) NSMutableArray *timeStampLabel;
@property (strong, nonatomic) NSMutableArray *commentLabel;
@property (strong, nonatomic) NSMutableArray *commentImage;
@property (strong, nonatomic) UIImage *photoHolder;
@property (strong, nonatomic) UIImageView *takePic;
@property (strong, nonatomic) UITextView *comments;

@end
