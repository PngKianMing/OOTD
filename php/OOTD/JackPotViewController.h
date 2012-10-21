//
//  JackPotViewController.h
//  OOTD
//
//  Created by LARC User on 20/10/12.
//  Copyright (c) 2012 SMU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JackPotViewController : UIViewController{

    IBOutlet UIImageView* top;
    IBOutlet UIImageView* bottom;
    IBOutlet UIButton* roll;
    int topRand;
    int botRand;
    IBOutlet UILabel *status;
}
@property (strong, nonatomic) NSMutableArray *tops;
@property (strong, nonatomic) NSMutableArray *bots;
@end
