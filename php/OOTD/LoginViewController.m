//
//  ViewController.m
//  OOTD
//
//  Created by LARC User on 18/10/12.
//  Copyright (c) 2012 SMU. All rights reserved.
//
#define kOFFSET_FOR_KEYBOARD 70.0
#import "LoginViewController.h"
#import "SVProgressHUD.h"
#import "NewsFeedViewController.h"
#import "JackPotViewController.h"
#import "JournalViewController.h"
#import "FriendViewController.h"
#import "CameraViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dismissKeyboard {
    [userName resignFirstResponder];
    [passWord resignFirstResponder];
}

-(IBAction)login:(id)sender{
    if(!(userName.text.length==0 &&passWord.text.length==0)){
        if([userName.text isEqualToString:@"ootd"] && [passWord.text isEqualToString:@"abc"]){
            [SVProgressHUD showSuccessWithStatus:@"Login Success !"];
            
            UIViewController *viewController1 = [[NewsFeedViewController alloc] initWithNibName:@"NewsFeedViewController" bundle:nil];
            UIViewController *viewController4 = [[FriendViewController alloc] initWithNibName:@"FriendViewController" bundle:nil];
            UIViewController *viewController5 = [[JackPotViewController alloc] initWithNibName:@"JackPotViewController" bundle:nil];
            UIViewController *viewController2 = [[JournalViewController alloc] initWithNibName:@"JournalViewController" bundle:nil];
            UIViewController *viewController3 = [[CameraViewController alloc] initWithNibName:@"CameraViewController" bundle:nil];
            
            self.tabBarController = [[UITabBarController alloc] init];
            
            self.tabBarController.viewControllers = @[viewController1,viewController2,viewController3,viewController4,viewController5];

            [self presentModalViewController:self.tabBarController animated:YES];
            userName.text =@"";
            passWord.text=@"";
        }else{
            [SVProgressHUD showErrorWithStatus:@"Login failed !"];
        }
    }else{
        [SVProgressHUD showErrorWithStatus:@"Enter your credentials !"];

    }
}

-(void)keyboardWillShow {
    // Animate the current view out of the way
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

-(void)keyboardWillHide {
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

-(void)textFieldDidBeginEditing:(UITextField *)sender
{
    //if ([sender isEqual:mailTf])
    //{
        //move the main view, so that the keyboard does not hide it.
        if  (self.view.frame.origin.y >= 0)
        {
            [self setViewMovedUp:YES];
        }
    //}
}

//method to move the view up/down whenever the keyboard is shown/dismissed
-(void)setViewMovedUp:(BOOL)movedUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    
    CGRect rect = self.view.frame;
    CGRect rect2 = userName.frame;
    CGRect rect3 = passWord.frame;
    CGRect rect4 = login.frame;
    if (movedUp)
    {
        // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
        // 2. increase the size of the view so that the area behind the keyboard is covered up.
        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
        rect.size.height += kOFFSET_FOR_KEYBOARD;
        
        rect2.origin.y -= kOFFSET_FOR_KEYBOARD;
        rect2.size.height += kOFFSET_FOR_KEYBOARD;
        
        rect3.origin.y -= kOFFSET_FOR_KEYBOARD;
        rect3.size.height += kOFFSET_FOR_KEYBOARD;
        
        rect4.origin.y -= kOFFSET_FOR_KEYBOARD;
        rect4.size.height += kOFFSET_FOR_KEYBOARD;
    }
    else
    {
        // revert back to the normal state.
        rect.origin.y += kOFFSET_FOR_KEYBOARD;
        rect.size.height -= kOFFSET_FOR_KEYBOARD;
        rect2.origin.y += kOFFSET_FOR_KEYBOARD;
        rect2.size.height -= kOFFSET_FOR_KEYBOARD;
        rect3.origin.y += kOFFSET_FOR_KEYBOARD;
        rect3.size.height -= kOFFSET_FOR_KEYBOARD;
        rect4.origin.y += kOFFSET_FOR_KEYBOARD;
        rect4.size.height -= kOFFSET_FOR_KEYBOARD;

    }
    self.view.frame = rect;
    userName.frame = rect2;
    passWord.frame = rect3;
    login.frame = rect4;
    
    [UIView commitAnimations];
}


- (void)viewWillAppear:(BOOL)animated
{
    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    // unregister for keyboard notifications while not visible.
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}


@end
