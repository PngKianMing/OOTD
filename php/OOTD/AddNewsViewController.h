//
//  DBSignupViewController.h
//  DBSignup
//
//  Created by Davide Bettio on 7/4/11.
//  Copyright 2011 03081340121. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddNewsViewController : UIViewController <UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
    
    UIButton *photoButton_;
    UIImage *photo_;
    UIButton* post;
    IBOutlet UIButton* reset;
    IBOutlet UIButton* closeModal;
}

@property(nonatomic, retain) IBOutlet UIButton *photoButton;
@property(nonatomic, retain) UIImage *photo;
@property(nonatomic, retain) IBOutlet UITextView *comments;

- (IBAction)choosePhoto:(id)sender;
- (IBAction)post:(id)sender;
- (IBAction)reset:(id)sender;

@end
