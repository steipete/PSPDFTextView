//
//  PSTAppDelegate.m
//  PSPDFTextViewExample
//
//  Created by Peter Steinberger on 08/01/14.
//  Copyright (c) 2014 PSPDFKit GmbH. All rights reserved.
//

#import "PSTAppDelegate.h"
#import "PSTSampleViewController.h"

@implementation PSTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[PSTSampleViewController alloc] initWithNibName:nil bundle:nil]];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
