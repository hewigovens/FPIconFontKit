//
//  ViewController.m
//  DemoObjc
//
//  Created by hewig on 10/21/14.
//  Copyright (c) 2014 hewig. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    FPIconFont *font = [[FPIconFont alloc] initWithPath:[[NSBundle mainBundle] pathForResource:@"octicons" ofType:@"ttf"]];
    NSImage *image = [font getImage:@"heart" size:128 color:[NSColor purpleColor]];
    dispatch_async(dispatch_get_main_queue(), ^{
        self.imageView.image = image;
    });
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
