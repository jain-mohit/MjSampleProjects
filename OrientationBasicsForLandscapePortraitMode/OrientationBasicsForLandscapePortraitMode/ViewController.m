//
//  ViewController.m
//  OrientationBasicsForLandscapePortraitMode
//
//  Created by Mohit Jain on 3/6/12.
//  Copyright (c) 2012 Compuware. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize portraitView, portraitUpsideDownView, landScapeLeftView, landScapeRightView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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


- (void)resetCurrentView {
    
    if(landScapeRightView.superview)
    {
        [landScapeRightView removeFromSuperview];
    }
    
    else if(landScapeLeftView.superview) {
        [landScapeLeftView removeFromSuperview];
    }
    
    else if(portraitView.superview) {
        [portraitView removeFromSuperview];
    }
    
    else if(portraitUpsideDownView.superview) {
        [portraitUpsideDownView removeFromSuperview];
    }
    
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    [self resetCurrentView];
    
  /*  if(UIInterfaceOrientationIsLandscape(interfaceOrientation)) {
        
        [self.view insertSubview:landScapeView atIndex:0];
        
    }
       else if (UIInterfaceOrientationIsPortrait(interfaceOrientation)){
           
            [self.view insertSubview:portraitView atIndex:0];
           
       }
    */
    
    if(interfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
        
        [self.view insertSubview:landScapeLeftView atIndex:0];
        
    }
    
    else if(interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        
        [self.view insertSubview:landScapeRightView atIndex:0];
        
    }
    
    if(interfaceOrientation == UIInterfaceOrientationPortrait) {
        
        [self.view insertSubview:portraitView atIndex:0];
        
    }
    
    if(interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        
        [self.view insertSubview:portraitUpsideDownView atIndex:0];
        
    }
    
    
    return YES;
}

@end
