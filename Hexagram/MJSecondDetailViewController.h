//
//  MJSecondDetailViewController.h
//  MJPopupViewControllerDemo
//
//  Created by Martin Juhasz on 24.06.12.
//  Copyright (c) 2012 martinjuhasz.de. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>
#import <AVFoundation/AVFoundation.h>
#include <AudioToolbox/AudioToolbox.h>
#import <MediaPlayer/MediaPlayer.h>
#import "MBProgressHUD.h"
#import "mainview.h"
@protocol MJSecondPopupDelegate;

@class MBProgressHUD;
MBProgressHUD *HUD;
@interface MJSecondDetailViewController : UIViewController<SKProductsRequestDelegate,SKPaymentTransactionObserver,AVAudioPlayerDelegate,MBProgressHUDDelegate>
{
    NSMutableArray *ListArr;
    AVAudioPlayer *audioPlayer, *drumPlayer;
    MPMoviePlayerViewController *player;
    NSString *ForPerchase;
    int soundNo;
    NSString *product_id;
    
    NSMutableArray *buttonarr;
    AVAudioPlayer *PlayMP3;
    mainview * mainView;
    
}
- (IBAction)AllBtn_Click:(id)sender;

- (void)assignAudioPlayer:(AVAudioPlayer*)avPlayer;
- (void)assignDrumPlayer:(AVAudioPlayer*)avPlayer;
- (void)assignMainView:(mainview*)mainViewToAssign;
- (void)purchaseFromMainScreen:(int)trackToPurchase;

@property (strong, nonatomic) IBOutlet UIButton *Peace_Btn;
@property (strong, nonatomic) IBOutlet UIButton *Allowing;
@property (strong, nonatomic) IBOutlet UIButton *DeepWater;
@property (strong, nonatomic) IBOutlet UIButton *Gentle_Btn;
@property (strong, nonatomic) IBOutlet UIButton *Joy;
@property (strong, nonatomic) IBOutlet UIButton *Passion;
@property (strong, nonatomic) IBOutlet UIButton *Power;
@property (strong, nonatomic) IBOutlet UIButton *Prosperity;

@property (strong, nonatomic) IBOutlet UIButton *TakingAction;
@property (strong, nonatomic) IBOutlet UIButton *KeepingStill;




@property (strong, nonatomic) IBOutlet UITableView *Purchase;

@property (assign, nonatomic) id <MJSecondPopupDelegate>delegate;

@end



@protocol MJSecondPopupDelegate<NSObject>
@optional
- (void)cancelButtonClicked:(MJSecondDetailViewController*)secondDetailViewController;
@end