//
//  ViewController.h
//  OOTD
//
//  Created by LARC User on 18/10/12.
//  Copyright (c) 2012 SMU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController{
    IBOutlet UITextField* userName;
    IBOutlet UITextField* passWord;
    IBOutlet UIButton *login;
    
}
@property (strong, nonatomic) UITabBarController *tabBarController;
-(IBAction)login:(id)sender;
@end
