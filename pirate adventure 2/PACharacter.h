//
//  PACharacter.h
//  pirate adventure 2
//
//  Created by Joseph Cheung on 31/7/14.
//  Copyright (c) 2014 Reque.st. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PAWeapon.h"
#import "PAArmor.h"

@interface PACharacter : NSObject

@property (strong, nonatomic) PAWeapon *weapon;
@property (strong, nonatomic) PAArmor *armor;
@property (nonatomic) int damage;
@property (nonatomic) int health;

@end
