//
//  mainview.h
//  Hexagram
//
//  Created by Creative Rohit on 3/27/14.
//  Copyright (c) 2014 Creative Rohit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

 int CountTimer;
@interface mainview : UIViewController<AVAudioPlayerDelegate,UIGestureRecognizerDelegate>
{
    NSMutableArray *buttonarr;
    NSString *MP3Sound,*Hexaname,*HexaString;
    
    int soundgapint;
    
    UIImageView *bagua;
    float random;
    float orign;
    NSMutableArray *arr,*arr2,*arr3,*arr4,*arr5,*arr6,*arr7,*arr8;
    NSMutableArray *Color1,*Color2,*Color3,*Color4,*Color5,*Color6,*Color7,*Color8;
    UIButton *btn_start;
    UIButton *helpButton;
    UIButton *selectHexagramButton;
    UIButton *toggleMP3Button;
    UIButton *playDrumButton;
    UIImageView *hexaIcon;
   
    AVAudioPlayer* theAudio;
    AVAudioPlayer *MainAudio2,*MP3_Player;
    NSString  *MainPattern1,*MainPattern2,*MainClor1,*MainClor8;
    
    NSDate *databaseDate;
    NSTimer *timer,*SoundTimer;
    int stopplay;
    int playhexasound;
    int duration_Times;
    
    UIImageView *Swipeimgeview;
   
    int damru,damru2;
    int firsttimetimer;
    int CONTINUTIMES,setmaintime;
    UITapGestureRecognizer *tapGesture;
    int firstcall;
    int setfirsttimetimer;
    int index,mp3isplay;
    
    NSMutableArray *Mainarr,*purchaseableTrackArray, *MultiArrayFirst,*MultiArraySecond;
}
@property (strong, nonatomic) IBOutlet UIImageView *image1;
- (IBAction)Clock_Click:(id)sender;

- (IBAction)Purchase_BtnClick:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *HexaButton;
- (IBAction)Hexa_Btn_Click:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *HexaView;

@property (strong, nonatomic) IBOutlet UITableView *HexaTable;
@property (strong, nonatomic) IBOutlet UIButton *Timer_Btn;
- (IBAction)Timer_Click:(id)sender;

//+++++++++++++++ First Images+++++++++
@property (strong, nonatomic) IBOutlet UILabel *Lable_1;
@property (strong, nonatomic) IBOutlet UILabel *Lable_2;
@property (strong, nonatomic) IBOutlet UILabel *Lable_3;
@property (strong, nonatomic) IBOutlet UILabel *Over_LBL;

@property (strong, nonatomic) IBOutlet UIImageView *MainColorPlt1;
@property (strong, nonatomic) IBOutlet UIImageView *MainColorPlt2;
@property (strong, nonatomic) IBOutlet UIImageView *ColorPatern1;
@property (strong, nonatomic) IBOutlet UIImageView *ColorPatern2;

@property (strong, nonatomic) IBOutlet UILabel *Timer_Lbl;

//+++++++++++++++++++++++++++++++++++++++
@property (strong, nonatomic) IBOutlet UIImageView *ColorImg1;
@property (strong, nonatomic) IBOutlet UIImageView *Swipeimage;

@property (strong, nonatomic) IBOutlet UIImageView *topImage;
@property (strong, nonatomic) IBOutlet UIImageView *bottomImage;

- (void)playDrumForMp3:(int) newDamru andNewDamru2:(int) newDamru2;
- (void) playDrumSound;
- (BOOL) isPremiumVersion;

@end
