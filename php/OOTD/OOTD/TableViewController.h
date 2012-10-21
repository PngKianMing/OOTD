//
//  TableViewController.h
//  OOTD
//
//  Created by LARC User on 22/10/12.
//  Copyright (c) 2012 SMU. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "BAMEasyTable.h"
@interface TableViewController : UIViewController<BAMEasyTableDelegate>{
    NSMutableArray *presidents;
}
@property (strong, nonatomic) NSMutableArray *authorLabel;
@property (strong, nonatomic) NSMutableArray *profileImage;

@end
