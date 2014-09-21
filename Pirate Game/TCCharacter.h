//
//  TCCharacter.h
//  Pirate Game
//
//  Created by William on 8/25/14.
//  Copyright (c) 2014 Test Com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TCItem.h"

@interface TCCharacter : NSObject

@property (nonatomic)int health;
@property (nonatomic)int damage;
@property (nonatomic)int armor;
@property (nonatomic) int pY;
@property (nonatomic) int pX;
@property (nonatomic) int playerTileNumber;
@property (nonatomic,strong) TCItem *item;

-(void) giveItem:(TCItem*)item;
-(void) removeItem;

@end
