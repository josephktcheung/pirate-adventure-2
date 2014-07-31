//
//  PATile.h
//  pirate adventure 2
//
//  Created by Joseph Cheung on 31/7/14.
//  Copyright (c) 2014 Reque.st. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PAWeapon.h"
#import "PAArmor.h"
#import "PABoss.h"

@interface PATile : NSObject

@property (strong, nonatomic) NSString *story;
@property (strong, nonatomic) NSString *action;
@property (strong, nonatomic) UIImage *backgroundImage;
@property (strong, nonatomic) PAWeapon *weapon;
@property (strong, nonatomic) PAArmor *armor;
@property (strong, nonatomic) PABoss *boss;
@property (strong, nonatomic) UIAlertView *alertViewBeforeAction;
@property (strong, nonatomic) UIAlertView *alertViewAfterAction;
@property (nonatomic) int healthEffect;
@property (nonatomic) BOOL isActivated;

@end
