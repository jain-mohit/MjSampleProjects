//
//  ViewController.h
//  OrientationBasicsForLandscapePortraitMode
//
//  Created by Mohit Jain on 3/6/12.
//  Copyright (c) 2012 Compuware. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController 

@property(nonatomic, strong)IBOutlet UIView *portraitView;
@property(nonatomic, strong)IBOutlet UIView *landScapeLeftView;
@property(nonatomic, strong)IBOutlet UIView *portraitUpsideDownView;
@property(nonatomic, strong)IBOutlet UIView *landScapeRightView;


-(void)resetCurrentView;

@end
