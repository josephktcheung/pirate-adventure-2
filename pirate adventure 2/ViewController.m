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
    PAFactory *factory = [[PAFactory alloc] init];
    self.tiles = [factory tiles];
    self.currentPoint = CGPointMake(0, 0);
    [self updateTile];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateTile
{
    PATile *tile = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    self.storyLabel.text = tile.story;
    NSLog(@"%@", tile.story);
    [self.actionButton setTitle:tile.action forState:UIControlStateNormal];
    self.imageView.image = tile.backgroundImage;
}

- (void)updateButtons
{
    
}

- (IBAction)actionButtonPressed:(UIButton *)sender
{
}

- (IBAction)northButtonPressed:(UIButton *)sender
{
}

- (IBAction)southButtonPressed:(UIButton *)sender
{
}

- (IBAction)eastButtonPressed:(UIButton *)sender
{
}

- (IBAction)westButtonPressed:(UIButton *)sender
{
}

- (IBAction)resetButtonPressed:(UIButton *)sender
{
}

@end
