//
//  TCFactory.m
//  Pirate Game
//
//  Created by William on 8/26/14.
//  Copyright (c) 2014 Test Com. All rights reserved.
//

#import "TCFactory.h"

@implementation TCFactory

-(void) initialize{
    
    TCTile *tile1 = [[TCTile alloc] init];
    TCTile *tile2 = [[TCTile alloc] init];
    TCTile *tile3 = [[TCTile alloc] init];
    TCTile *tile4 = [[TCTile alloc] init];
    TCTile *tile5 = [[TCTile alloc] init];
    TCTile *tile6 = [[TCTile alloc] init];
    TCTile *tile7 = [[TCTile alloc] init];
    TCTile *tile8 = [[TCTile alloc] init];
    TCTile *tile9 = [[TCTile alloc] init];
    TCTile *tile10 = [[TCTile alloc] init];
    TCTile *tile11 = [[TCTile alloc] init];
    TCTile *tile12 = [[TCTile alloc] init];
    
    self.sabre = [[TCItem alloc] initWithStats:@"Sabre" damage:10 armor:0];
    self.emptyItem = [[TCItem alloc] initWithStats:@"None" damage:0 armor:0];
    
    tile1.bgStory = @"Your head hurts. When you finally open your eyes you start to remember bit by bit. You've been shipwrecked, and now are lying on the beach face down.";
    tile2.bgStory = @"You and your makeshift crew fight a naval battle. You do not fare so well.";
    tile2.damage = 20;
    tile3.bgStory = @"You find a blacksmith who repairs your equipment.";
    tile3.weapon = 5;
    tile4.bgStory = @"You come across your childhood archnemesis. You must now battle him to settle old grudges, and also because he's an idiot";
    tile5.bgStory = @"The people here aren't as a-holey as other places and tend to the wounds you so stupidly sustained.";
    tile5.damage = -30;
    tile6.bgStory = @"The octopus you were eating attacks you.";
    tile6.damage = 10;
    tile7.bgStory = @"The random parrot pecks at you. You take damage.";
    tile7.damage = 10;
    tile8.bgStory = @"There is a plank. Nothing happens.";
    tile9.bgStory = @"You fire cannonballs. Most of them miss.";
    tile10.bgStory = @"You find some treasure. Too bad they're not any useful for your survivial.";
    tile11.bgStory = @"You find some glittery trinkets. They would look good on your five year old niece.";
    tile12.bgStory = @"You find a sabre.";
    
    
    
    tile1.bgImage = [UIImage imageNamed:@"PirateStart.jpg"];
    tile2.bgImage = [UIImage imageNamed:@"PirateAttack.jpg"];
    tile3.bgImage = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
    tile4.bgImage = [UIImage imageNamed:@"PirateBoss.jpeg"];
    tile5.bgImage = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
    tile6.bgImage = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
    tile7.bgImage = [UIImage imageNamed:@"PirateParrot.jpg"];
    tile8.bgImage = [UIImage imageNamed:@"PiratePlank.jpg"];
    tile9.bgImage = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
    tile10.bgImage = [UIImage imageNamed:@"PirateTreasure.jpeg"];
    tile11.bgImage = [UIImage imageNamed:@"PirateTreasure2.jpeg"];
    tile12.bgImage = [UIImage imageNamed:@"PirateWeapons.jpeg"];
    
    self.allTiles = [[NSMutableArray alloc] initWithObjects: tile1, tile2, tile3, tile4, tile5, tile6, tile7,
                                tile8, tile9, tile10, tile11, tile12, nil];

    for(int i = 0; i<[self.allTiles count]; i++){
        [[self.allTiles objectAtIndex:i] setTileNumber:i];
        [[self.allTiles objectAtIndex:i] setActionable:NO];
        [[self.allTiles objectAtIndex:i] setActionText:@"Action"];
    }
    
    [[self.allTiles objectAtIndex:3] setActionable:YES];
    [[self.allTiles objectAtIndex:3] setActionText:@"Fight the boss"];
    [[self.allTiles objectAtIndex:11] setActionable:YES];
    [[self.allTiles objectAtIndex:11] setActionText:@"Take weapon"];
    
    self.player = [[TCCharacter alloc] init];
    [self.player giveItem:self.emptyItem];
    self.boss = [[TCEnemy alloc] init];
    
    [self setupGame];
}

-(void) setupGame{
    
    [self.boss setHealth:100];
    [self.boss setDamage:30];
    
    [self.player removeItem];
    
    [self.player setHealth:100];
    [self.player setDamage:10];
    
    [self randomizeArray:self.allTiles];
    
    for(int i = 0; i<[self.allTiles count]; i++){
        if([[self.allTiles objectAtIndex:i] tileNumber] ==3){
            [[self.allTiles objectAtIndex:i] setBgStory:@"You come across your childhood archnemesis. You must now battle him to settle old grudges, and also because he's an idiot"];
        }
        
        [[self.allTiles objectAtIndex:i] setActionPerformed:NO];
        if(i<4){
            [[self.allTiles objectAtIndex:i] setPX:i];
            [[self.allTiles objectAtIndex:i] setPY:0];
        }else if(3<i&&i<8){
            [[self.allTiles objectAtIndex:i] setPX:i-4];
            [[self.allTiles objectAtIndex:i] setPY:1];
        }else if(7<i&&i<12){
            [[self.allTiles objectAtIndex:i] setPX:i-8];
            [[self.allTiles objectAtIndex:i] setPY:2];
        }else{
            NSLog(@"Index not possible for i %i", i);
        }
        
    }
    
    //Assign player to correct tile
    for(int i= 0; i<[self.allTiles count]; i++){
        if([[self.allTiles objectAtIndex:i] tileNumber]== 0){
            self.player.pX = [[self.allTiles objectAtIndex:i] pX];
            self.player.pY = [[self.allTiles objectAtIndex:i] pY];
            self.player.playerTileNumber = [[self.allTiles objectAtIndex:i] tileNumber];
        }
    }
    [self update];
}

-(void) actionButtonPressed{
    [[self.allTiles objectAtIndex:self.playerAllTileIndex] setActionPerformed:YES];
    if(self.player.playerTileNumber==11){
        [self.player removeItem];
        [self.player giveItem:self.sabre];
    }
    if(self.player.playerTileNumber == 3){
        [[self.allTiles objectAtIndex:self.playerAllTileIndex] setActionPerformed:NO];
        [self bossFight];
    }
    [self update];
    
}

-(void) update{
    
    self.southOk= YES;
    self.northOk= YES;
    self.westOk = YES;
    self.eastOk = YES;
    
    if(self.player.pY==2){
        self.northOk= NO;
    }
    if(self.player.pY==0){
        self.southOk= NO;
    }
    if(self.player.pX==0){
        self.westOk = NO;
    }
    if(self.player.pX==3){
        self.eastOk = NO;
    }
    
    //NSLog(@"Player at %i, %i", self.player.pX, self.player.pY);
    TCTile *currentTile = [[TCTile alloc] init];
    
    for(int i= 0; i<[self.allTiles count]; i++){
        if([[self.allTiles objectAtIndex:i] pY]==self.player.pY &&
           [[self.allTiles objectAtIndex:i] pX] ==self.player.pX){
            
            self.playerAllTileIndex = i;
            
            self.player.playerTileNumber = [[self.allTiles objectAtIndex:i] tileNumber];
            //self.player.playerTileIndex = i; // Works
            currentTile = [self.allTiles objectAtIndex:i];
            
            if(![[self.allTiles objectAtIndex:i] actionPerformed]&&![[self.allTiles objectAtIndex:i] actionable]){
                self.player.health -= [[self.allTiles objectAtIndex:i] damage];
                self.player.damage += [[self.allTiles objectAtIndex:i] weapon];
                [[self.allTiles objectAtIndex:i] setActionPerformed:YES];
            }

        }
    }
    
    self.health = self.player.health;
    self.damage = self.player.damage;
    self.bgImage = [currentTile bgImage];
    self.bgStory = [currentTile bgStory];
    
    //NSLog(@"Player tile number %i",self.player.playerTileNumber);
}

-(void) bossFight{
    self.player.health -= (arc4random() % self.boss.damage);
    self.boss.health -=(arc4random() & self.player.damage);
    if(self.boss.health>80){
        [[self.allTiles objectAtIndex:self.playerAllTileIndex] setBgStory:@"He doesn't even have a scratch on him."];
    }else if(self.boss.health<81&&self.boss.health>60){
        [[self.allTiles objectAtIndex:self.playerAllTileIndex] setBgStory:@"He's showing fatigue."];
    }else if(self.boss.health<61&&self.boss.health>40){
        [[self.allTiles objectAtIndex:self.playerAllTileIndex] setBgStory:@"You're getting the hand of the upper"];
    }else if(self.boss.health<41&&self.boss.health>20){
        [[self.allTiles objectAtIndex:self.playerAllTileIndex] setBgStory:@"You are quite close to finally avenging the wedgie he gave you when you were six"];
    }else if(self.boss.health<21&&self.boss.health>0){
        [[self.allTiles objectAtIndex:self.playerAllTileIndex] setBgStory:@"Only the coup d' grace left."];
    }else{
        [[self.allTiles objectAtIndex:self.playerAllTileIndex] setBgStory:@"G4m3 ov4r, y0. Get ye to a nunnery."];
    }
}

-(void) moveNorth{
    self.player.pY++;
    [self update];
}
-(void) moveSouth{
    self.player.pY--;
    [self update];
}
-(void) moveEast{
    self.player.pX++;
    [self update];
}
-(void) moveWest{
    self.player.pX--;
    [self update];
}

-(void) randomizeArray:(NSMutableArray *)array{
    NSUInteger count = [array count];
    for (NSUInteger i = 0; i < count; ++i) {
        int nElements = count - i;
        int n = (arc4random() % nElements) + i;
        [array exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}
@end
