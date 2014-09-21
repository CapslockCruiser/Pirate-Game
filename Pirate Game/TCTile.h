//
//  TCTile.h
//  Pirate Game
//
//  Created by William on 8/25/14.
//  Copyright (c) 2014 Test Com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TCTile : NSObject

@property (strong, nonatomic)UIImage *bgImage;
@property (strong, nonatomic)NSString *bgStory;
@property (nonatomic)CGPoint position;
@property (nonatomic, strong)NSString *actionText;
@property (nonatomic)int tileNumber;
@property (nonatomic) int pX;
@property (nonatomic) int pY;
@property (nonatomic) BOOL actionable;
@property (nonatomic) BOOL actionPerformed;
@property (nonatomic) int damage;
@property (nonatomic) int weapon;

-(void) printBGStory;

@end
