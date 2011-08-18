//
//  GuessAppDelegate.h
//  Guess
//
//  Created by Sittipon Simasanti on 8/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GuessViewController;

@interface GuessAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet GuessViewController *viewController;

@end
