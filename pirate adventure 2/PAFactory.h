//
//  PAFactory.h
//  pirate adventure 2
//
//  Created by Joseph Cheung on 31/7/14.
//  Copyright (c) 2014 Reque.st. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PACharacter.h"
#import "PABoss.h"

@interface PAFactory : NSObject

- (NSMutableArray *)tiles;
- (PACharacter *)character;
- (PABoss *)boss;

@end
