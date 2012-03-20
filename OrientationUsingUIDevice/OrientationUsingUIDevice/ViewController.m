//
//  ViewController.m
//  OrientationUsingUIDevice
//
//  Created by Mohit Jain on 3/6/12.
//  Copyright (c) 2012 Compuware. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize portraitView, landscapeView;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{   
    
    // Notification for any orientation change
    
   [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    
   [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didanyRotation:) name:@"UIDeviceOrientationDidChangeNotification"  object:nil];
    
    orientation = [[UIDevice currentDevice] orientation];
    
    if (orientation == UIDeviceOrientationUnknown || orientation == UIDeviceOrientationFaceUp || orientation == UIDeviceOrientationFaceDown) {
        
        orientation = UIDeviceOrientationPortrait;
    }

    
    [super viewDidLoad];
}


// Any Rotation View Logic here

- (void)didanyRotation:(NSNotification *)notification {
    
    [self resetView];
    
    UIDeviceOrientation newOrientation = [[UIDevice currentDevice] orientation];
    
  if((UIDeviceOrientationIsLandscape(newOrientation)) || (UIDeviceOrientationIsPortrait(newOrientation)))  {
      
      orientation = newOrientation;
        
    }
    
    
    // For Portrit Mode:
    
    if(orientation == UIDeviceOrientationPortrait || orientation == UIDeviceOrientationPortraitUpsideDown) {
        
        // [self resetView];
        
        [self.view insertSubview:portraitView atIndex:0];
    }
    
    // For Landscape Mode:
    
    if(orientation == UIDeviceOrientationLandscapeLeft || orientation == UIDeviceOrientationLandscapeRight) {
        
        //[self resetView];
        
        [self.view insertSubview:landscapeView atIndex:0];
    }

    
}

// Clearing current view

- (void) resetView {
    
    if(UIDeviceOrientationIsLandscape(orientation)) {
        
        [landscapeView removeFromSuperview];
        
    }
       
    else if(UIDeviceOrientationIsPortrait(orientation))  {
        
        [portraitView removeFromSuperview];
           
       }
    
    
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

@end
