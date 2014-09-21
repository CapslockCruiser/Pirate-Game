//
//  TCViewController.h
//  Pirate Game
//
//  Created by William on 8/25/14.
//  Copyright (c) 2014 Test Com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "TCFactory.h"

@interface TCViewController : UIViewController

@property (strong, nonatomic) TCFactory *factory;

@property (strong, nonatomic) IBOutlet UIImageView *bgImageView;

@property (strong, nonatomic) IBOutlet UILabel *hlthAmtLabel;
@property (strong, nonatomic) IBOutlet UILabel *dmgAmtLabel;
@property (strong, nonatomic) IBOutlet UILabel *wpnNameLabel;
@property (strong, nonatomic) IBOutlet UITextView *storyTextView;

@property (strong, nonatomic) IBOutlet UIButton *northButton;
@property (strong, nonatomic) IBOutlet UIButton *westButton;
@property (strong, nonatomic) IBOutlet UIButton *southButton;
@property (strong, nonatomic) IBOutlet UIButton *eastButton;
@property (strong, nonatomic) IBOutlet UIButton *actionButton;

- (IBAction)actionButton:(id)sender;
- (IBAction)resetGameButton:(id)sender;
- (IBAction)northButton:(id)sender;
- (IBAction)westButton:(id)sender;
- (IBAction)eastButton:(id)sender;
- (IBAction)southButton:(id)sender;

@end
