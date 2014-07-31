//
//  PAFactory.m
//  pirate adventure 2
//
//  Created by Joseph Cheung on 31/7/14.
//  Copyright (c) 2014 Reque.st. All rights reserved.
//

#import "PAFactory.h"
#import "PATile.h"

@implementation PAFactory

- (NSMutableArray *) tiles
{
    PATile *tile1 = [[PATile alloc] init];
    tile1.story = @"Captain, we need a fearless leader such as yourself to undertake a voyage. You must stop the evil pirate Boss. Would you like a blunted sword to get started?";
    tile1.action = @"Take the sword";
    tile1.backgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
    PAWeapon *bluntedSword = [[PAWeapon alloc] init];
    bluntedSword.name = @"Blunted sword";
    bluntedSword.damage = 12;
    tile1.weapon = bluntedSword;
    
    PATile *tile2 = [[PATile alloc] init];
    tile2.story = @"You have come across an armory. Would you like to upgrade your armor to steel armor?";
    tile2.action = @"Take armor";
    tile2.backgroundImage = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
    PAArmor *steelArmor = [[PAArmor alloc] init];
    steelArmor.name = @"Steel armor";
    steelArmor.health = 8;
    tile2.armor = steelArmor;
    
    PATile *tile3 = [[PATile alloc] init];
    tile3.story = @"A mysterious dock appears on the horizon. Should we stop and ask for directions?";
    tile3.action = @"Stop at the dock";
    tile3.backgroundImage = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
    tile3.healthEffect = 12;
    
    PATile *tile4 = [[PATile alloc] init];
    tile4.story = @"You have found a parrot. This can be used in your armor slot. Parrots are greater defenders and are fiercely loyal to their captain!";
    tile4.action = @"Adopt parrot";
    tile4.backgroundImage = [UIImage imageNamed:@"PirateParrot.jpg"];
    PAArmor *parrot = [[PAArmor alloc] init];
    parrot.name = @"Parrot";
    parrot.health = 20;
    tile4.armor = parrot;
    
    PATile *tile5 = [[PATile alloc] init];
    tile5.story = @"You have stumbled upon a cache of pirate weapons. Would you like to upgrade to a pistol?";
    tile5.action = @"Use pistol";
    tile5.backgroundImage = [UIImage imageNamed:@"PirateWeapons.jpeg"];
    PAWeapon *pistol = [[PAWeapon alloc] init];
    pistol.name = @"Pistol";
    pistol.damage = 17;
    tile5.weapon = pistol;
    
    PATile *tile6 = [[PATile alloc] init];
    tile6.story = @"You have been captured by pirates and are ordered to walk the plank";
    tile6.action = @"Show no fear";
    tile6.backgroundImage = [UIImage imageNamed:@"PiratePlank.jpg"];
    tile6.healthEffect = -22;
    
    PATile *tile7 = [[PATile alloc] init];
    tile7.story = @"You have sighted a pirate battle off the coast. Should we intervene?";
    tile7.action = @"Fight those scum";
    tile7.backgroundImage = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
    tile7.healthEffect = 8;
    
    PATile *tile8 = [[PATile alloc] init];
    tile8.story = @"The legend of the deep. The mightly kraken appears";
    tile8.action = @"Abandon ship";
    tile8.backgroundImage = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
    tile8.healthEffect = -46;
    
    PATile *tile9 = [[PATile alloc] init];
    tile9.story = @"You have stumbled upon a hidden cave of pirate treasurer";
    tile9.action = @"Take treasure";
    tile9.backgroundImage = [UIImage imageNamed:@"PirateTreasure.jpeg"];
    tile9.healthEffect = 20;
    
    PATile *tile10 = [[PATile alloc] init];
    tile10.story = @"A group of pirates attempts to board your ship.";
    tile10.action = @"Repel the invaders";
    tile10.backgroundImage = [UIImage imageNamed:@"PirateAttack.jpg"];
    tile10.healthEffect = -15;
    
    PATile *tile11 = [[PATile alloc] init];
    tile11.story = @"In the deep of the sea many things live and many things can be found. Will the fortune bring help or ruin?";
    tile11.action = @"Swim deeper";
    tile11.backgroundImage = [UIImage imageNamed:@"PirateTreasurer2.jpeg"];
    tile11.healthEffect = -7;
    
    PATile *tile12 = [[PATile alloc] init];
    tile12.story = @"Your final faceoff with the fearsome pirate boss!";
    tile12.action = @"Fight";
    tile12.backgroundImage = [UIImage imageNamed:@"PirateBoss.jpeg"];
    NSMutableArray *column1Array = [[NSMutableArray alloc] init];
    NSMutableArray *column2Array = [[NSMutableArray alloc] init];
    NSMutableArray *column3Array = [[NSMutableArray alloc] init];
    NSMutableArray *column4Array = [[NSMutableArray alloc] init];
    NSMutableArray *tilesArray = [NSMutableArray arrayWithObjects:column1Array, column2Array, column3Array, column4Array, nil];
    
    [column1Array addObject:tile1];
    
    NSMutableArray *remainingTiles = [NSMutableArray arrayWithObjects:tile2, tile3, tile4, tile5, tile6, tile7, tile8, tile9, tile10, tile11, tile12, nil];
    
    for (int x = 0; x < [remainingTiles count]; x ++) {
        int randInt = (arc4random() % ([remainingTiles count] - x)) + x;
        [remainingTiles exchangeObjectAtIndex:x withObjectAtIndex:randInt];
    }

    for (NSMutableArray *array in tilesArray) {
        int count = 3 - [array count];
        for (int x = 0; x < count; x ++) {
            [array addObject:[remainingTiles objectAtIndex:0]];
            [remainingTiles removeObjectAtIndex:0];
        }
    }
    
    NSLog(@"%@", tilesArray);
    
    return tilesArray;
}

- (PACharacter *)character
{
    PACharacter *character = [[PACharacter alloc] init];
    character.health = 100;
    
    PAArmor *cloak = [[PAArmor alloc] init];
    cloak.health = 5;
    cloak.name = @"Cloak";
    character.armor = cloak;
    
    PAWeapon *fist = [[PAWeapon alloc] init];
    fist.damage = 10;
    fist.name = @"Fists";
    character.weapon = fist;
    
    return character;
}

- (PABoss *)boss
{
    PABoss *boss = [[PABoss alloc] init];
    boss.health = 65;
    boss.damage = 15;
    return boss;
}

@end
