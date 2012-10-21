//
//  AppDelegate.h
//  OOTD
//
//  Created by LARC User on 21/10/12.
//  Copyright (c) 2012 SMU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) LoginViewController *loginView;
@property (strong, nonatomic) UITabBarController *tabBarController;
@property (nonatomic) BOOL loginUser;

@end
