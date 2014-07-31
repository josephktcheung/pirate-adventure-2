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

- (NSArray *) tiles
{
    PATile *tile1 = [[PATile alloc] init];
    tile1.story = @"Captain, we need a fearless leader such as yourself to undertake a voyage. You must stop the evil pirate Boss. Would you like a blunted sword to get started?";
    tile1.action = @"Take the sword";
    tile1.backgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
    
    PATile *tile2 = [[PATile alloc] init];
    tile2.story = @"You have come across an armory. Would you like to upgrade your armor to steel armor?";
    tile2.action = @"Take armor";
    tile2.backgroundImage = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
    
    PATile *tile3 = [[PATile alloc] init];
    tile3.story = @"A mysterious dock appears on the horizon. Should we stop and ask for directions?";
    tile3.action = @"Stop at the dock";
    tile3.backgroundImage = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
    
    NSArray *column1Array = [[NSArray alloc] initWithObjects:tile1, tile2, tile3, nil];
    
    PATile *tile4 = [[PATile alloc] init];
    tile4.story = @"You have found a parrot. This can be used in your armor slot. Parrots are greater defenders and are fiercely loyal to their captain!";
    tile4.action = @"Adopt parrot";
    tile4.backgroundImage = [UIImage imageNamed:@"PirateParrot.jpg"];
    
    PATile *tile5 = [[PATile alloc] init];
    tile5.story = @"You have stumbled upon a cache of pirate weapons. Would you like to upgrade to a pistol?";
    tile5.action = @"Use pistol";
    tile5.backgroundImage = [UIImage imageNamed:@"PirateWeapons.jpeg"];
    
    PATile *tile6 = [[PATile alloc] init];
    tile6.story = @"You have been captured by pirates and are ordered to walk the plank";
    tile6.action = @"Show no fear";
    tile6.backgroundImage = [UIImage imageNamed:@"PiratePlank.jpg"];
    
    NSArray *column2Array = [[NSArray alloc] initWithObjects:tile4, tile5, tile6, nil];
    
    PATile *tile7 = [[PATile alloc] init];
    tile7.story = @"You have sighted a pirate battle off the coast. Should we intervene?";
    tile7.action = @"Fight those scum";
    tile7.backgroundImage = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
    
    PATile *tile8 = [[PATile alloc] init];
    tile8.story = @"The legend of the deep. The mightly kraken appears";
    tile8.action = @"Abandon ship";
    tile8.backgroundImage = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
    
    PATile *tile9 = [[PATile alloc] init];
    tile9.story = @"You have stumbled upon a hidden cave of pirate treasurer";
    tile9.action = @"Take treasure";
    tile9.backgroundImage = [UIImage imageNamed:@"PirateTreasure.jpeg"];
    
    NSArray *column3Array = [[NSArray alloc] initWithObjects:tile7, tile8, tile9, nil];
    
    PATile *tile10 = [[PATile alloc] init];
    tile10.story = @"A group of pirates attempts to board your ship.";
    tile10.action = @"Repel the invaders";
    tile10.backgroundImage = [UIImage imageNamed:@"PirateAttack.jpg"];
    
    PATile *tile11 = [[PATile alloc] init];
    tile11.story = @"In the deep of the sea many things live and many things can be found. Will the fortune bring help or ruin?";
    tile11.action = @"Swim deeper";
    tile11.backgroundImage = [UIImage imageNamed:@"PirateTreasurer2.jpeg"];
    
    PATile *tile12 = [[PATile alloc] init];
    tile12.story = @"Your final faceoff with the fearsome pirate boss!";
    tile12.action = @"Fight";
    tile12.backgroundImage = [UIImage imageNamed:@"PirateBoss.jpeg"];
    
    NSArray *column4Array = [[NSArray alloc] initWithObjects:tile10, tile11, tile12, nil];
    
    NSArray *tilesArray = [[NSArray alloc] initWithObjects:column1Array, column2Array, column3Array, column4Array, nil];

    return tilesArray;
}

@end
