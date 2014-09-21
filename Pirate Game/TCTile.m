//
//  TCTile.m
//  Pirate Game
//
//  Created by William on 8/25/14.
//  Copyright (c) 2014 Test Com. All rights reserved.
//

#import "TCTile.h"

@implementation TCTile

//int tileNumber;

-(void) printBGStory{
    NSLog(@"%@", self.bgStory);
}

-(void) setIndex:(int)index{
    self.tileNumber = index;
    self.position = CGPointMake(0,0);
}

-(int) returnIndex{
    return self.tileNumber;
}

@end
