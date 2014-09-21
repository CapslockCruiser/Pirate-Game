//
//  TCViewController.m
//  Pirate Game
//
//  Created by William on 8/25/14.
//  Copyright (c) 2014 Test Com. All rights reserved.
//

#import "TCViewController.h"

@interface TCViewController ()

@end

@implementation TCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.factory = [[TCFactory alloc] init];
    [self.factory initialize];
    [self updateView];
}

-(void) updateView{
    self.hlthAmtLabel.text = [NSString stringWithFormat:@"%i",[self.factory health]];
    self.dmgAmtLabel.text = [NSString stringWithFormat:@"%i", [self.factory damage]];
    self.bgImageView.image = [self.factory bgImage];
    self.storyTextView.text = [self.factory bgStory];
    self.wpnNameLabel.text = [self.factory.player.item name];
    
    //NSLog([[self.factory.allTiles objectAtIndex:self.factory.player.playerTileIndex] actionable] ? @"Actionable":@"Not actionable");
    //NSLog(@"%i",[self.factory.player playerTileIndex]);
    
    self.actionButton.enabled= YES;
    [self.actionButton setTitle:([[self.factory.allTiles objectAtIndex:self.factory.playerAllTileIndex] actionText]) forState:UIControlStateNormal];
    
    if([[self.factory.allTiles objectAtIndex:self.factory.playerAllTileIndex] actionable]==NO){
        self.actionButton.enabled = NO;
    }else{
        self.actionButton.enabled = YES;
        if([[self.factory.allTiles objectAtIndex:self.factory.playerAllTileIndex] actionPerformed]==YES){
            self.actionButton.enabled=NO;
        }
    }
    
    self.northButton.enabled=self.factory.northOk;
    self.southButton.enabled=self.factory.southOk;
    self.westButton.enabled=self.factory.westOk;
    self.eastButton.enabled=self.factory.eastOk;
    
    if(self.factory.player.health<1){
        
        [self disableNavigation];
        self.actionButton.enabled=NO;
        
        UIAlertView *gameOverAlertView= [[UIAlertView alloc] initWithTitle:@"Game over!" message:@"Game over. Try again." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [gameOverAlertView show];
    }
    if(self.factory.boss.health<1&&self.factory.player.health>0){
        
        [self disableNavigation];
        self.actionButton.enabled=NO;
        
        UIAlertView *gameWonAlertView = [[UIAlertView alloc] initWithTitle:@"Vikteri!" message:@"You is winrar!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        
        [gameWonAlertView show];
    }
    NSLog(@"%i", self.factory.boss.health);
    
}

-(void) disableNavigation{
    self.northButton.enabled=NO;
    self.southButton.enabled=NO;
    self.westButton.enabled=NO;
    self.eastButton.enabled=NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionButton:(id)sender {
    [self.factory actionButtonPressed];
    [self updateView];
}

- (IBAction)resetGameButton:(id)sender {
    //NSLog(@"Reset button pressed");
    [self.factory setupGame];
    [self updateView];
}

- (IBAction)northButton:(id)sender {
    [self.factory moveNorth];
    [self updateView];
}

- (IBAction)westButton:(id)sender {
    [self.factory moveWest];
    [self updateView];
}

- (IBAction)eastButton:(id)sender {
    [self.factory moveEast];
    [self updateView];
}

- (IBAction)southButton:(id)sender {
    [self.factory moveSouth];
    [self updateView];
}
@end
