//
//  TCCharacter.m
//  Pirate Game
//
//  Created by William on 8/25/14.
//  Copyright (c) 2014 Test Com. All rights reserved.
//

#import "TCCharacter.h"

@implementation TCCharacter

-(void) giveItem:(TCItem *)item{
    self.damage+=item.damage;
    self.armor+=item.armor;
    self.item = item;
}

-(void) removeItem{
    self.armor-= self.item.armor;
    self.damage-=self.item.damage;
    self.item = nil;
}

@end
