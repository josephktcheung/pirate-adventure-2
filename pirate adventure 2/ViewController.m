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
    [self updateButtons];
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
    self.northButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y + 1)];
    self.southButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y - 1)];
    self.eastButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x + 1, self.currentPoint.y)];
    self.westButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x - 1, self.currentPoint.y)];
}

- (BOOL)tileExistsAtPoint:(CGPoint)point
{
    if (point.x >= 0 && point.y >= 0 && point.x <= [self.tiles count] && [[self.tiles objectAtIndex:point.x] count]) {
        return NO;
    }
    else {
        return YES;
    }
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
