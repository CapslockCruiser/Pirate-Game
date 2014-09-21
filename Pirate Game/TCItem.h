//
//  TCItem.h
//  Pirate Game
//
//  Created by William on 9/14/14.
//  Copyright (c) 2014 Test Com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TCItem : NSObject

@property(nonatomic) int damage;
@property(nonatomic) int armor;
@property(nonatomic, strong) NSString *name;

-(id)initWithStats:(NSString*) name damage:(int)dmg armor:(int) armor;

@end
