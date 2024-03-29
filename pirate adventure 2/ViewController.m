//
//  ViewController.m
//  pirate adventure 2
//
//  Created by Joseph Cheung on 30/7/14.
//  Copyright (c) 2014 Reque.st. All rights reserved.
//

#import "ViewController.h"
#import "PAFactory.h"
#import "PATile.h"

@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self resetGame];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateTile
{
    PATile *tile = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    self.storyLabel.text = tile.story;
    [self.actionButton setTitle:tile.action forState:UIControlStateNormal];
    self.imageView.image = tile.backgroundImage;
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.damageLabel.text = [NSString stringWithFormat:@"%i", self.character.damage];
    self.weaponLabel.text = self.character.weapon.name;
    self.armorLabel.text = self.character.armor.name;
    if ([tile.action isEqualToString:@"Show no fear"] || [tile.action isEqualToString:@"Abandon ship"] || [tile.action isEqualToString: @"Repel the invaders"] || [tile.action isEqualToString:@"Fight"]) {
        [self enableNavigation:NO];
    }
    if (tile.isActivated) {
        if (tile.healthEffect > 0 || [tile.action isEqualToString:@"Show no fear"] || [tile.action isEqualToString:@"Abandon ship"] || [tile.action isEqualToString: @"Repel the invaders"]) {
            self.actionButton.enabled = NO;
        }
    } else {
        self.actionButton.enabled = YES;
    }
}

- (void)updateButtons
{
    self.northButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y + 1)];
    self.southButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y - 1)];
    self.eastButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x + 1, self.currentPoint.y)];
    self.westButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x - 1, self.currentPoint.y)];
}

- (void)enableNavigation:(BOOL)state
{
    self.northButton.enabled = state;
    self.southButton.enabled = state;
    self.eastButton.enabled = state;
    self.westButton.enabled = state;
}

- (void)resetGame
{
    PAFactory *factory = [[PAFactory alloc] init];
    self.tiles = [factory tiles];
    self.character = [factory character];
    self.boss = [factory boss];
    self.currentPoint = CGPointMake(0, 0);
    [self updateTile];
    [self updateButtons];
    [self enableNavigation:YES];
}

- (BOOL)tileExistsAtPoint:(CGPoint)point
{
    if (point.x >= 0 && point.y >= 0 && point.x < [self.tiles count] && point.y < [[self.tiles objectAtIndex:point.x] count]) {
        return NO;
    }
    else {
        return YES;
    }
}

- (IBAction)actionButtonPressed:(UIButton *)sender
{
    PATile *tile = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    if (tile.armor != nil) {
        self.character.health = self.character.health - self.character.armor.health + tile.armor.health;
        self.character.armor = tile.armor;
    }
    else if (tile.weapon != nil) {
        self.character.damage = self.character.damage - self.character.weapon.damage + tile.weapon.damage;
        self.character.weapon = tile.weapon;
    }
    else if (tile.healthEffect != 0) {
        self.character.health = self.character.health + tile.healthEffect;
    }
    else {
        self.character.health = self.character.health - self.boss.damage;
        self.boss.health = self.boss.health - self.character.damage;
        if (self.boss.health <= 0) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Victory Message" message:@"You have defeated the evil pirate boss!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
            [self resetGame];
        }
    }
    if (tile.alertViewAfterAction != nil) {
        [tile.alertViewAfterAction show];
    }
    tile.isActivated = YES;
    [self updateTile];
    [self enableNavigation:YES];
    [self checkGameOver];
}

- (void)checkGameOver
{
    if (self.character.health <= 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Death" message:@"You have died restart the game!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
        [self resetGame];
    }
}

- (void)resetActivated
{
    PATile *tile = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    tile.isActivated = NO;
}

- (IBAction)northButtonPressed:(UIButton *)sender
{
    [self resetActivated];
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y + 1);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)southButtonPressed:(UIButton *)sender
{
    [self resetActivated];
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y - 1);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)eastButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x + 1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)westButtonPressed:(UIButton *)sender
{
    [self resetActivated];
    self.currentPoint = CGPointMake(self.currentPoint.x - 1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)resetButtonPressed:(UIButton *)sender
{
    [self resetGame];
}

@end
