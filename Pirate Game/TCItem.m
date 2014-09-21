//
//  TCItem.m
//  Pirate Game
//
//  Created by William on 9/14/14.
//  Copyright (c) 2014 Test Com. All rights reserved.
//

#import "TCItem.h"

@implementation TCItem

-(id)initWithStats:(NSString*) name damage:(int)dmg armor:(int)armor{
    self = [super init];
    self.name = name;
    self.damage = dmg;
    self.armor = armor;
    return self;
}

@end
