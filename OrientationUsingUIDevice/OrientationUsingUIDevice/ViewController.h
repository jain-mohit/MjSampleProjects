//
//  ViewController.h
//  OrientationUsingUIDevice
//
//  Created by Mohit Jain on 3/6/12.
//  Copyright (c) 2012 Compuware. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    
    UIDeviceOrientation orientation;
}

@property(nonatomic, strong) IBOutlet UIView *portraitView; 
@property(nonatomic, strong) IBOutlet UIView *landscapeView;

- (void) resetView;

@end
