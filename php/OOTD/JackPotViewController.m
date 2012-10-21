//
//  JackPotViewController.m
//  OOTD
//
//  Created by LARC User on 20/10/12.
//  Copyright (c) 2012 SMU. All rights reserved.
//

#import "JackPotViewController.h"

@interface JackPotViewController ()

@end

@implementation JackPotViewController
@synthesize tops,bots;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:@"JackPotViewController" bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Mix & Match", @"Jackpot");
        self.tabBarItem.image = [UIImage imageNamed:@"tab_live.png"];
        
        tops = [[NSMutableArray alloc]initWithCapacity:0];
        bots = [[NSMutableArray alloc]initWithCapacity:0];
        UIImage* top1 = [UIImage imageNamed:@"top1.jpg"];
        UIImage* top2 = [UIImage imageNamed:@"top2.jpg"];
        UIImage* top3 = [UIImage imageNamed:@"top3.jpg"];
        [tops addObject:top1];
        [tops addObject:top2];
        [tops addObject:top3];
        
        UIImage* bot1 = [UIImage imageNamed:@"bottom1.jpg"];
        UIImage* bot2 = [UIImage imageNamed:@"bottom2.jpg"];
        UIImage* bot3 = [UIImage imageNamed:@"bottom3.jpg"];
        
        [bots addObject:bot1];
        [bots addObject:bot2];
        [bots addObject:bot3];

               
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)hitJackPot:(id)sender{
    topRand = (arc4random()%3); //Generates Number from 1 to 100.
    NSLog(@"topRand Value: %d",topRand);
    botRand = (arc4random()%3); //Generates Number from 1 to 100.
    NSLog(@"botRand Value: %d",botRand);
    
    if(topRand==2&&botRand==1){
     
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Outfit Alert!"
                                                          message:@"This combination was worn on 19th Nov 2012!!"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        [message show];
    }else{
    
    }
    top.image = [tops objectAtIndex:topRand];
    bottom.image = [bots objectAtIndex:botRand];
}

@end
