//
//  AppDelegate.h
//  Hexagram
//
//  Created by Creative Rohit on 3/27/14.
//  Copyright (c) 2014 Creative Rohit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

int show;
int timestop;

@interface AppDelegate : UIResponder <UIApplicationDelegate,AVAudioPlayerDelegate>
{
    UINavigationController *nav;
}
@property (strong, nonatomic) UIWindow *window;

@end
