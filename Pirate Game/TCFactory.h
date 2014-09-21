//
//  TCFactory.h
//  Pirate Game
//
//  Created by William on 8/26/14.
//  Copyright (c) 2014 Test Com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TCTile.h"
#import "TCCharacter.h"
#import "TCEnemy.h"
#import "TCItem.h"

@interface TCFactory : NSObject

@property (strong, nonatomic)NSMutableArray *allTiles;
@property (strong, nonatomic)NSString *bgStory;
@property (nonatomic) int health;
@property (nonatomic) int damage;
@property (nonatomic) UIImage *bgImage;
@property (nonatomic, strong) TCCharacter *player;
@property (nonatomic, strong) TCEnemy *boss;
@property (nonatomic, strong) TCItem *emptyItem;
@property (nonatomic, strong) TCItem *sabre;
@property (nonatomic) int playerAllTileIndex;

@property (nonatomic) BOOL northOk;
@property (nonatomic) BOOL southOk;
@property (nonatomic) BOOL westOk;
@property (nonatomic) BOOL eastOk;

-(void) initialize;
-(void) moveNorth;
-(void) moveSouth;
-(void) moveEast;
-(void) moveWest;
-(void) setupGame;
-(void) actionButtonPressed;
-(void) bossFight;

@end
