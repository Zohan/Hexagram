//
//  mainview.m
//  Hexagram
//
//  Created by Creative Rohit on 3/27/14.
//  Copyright (c) 2014 Creative Rohit. All rights reserved.
//

#import "mainview.h"
#import "UIView+Toast.h"
#import "AppDelegate.h"
#import "MJSecondDetailViewController.h"
#import "UIViewController+MJPopupViewController.h"
#import "UIDevice+Resolutions.h"
#import "SetTimer.h"


static NSString * const sampleDescription1 = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
static NSString * const sampleDescription2 = @"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.";
static NSString * const sampleDescription3 = @"Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.";
static NSString * const sampleDescription4 = @"Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit.";

#define DEGREES_TO_RADIANS(angle) (angle / 180.0 * M_PI)

@interface mainview ()<MJSecondPopupDelegate>
{
}

@end

@implementation mainview
@synthesize image1,TopImg1,TopImg2,TopImg3,TopImg4,TopImg5,TopImg6,TopImg7,TopImg8,Timer_Btn;
@synthesize MainColorPlt2,MainColorPlt1,HexaButton,Lable_2,Lable_3,ColorPatern1,ColorPatern2;
@synthesize ColorImg1,ColorImg2,ColorImg3,ColorImg4,ColorImg5,ColorImg6,ColorImg7,ColorImg8,Swipeimage,Over_LBL;
@synthesize topImage, bottomImage;

@synthesize HexaTable,HexaView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    buttonarr=[[NSMutableArray alloc]init];
    buttonarr =[[[NSUserDefaults standardUserDefaults]objectForKey:@"PerchaseArray"]mutableCopy];
    
    NSLog(@"alray perchase list : %@",buttonarr);
    
    [Swipeimgeview setUserInteractionEnabled:YES];
    [super viewWillAppear:animated];
    
    if (MaintimeSTR.length==0||MaintimeSTR == nil)
    {
        /*if (note==20)
        {
            

        }*/
    }
    else
    {
        CountTimer=0;
        int tt=[MaintimeSTR intValue]*60;
        
        if ([MaintimeSTR isEqualToString:@"1"])
        {
         [Timer_Btn setTitle:@"00:59" forState:UIControlStateNormal];
        }
        else
        {
         [Timer_Btn setTitle:MaintimeSTR forState:UIControlStateNormal];
        }
        
        databaseDate = [NSDate dateWithTimeIntervalSinceNow:tt];
        [self playPauseUnstick];
        [self updateTimeLeft];
        CountTimer = 20;
        //[MPNowPlayingInfoCenter defaultCenter];
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    setfirsttimetimer=20;
    CONTINUTIMES=0;
     Mainarr=[[NSMutableArray alloc]initWithObjects:@"Taking Action",@"Allowing",@"Challenges",@"Innocence",@"Inevitability",@"Confrontation",@"Rallying",@"Union",@"Preparing",@"Cautious Action",@"Peace",@"Chaos",@"Fellowship",@"Prosperity",@"Humility",@"Energy Rising",@"Following",@"Healing",@"Thriving",@"Observation",@"Clearing Paths",@"Beauty",@"Release",@"Restoration",@"Presence",@"Focused Intention",@"Nourishment",@"Pressure",@"Deep Water",@"Passion",@"Attraction",@"Long Lasting", @"Restraint",@"Increasing Energy",@"Success",@"Dark Times",@"Family",@"Opposition",@"Obstacles",@"Freedom",@"Self-Discipline",@"Good Fortune",@"Determination",@"Over Indulgence",@"Unified Force",@"Growth",@"Emptiness",@"Feeding the Soul", @"Revolution",@"Alchemy",@"Power",@"Keeping Still",@"Steady Progress",@"Impulsiveness",@"Abundance",@"Restlessness",@"Gentle Persistance",@"Joy",@"Dissolving",@"Boundaries",@"Wisdom",@"Details",@"After Victory",@"Before Victory",nil];
    
    
   MultiArrayFirst =[[NSMutableArray alloc]initWithObjects:
                                      @"9",@"5",@"7",@"8",@"7",@"9",@"5",@"7",
                                      @"6",@"9",@"5",@"9",@"9",@"3",@"5",@"2",
                                      @"4",@"8",@"5",@"6",@"3",@"8",@"8",@"5",
                                      @"9",@"8",@"8",@"4",@"7",@"3",@"4",@"2",
                                      @"9",@"2",@"3",@"5",@"6",@"3",@"7",@"2",
                                      @"8",@"6",@"4",@"9",@"4",@"5",@"4",@"7",
                                      @"4",@"3",@"2",@"8",@"6",@"2",@"2",@"3",
                                      @"6",@"4",@"6",@"7",@"6",@"2",@"7",@"3",nil];
    MultiArraySecond =[[NSMutableArray alloc]initWithObjects:
                                       @"9",@"5",@"2",@"7",@"9",@"7",@"7",@"5",
                                       @"9",@"4",@"9",@"5",@"3",@"9",@"8",@"5",
                                       @"2",@"6",@"4",@"5",@"2",@"3",@"5",@"2",
                                       @"2",@"9",@"2",@"6",@"7",@"3",@"8",@"6",
                                       @"8",@"9",@"5",@"3",@"3",@"4",@"8",@"7",
                                       @"4",@"2",@"9",@"6",@"5",@"6",@"7",@"6",
                                       @"3",@"6",@"2",@"8",@"8",@"4",@"3",@"8",
                                       @"6",@"4",@"7",@"4",@"4",@"8",@"3",@"7",nil];
    
    
    [HexaButton setHidden:YES];
    [Lable_2 setHidden:YES];
    [Over_LBL setHidden:YES];
    [Lable_3 setHidden:YES];
    [MainColorPlt2 setHidden:YES];
    [MainColorPlt1 setHidden:YES];
    [ColorPatern1 setHidden:YES];
    [ColorPatern2 setHidden:YES];
    
    self.navigationController.navigationBar.hidden=YES;
    
    arr=[[NSMutableArray alloc]initWithObjects:@"1-1.png",@"1-2.png",@"1-3.png",@"1-4.png",@"1-5.png",@"1-6.png",@"1-7.png",@"1-8.png", nil];
    
    if ([UIDevice currentResolution] == UIDevice_iPhoneTallerHiRes)
    {
        
        UIImageView *image_start = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Wheel Updated 2"]];
        image_start.frame = CGRectMake(46, 35, 225, 225);
        bagua = image_start;
        [self.view addSubview:bagua];
        
                
        btn_start = [UIButton buttonWithType:UIButtonTypeCustom];
        btn_start.frame = CGRectMake(110, 97, 100.0, 100.0);
        UIImage *imag=[UIImage imageNamed:@"640x1136Fqce.png"];
        [btn_start setTitle:@"" forState:UIControlStateNormal];
        [btn_start setBackgroundImage:imag forState:UIControlStateNormal];
        // [btn_start setTitle:@"start" forState:UIControlStateNormal];
        [btn_start addTarget:self action:@selector(Purchase_BtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn_start];
        [self.view addSubview:HexaView];
    }
    else
    {
        
        UIImageView *image_start = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Wheel Updated 2"]];
        image_start.frame = CGRectMake(46, 17, 225, 225);
        bagua = image_start;
        [self.view addSubview:bagua];
        
        btn_start = [UIButton buttonWithType:UIButtonTypeCustom];
        btn_start.frame = CGRectMake(125, 95, 70.0, 70.0);
        UIImage *imag=[UIImage imageNamed:@"640x1136Fqce.png"];
        [btn_start setTitle:@"" forState:UIControlStateNormal];
        [btn_start setBackgroundImage:imag forState:UIControlStateNormal];
        // [btn_start setTitle:@"start" forState:UIControlStateNormal];
        [btn_start addTarget:self action:@selector(Purchase_BtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn_start];
        [self.view addSubview:HexaView];
    }
    
    [self addPlayPauseButton];
    [self addHelpButton];
    [self addHexaBtn];
    [self addMP3IndicatorButton];
    MaintimeSTR=@"10:00";
    
    tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected:)];
    tapGesture.numberOfTapsRequired = 1;
    tapGesture.numberOfTouchesRequired = 1;
    [Swipeimgeview addGestureRecognizer:tapGesture];
    
    if (show==20)
    {
        [self.view makeToast:@"Spin the wheel to Begin..."
                    duration:3.0
                    position:@"center"
                       image:[UIImage imageNamed:@"640x1136Fqce"]];
    }
    
    btn_start.selected=YES;
}

-(void) addPlayPauseButton {
    btn_start = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    btn_start.frame = CGRectMake(2*width/3, 2*height/3, 80.0, 80.0);
    UIImage *drumImage=[UIImage imageNamed:@"Drum_Grey.png"];
    [btn_start setTitle:@"" forState:UIControlStateNormal];
    [btn_start setBackgroundImage:drumImage forState:UIControlStateNormal];
    // [btn_start setTitle:@"start" forState:UIControlStateNormal];
    [btn_start addTarget:self action:@selector(Btn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_start];
}

-(void) addHelpButton {
    helpButton = [UIButton buttonWithType:UIButtonTypeSystem];
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    helpButton.frame = CGRectMake(8*width/10, height/100, 80.0, 80.0);
    [helpButton setTitle:@"Help" forState:UIControlStateNormal];
    // [btn_start setTitle:@"start" forState:UIControlStateNormal];
    [helpButton addTarget:self action:@selector(helpClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:helpButton];
}

-(void) addHexaBtn {
    selectHexagramButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    selectHexagramButton.frame = CGRectMake(0, height/2 - 15, 40.0, 40.0);
    [selectHexagramButton setTitle:@"" forState:UIControlStateNormal];
    // [btn_start setTitle:@"start" forState:UIControlStateNormal];
    [selectHexagramButton addTarget:self action:@selector(Hexa_Btn_Click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:selectHexagramButton];
    [selectHexagramButton setHidden:YES];
}

-(void) addMP3IndicatorButton {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    toggleMP3Button = [UIButton buttonWithType:UIButtonTypeCustom];
    toggleMP3Button.frame = CGRectMake(8*width/10, 4*height/10, 40.0, 40.0);
    UIImage *imag=[UIImage imageNamed:@"Meditation_grey.png"];
    [toggleMP3Button setTitle:@"" forState:UIControlStateNormal];
    [toggleMP3Button setBackgroundImage:imag forState:UIControlStateNormal];
    // [btn_start setTitle:@"start" forState:UIControlStateNormal];
    [toggleMP3Button addTarget:self action:@selector(toggleMP3Track) forControlEvents:UIControlEventTouchUpInside];
    [toggleMP3Button setHidden:YES];
    [self.view addSubview:toggleMP3Button];
}

-(void) tapDetected : (id) sender
{
    //[self Swipewheel];
}

-(void)Swipewheel
{
    soundgapint=20;
    
    buttonarr=[[NSMutableArray alloc]init];
    buttonarr =[[[NSUserDefaults standardUserDefaults]objectForKey:@"PerchaseArray"]mutableCopy];
    
    NSLog(@"alray perchase list : %@",buttonarr);
    firstcall=20;
    
    CountTimer=20;
    playhexasound=0;
    
    [btn_start setUserInteractionEnabled:NO];
    [HexaButton setUserInteractionEnabled:NO];
    [Swipeimgeview setUserInteractionEnabled:NO];
    
   // CountTimer=0;
    
    [theAudio stop];

    if([MP3_Player isPlaying])
    {
        [MP3_Player stop];
    }
   
   // playhexasound=0;
    [HexaButton setUserInteractionEnabled:NO];
    
    
    [btn_start setUserInteractionEnabled:NO];
    [image1 setHidden:NO];
    [bagua setHidden:NO];
    
    [ColorImg1 setHidden:YES];
    [ColorImg2 setHidden:YES];
    [ColorImg3 setHidden:YES];
    [ColorImg4 setHidden:YES];
    [ColorImg5 setHidden:YES];
    [ColorImg6 setHidden:YES];
    [ColorImg7 setHidden:YES];
    [ColorImg8 setHidden:YES];
    
    
    [TopImg1 setHidden:YES];
    [TopImg2 setHidden:YES];
    [TopImg3 setHidden:YES];
    [TopImg4 setHidden:YES];
    [TopImg5 setHidden:YES];
    [TopImg6 setHidden:YES];
    [TopImg7 setHidden:YES];
    [TopImg8 setHidden:YES];
    
    
    srand((unsigned)time(0));
    random = (rand() % 20) / 10.0;
    CABasicAnimation *spin = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    [spin setFromValue:[NSNumber numberWithFloat:M_PI * (0.0+orign)]];
    [spin setToValue:[NSNumber numberWithFloat:M_PI * (10.0+random+orign)]];
    [spin setDuration:0.5];
    [spin setDelegate:self];
    spin.speed = 1;
    spin.repeatCount=4;
    
    [spin setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    
    [[bagua layer] addAnimation:spin forKey:nil];
    bagua.transform = CGAffineTransformMakeRotation(M_PI * (10.0+random-orign));
    orign = 10.0+random+orign;
    orign = fmodf(orign, 2.0);
    
    [[image1 layer] addAnimation:spin forKey:nil];
    image1.transform = CGAffineTransformMakeRotation(M_PI * (5+random-orign));
    orign = 10.0+random+orign;
    orign = fmodf(orign, 2.0);
}

-(void)swipeleftblocks:(UISwipeGestureRecognizer*)gestureRecognizer
{
    [Swipeimgeview setUserInteractionEnabled:NO];
    //[self Swipewheel];
}

-(void)playDrumSound
{
    NSLog(@"damru===%d",damru);
    
    NSString *str=[NSString stringWithFormat:@"%d%d",damru,damru2];
    NSString *path = [[NSBundle mainBundle] pathForResource:str ofType:@"aiff"];
    
    theAudio=[[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
    theAudio.delegate = self;
    
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    [[AVAudioSession sharedInstance] setActive: YES error: nil];
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    [theAudio prepareToPlay];
    
}

-(void)playDrumForMp3:(int) newDamru andNewDamru2:(int) newDamru2 {
    damru = newDamru;
    damru2 = newDamru2;
    [self playDrumSound];
    //[theAudio play];
    NSString *str=[NSString stringWithFormat:@"%d.png",damru];
    MainPattern1 = [NSString stringWithString:str];
    str=[NSString stringWithFormat:@"%d.png",damru2];
    MainPattern2 = [NSString stringWithString:str];
    [HexaButton setHidden:NO];
    [selectHexagramButton setHidden:NO];
    [Lable_2 setHidden:NO];
    [Lable_3 setHidden:NO];
    [Over_LBL setHidden:NO];
    
    [MainColorPlt2 setHidden:NO];
    [MainColorPlt1 setHidden:NO];
    [ColorPatern1 setHidden:NO];
    [ColorPatern2 setHidden:NO];
    [self MainLable];
    
}

- (void) playPauseUnstick
{
    UIImage *drumImage=[UIImage imageNamed:@"Drum.png"];
    [btn_start setTitle:@"" forState:UIControlStateNormal];
    [btn_start setImage:drumImage forState:UIControlStateNormal];
    UIImage *newDrumImage=[UIImage imageNamed:@"Drum_Grey.png"];
    [btn_start setTitle:@"Hello" forState:UIControlStateNormal];
    [btn_start setImage:newDrumImage forState:UIControlStateNormal];
}

- (void)Btn
{
    if(mp3isplay==20)
    {
        UIImage *drumImage=[UIImage imageNamed:@"Drum.png"];
        [btn_start setTitle:@"" forState:UIControlStateNormal];
        [btn_start setImage:drumImage forState:UIControlStateNormal];
        [theAudio play];
        mp3isplay=10;
        if (CONTINUTIMES==20)
        {
            if (MaintimeSTR.length==0)
            {
                int time=10*60;
                databaseDate = [NSDate dateWithTimeIntervalSinceNow:time];
            }
            else
            {
                int tt=[MaintimeSTR intValue]*60;
                databaseDate = [NSDate dateWithTimeIntervalSinceNow:tt];
                
            }
        }
        else
        {
            NSLog(@"TIMES++++%d",timestop);
            databaseDate = [NSDate dateWithTimeIntervalSinceNow:timestop];
            
        }
        CONTINUTIMES=0;
        
        CountTimer=0;
        playhexasound=20;
    }
    
   else if ([MP3_Player isPlaying])
    {
        UIImage *drumImage=[UIImage imageNamed:@"Drum_Grey.png"];
        [btn_start setTitle:@"" forState:UIControlStateNormal];
        [btn_start setImage:drumImage forState:UIControlStateNormal];
        [self toggleMP3Track];
        mp3isplay=20;
        
        [theAudio pause];
        CountTimer=20;
        playhexasound=0;
    }
    else
    {
        if (btn_start.selected==YES)
        {
        }
        else
        {
            [theAudio play];
            [MPNowPlayingInfoCenter defaultCenter];
        }
        
        if (![theAudio isPlaying] && setfirsttimetimer != 20)
        {
            
            UIImage *drumImage=[UIImage imageNamed:@"Drum.png"];
            [btn_start setTitle:@"" forState:UIControlStateNormal];
            [btn_start setImage:drumImage forState:UIControlStateNormal];
            [theAudio play];
            [MPNowPlayingInfoCenter defaultCenter];
            
            if (CONTINUTIMES==20)
            {
                if (MaintimeSTR.length==0)
                {
                    int time=10*60;
                    databaseDate = [NSDate dateWithTimeIntervalSinceNow:time];
                }
                else
                {
                    int tt=[MaintimeSTR intValue]*60;
                    databaseDate = [NSDate dateWithTimeIntervalSinceNow:tt];
                    
                }
            }
            else
            {
                NSLog(@"TIMES++++%d",timestop);
                databaseDate = [NSDate dateWithTimeIntervalSinceNow:timestop];
                
            }
            CONTINUTIMES=0;
            
            CountTimer=0;
            playhexasound=20;
            
        }
        else
        {
            UIImage *drumImage=[UIImage imageNamed:@"Drum_Grey.png"];
            [btn_start setTitle:@"" forState:UIControlStateNormal];
            [btn_start setImage:drumImage forState:UIControlStateNormal];
            [theAudio pause];
            [MP3_Player pause];
            CountTimer=20;
            playhexasound=0;
        }
    }
    
}

-(void) toggleMP3Track {
    if([MP3_Player isPlaying]) {
        UIImage *imag=[UIImage imageNamed:@"Meditation_grey.png"];
        [toggleMP3Button setTitle:@"" forState:UIControlStateNormal];
        [toggleMP3Button setBackgroundImage:imag forState:UIControlStateNormal];
        [MP3_Player pause];
    } else {
        UIImage *imag=[UIImage imageNamed:@"Meditation.png"];
        [toggleMP3Button setTitle:@"" forState:UIControlStateNormal];
        [toggleMP3Button setBackgroundImage:imag forState:UIControlStateNormal];
        [MP3_Player play];
    }
}

-(void)PassString1:(NSString*)string
{
    if ([MainPattern1 isEqualToString:@"9"])
    {
        Lable_2.text=@"Heaven";
        [topImage setImage: [UIImage imageNamed:@"HeavenBlock.png"]];
    }
    else if ([MainPattern1 isEqualToString:@"2"])
    {
        Lable_2.text=@"Thunder";
        [topImage setImage: [UIImage imageNamed:@"ThunderBlock.png"]];
    }
    else if ([MainPattern1 isEqualToString:@"3"])
    {
        Lable_2.text=@"Fire";
        [topImage setImage: [UIImage imageNamed:@"FireBlock.png"]];
    }
    else if ([MainPattern1 isEqualToString:@"4"])
    {
        Lable_2.text=@"Lake";
        [topImage setImage: [UIImage imageNamed:@"LakeBlock.png"]];
    }
    else if ([MainPattern1 isEqualToString:@"5"])
    {
        Lable_2.text=@"Earth";
        [topImage setImage: [UIImage imageNamed:@"EarthBlock.png"]];
    }
    else if ([MainPattern1 isEqualToString:@"6"])
    {
        Lable_2.text=@"Wind";
        [topImage setImage: [UIImage imageNamed:@"WindBlock.png"]];
    }
    else if ([MainPattern1 isEqualToString:@"7"])
    {
        Lable_2.text=@"Water";
        [topImage setImage: [UIImage imageNamed:@"WaterBlock.png"]];
    }
    else if ([MainPattern1 isEqualToString:@"8"])
    {
        Lable_2.text=@"Mountain";
        [topImage setImage: [UIImage imageNamed:@"MountainBlock.png"]];
    }
}

-(void)PassString2:(NSString*)string
{
    if ([MainPattern2 isEqualToString:@"9"])
    {
        Lable_3.text=@"Heaven";
        [bottomImage setImage: [UIImage imageNamed:@"HeavenBlock.png"]];
    }
    else if ([MainPattern2 isEqualToString:@"2"])
    {
        Lable_3.text=@"Thunder";
        [bottomImage setImage: [UIImage imageNamed:@"ThunderBlock.png"]];
    }
    else if ([MainPattern2 isEqualToString:@"3"])
    {
        Lable_3.text=@"Fire";
        [bottomImage setImage: [UIImage imageNamed:@"FireBlock.png"]];
    }
    else if ([MainPattern2 isEqualToString:@"4"])
    {
        Lable_3.text=@"Lake";
        [bottomImage setImage: [UIImage imageNamed:@"LakeBlock.png"]];
    }
    else if ([MainPattern2 isEqualToString:@"5"])
    {
        Lable_3.text=@"Earth";
        [bottomImage setImage: [UIImage imageNamed:@"EarthBlock.png"]];
    }
    else if ([MainPattern2 isEqualToString:@"6"])
    {
        Lable_3.text=@"Wind";
        [bottomImage setImage: [UIImage imageNamed:@"WindBlock.png"]];
    }
    else if ([MainPattern2 isEqualToString:@"7"])
    {
        Lable_3.text=@"Water";
        [bottomImage setImage: [UIImage imageNamed:@"WaterBlock.png"]];
    }
    else if ([MainPattern2 isEqualToString:@"8"])
    {
        Lable_3.text=@"Mountain";
        [bottomImage setImage: [UIImage imageNamed:@"MountainBlock.png"]];
    }
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [HexaButton setUserInteractionEnabled:NO];
    [Swipeimgeview setUserInteractionEnabled:NO];
    //[bagua setHidden: YES];
   
   // image1.transform = CGAffineTransformMakeRotation(M_PI * (4.000));
    //bagua.transform = CGAffineTransformMakeRotation(M_PI * (4.000));
    
    NSLog(@"Transform: %f", atan2(bagua.transform.b, bagua.transform.a));
    
    bagua.transform = CGAffineTransformMakeRotation(M_PI * atan2(bagua.transform.b, bagua.transform.a));
   
    [theAudio stop];
    [MP3_Player stop];
    
   // [image1 setHidden:YES];
    [HexaButton setHidden:NO];
    [selectHexagramButton setHidden:NO];
    [Lable_2 setHidden:NO];
    [Lable_3 setHidden:NO];
    [Over_LBL setHidden:NO];
    
    [MainColorPlt2 setHidden:NO];
    [MainColorPlt1 setHidden:NO];
    [ColorPatern1 setHidden:NO];
    [ColorPatern2 setHidden:NO];
    
    
    //+++++++++++++++++++++++++++++ COLOR IMAGE CODE ++++++++++++++++++++++++++++
    
     Color1=[[NSMutableArray alloc]initWithObjects:@"Color1-1.png",@"Color1-2.png",@"Color1-3.png",@"Color1-4.png",@"Color1-5.png",@"Color1-6.png",@"Color1-7.png",@"Color1-8.png", nil];
    
    Color2=[[NSMutableArray alloc]initWithObjects:@"Color2-1.png",@"Color2-2.png",@"Color2-3.png",@"Color2-4.png",@"Color2-5.png",@"Color2-6.png",@"Color2-7.png",@"Color2-8.png", nil];
    
    Color3=[[NSMutableArray alloc]initWithObjects:@"Color3-1.png",@"Color3-2.png",@"Color3-3.png",@"Color3-4.png",@"Color3-5.png",@"Color3-6.png",@"Color3-7.png",@"Color3-8.png", nil];
    
    Color4=[[NSMutableArray alloc]initWithObjects:@"Color4-1.png",@"Color4-2.png",@"Color4-3.png",@"Color4-4.png",@"Color4-5.png",@"Color4-6.png",@"Color4-7.png",@"Color4-8.png", nil];
    
    Color5=[[NSMutableArray alloc]initWithObjects:@"Color5-1.png",@"Color5-2.png",@"Color5-3.png",@"Color5-4.png",@"Color5-5.png",@"Color5-6.png",@"Color5-7.png",@"Color5-8.png", nil];
    
    Color6=[[NSMutableArray alloc]initWithObjects:@"Color6-1.png",@"Color6-2.png",@"Color6-3.png",@"Color6-4.png",@"Color6-5.png",@"Color6-6.png",@"Color6-7.png",@"Color6-8.png", nil];
    
    Color7=[[NSMutableArray alloc]initWithObjects:@"Color7-1.png",@"Color7-2.png",@"Color7-3.png",@"Color7-4.png",@"Color7-5.png",@"Color7-6.png",@"Color7-7.png",@"Color7-8.png", nil];
    
    Color8=[[NSMutableArray alloc]initWithObjects:@"Color8-1.png",@"Color8-2.png",@"Color8-3.png",@"Color8-4.png",@"Color8-5.png",@"Color8-6.png",@"Color8-7.png",@"Color8-8.png", nil];
    
    int randomElement = rand()%8+1;
    MainPattern1= [NSString stringWithFormat:@"%dBtn.png",randomElement];
    UIImage *ptrnimg2=[UIImage imageNamed:MainPattern1];
    ColorPatern1.image=ptrnimg2;
   
    MainPattern2= [NSString stringWithFormat:@"%dBtn.png",[self getBottomBaguaElement]];
    UIImage *ptnimg11=[UIImage imageNamed:MainPattern2];
    ColorPatern2.image=ptnimg11;
    
    [self levelBagua];
    
    [self MainLable];
    
}

-(void)setTopElement:(int) element {
    MainPattern2= [NSString stringWithFormat:@"%dBtn.png",[self getBottomBaguaElement]];
    UIImage *ptnimg11=[UIImage imageNamed:MainPattern2];
    ColorPatern2.image=ptnimg11;
}

-(void)MainLable
{
    soundgapint=0;
     mp3isplay=10;
    NSMutableArray *multiArray =[[NSMutableArray alloc]init];
    for (int a=0; a<64; a++)
    {
        [multiArray insertObject:[NSMutableArray arrayWithObjects:[MultiArrayFirst objectAtIndex:a],[MultiArraySecond objectAtIndex:a], nil] atIndex:a];
    }
    MainPattern1 =[MainPattern1 substringToIndex:1];
    MainPattern2 =[MainPattern2 substringToIndex:1];
    if ([MainPattern1 intValue]==1)
    {
        MainPattern1 =@"9";
    }
    if ([MainPattern2 intValue] ==1)
    {
        MainPattern2 =@"9";
    }
    
    NSMutableArray *Mutlisecond =[[NSMutableArray alloc]init];
    [Mutlisecond insertObject:[NSMutableArray arrayWithObjects:MainPattern1,MainPattern2, nil] atIndex:0];
    int set=0;
    for (int i=0; i<64; i++)
    {
        if ([[multiArray objectAtIndex:i] isEqualToArray:[Mutlisecond objectAtIndex:0]])
        {
            set =i;
            break;
        }
    }
    
   
    [self PassString1:MainPattern1];
    [self PassString2:MainPattern2];
  
    NSLog(@"%@",[Mainarr objectAtIndex:set]);
   
    [HexaButton setTitle:[Mainarr objectAtIndex:set] forState:UIControlStateNormal];
    
    if (firsttimetimer!=20)
    {
        [SoundTimer invalidate];
        SoundTimer=nil;
        SoundTimer=[[NSTimer alloc]init];
        SoundTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                      target:self
                                                    selector:@selector(updateTimeLeft)
                                                    userInfo:nil
                                                     repeats:YES];

    }
    
    NSString *str1=[NSString stringWithFormat:@"%@%@",MainPattern1,@"_Plate"];
     NSString *str2=[NSString stringWithFormat:@"%@%@",MainPattern2,@"_Plate"];
    
    MainColorPlt1.image=[UIImage imageNamed:str1];
     MainColorPlt2.image=[UIImage imageNamed:str2];
    
  
    damru=[MainPattern2 intValue];
    damru2=[MainPattern1 intValue];
    stopplay=0;
    
    [self playDrumSound];
    NSLog(@"damru play==%d",damru);
    //CountTimer=20;
    //playhexasound=20;
    
    if (setfirsttimetimer==20)
    {
        if (MaintimeSTR.length==0)
        {
            MaintimeSTR = [MaintimeSTR initWithString:@"10"];
            int time=[MaintimeSTR intValue]*60;
            databaseDate = [NSDate dateWithTimeIntervalSinceNow:time];
        }
        else
        {
            int tt=[MaintimeSTR intValue]*60;
            databaseDate = [NSDate dateWithTimeIntervalSinceNow:tt];
            
        }
        setfirsttimetimer=0;
    }
    else
    {
        NSLog(@"TIMES++++%d",timestop);
        databaseDate = [NSDate dateWithTimeIntervalSinceNow:timestop];
        
    }
    
    Hexaname=[Mainarr objectAtIndex:set];
    [self CHK_MP3_Sound];
    [MP3_Player pause];
    [theAudio pause];
    CountTimer = 20;

    //[theAudio play];
    
}


- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    if (player == theAudio)
    {
        if (stopplay==20)
        {
            [self playDrumSound];
            [MPNowPlayingInfoCenter defaultCenter];
            stopplay=0;
        }
        else
        {
            [self playDrumSound];
            stopplay=20;
           // [theAudio play];
            [MPNowPlayingInfoCenter defaultCenter];
        }
    }
    //[theAudio setNumberOfLoops: -1];
    [theAudio setNumberOfLoops:-1];
    [theAudio play];
    if (player==MP3_Player)
    {
        [MP3_Player stop];
        mp3isplay=10;
        [theAudio play];
    }
}

- (void)updateTimeLeft
{
    
   [timer invalidate];
   timer =nil;
   timer=[[NSTimer alloc]init];
    
    NSTimeInterval remainingSec = [databaseDate timeIntervalSinceNow];
   NSLog(@"MainTimeStr===%@",MaintimeSTR);
    if (MaintimeSTR.length==0)
    {
        if (playhexasound==20)
        {
            firsttimetimer=20;
            
            if([MP3_Player isPlaying])
            {
                remainingSec = MP3_Player.duration+300 - MP3_Player.currentTime;
                
                NSInteger remainder = ((NSInteger)remainingSec)% 3600;
                NSInteger minutess = remainder / 60;
                NSInteger secondss = remainder % 60;
                
                
                [Timer_Btn setTitle:[NSString stringWithFormat:@"%02d:%02d",minutess,secondss] forState:UIControlStateNormal];
                
                if ([Timer_Btn.titleLabel.text isEqualToString:@"00:00"])
                {
                    [MP3_Player stop];
                    [theAudio stop];
                    int i= 10*60;
                    databaseDate = [NSDate dateWithTimeIntervalSinceNow:i];
                    CountTimer=20;
                    playhexasound=0;
                    
                }
                NSLog(@"hello===%@",Timer_Btn.titleLabel.text);
                
            }
            
        
            NSInteger remainder = ((NSInteger)remainingSec)% 3600;
            NSInteger minutess = remainder / 60;
            NSInteger secondss = remainder % 60;
            
            
            [Timer_Btn setTitle:[NSString stringWithFormat:@"%02d:%02d",minutess,secondss] forState:UIControlStateNormal];
            NSLog(@"hello===%@",Timer_Btn.titleLabel.text);
            NSLog(@"Remaing second===%f",remainingSec);
            CountTimer=20;
            
            timestop=remainder;
            
           
            if ([Timer_Btn.titleLabel.text isEqualToString:@"00:00"])
            {
                [MP3_Player stop];
                [theAudio stop];
                int i= 10*60;
                databaseDate = [NSDate dateWithTimeIntervalSinceNow:i];
                CountTimer=20;
                playhexasound=0;

            }
            

        }
        
        if (playhexasound!=20)
        {
            CountTimer=20;
        }
    }
    else
    {
        if (!SoundTimer || remainingSec <= 0)
        {
            int tt=[MaintimeSTR intValue]*60;
            
            databaseDate = [NSDate dateWithTimeIntervalSinceNow:tt];
            remainingSec = [databaseDate timeIntervalSinceNow];
            SoundTimer=[[NSTimer alloc]init];
            SoundTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self
                                                   selector:@selector(updateTimeLeft)
                                                   userInfo:nil
                                                    repeats:YES];
            
            NSInteger remainder = ((NSInteger)remainingSec)% 3600;
            NSInteger minutess = remainder / 60;
            NSInteger secondss = remainder % 60;
            
            
            [Timer_Btn setTitle:[NSString stringWithFormat:@"%02d:%02d",minutess,secondss] forState:UIControlStateNormal];
            
            if ([Timer_Btn.titleLabel.text isEqualToString:@"00:00" ])
            {
                [theAudio stop];
                [theAudio stop];
            }
            
            NSLog(@"hello===%@",Timer_Btn.titleLabel.text);
        }
    }
    
    if (CountTimer!=20)
    {
       
        NSInteger remainder = ((NSInteger)remainingSec)% 3600;
        NSInteger minutess = remainder / 60;
        NSInteger secondss = remainder % 60;
        
        timestop=remainder;
        
        [Timer_Btn setTitle:[NSString stringWithFormat:@"%02d:%02d",minutess,secondss] forState:UIControlStateNormal];
        NSLog(@"hello===%@",Timer_Btn.titleLabel.text);
        
        if ([Timer_Btn.titleLabel.text isEqualToString:@"00:00" ])
        {
            [theAudio stop];
            [MP3_Player stop];
            
            int tt=[MaintimeSTR intValue]*60;
            
            databaseDate = [NSDate dateWithTimeIntervalSinceNow:tt];
            remainingSec = [databaseDate timeIntervalSinceNow];
            
            NSInteger remainder = ((NSInteger)remainingSec)% 3600;
            NSInteger minutess = remainder / 60;
            NSInteger secondss = remainder % 60;
            
            
            [Timer_Btn setTitle:[NSString stringWithFormat:@"%02d:%02d",minutess,secondss] forState:UIControlStateNormal];
            firsttimetimer = 0;
            setfirsttimetimer = 20;
            [SoundTimer invalidate];
            
        }
        
    }
    else
    {
        remainingSec=remainingSec;
    }
   
    if (remainder==0)
    {
        CountTimer=20;
        playhexasound=0;
    }
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([UIDevice currentResolution] == UIDevice_iPhoneTallerHiRes)
    {
        if (HexaButton.selected==YES)
        {
            HexaButton.selected=NO;
            
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:1];
            HexaView.frame=CGRectMake(65, -310, 190, 290);
            
            [HexaView setAlpha:50];
            [UIView commitAnimations];
            [HexaView setAlpha:50];
            //[theAudio stop];
        }
    }
    else
    {
        if (HexaButton.selected==YES)
        {
            HexaButton.selected=NO;
            
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:1];
            HexaView.frame=CGRectMake(65, -310, 190, 250);
            
            [HexaView setAlpha:50];
            [UIView commitAnimations];
            [HexaView setAlpha:50];
            //[theAudio stop];
            //[self.view addSubview:btn_start];
        }
    }
}

CGFloat angleBetweenLinesInDegrees(CGPoint beginLineA, CGPoint endLineA, CGPoint beginLineB, CGPoint endLineB)
{
    CGFloat a = endLineA.x - beginLineA.x;
    CGFloat b = endLineA.y - beginLineA.y;
    CGFloat c = endLineB.x - beginLineB.x;
    CGFloat d = endLineB.y - beginLineB.y;
    
    CGFloat atanA = atan2(a, b);
    CGFloat atanB = atan2(c, d);
    
    // convert radians to degrees
    return (atanA - atanB) * 180 / M_PI;
}

-(int)getBottomBaguaElement {
    float baguaAngle = atan2(bagua.transform.b, bagua.transform.a);
    NSLog(@"Transform: %f", baguaAngle);
    
    int element = 0;
    
    if(baguaAngle >= 7*M_PI/8 || baguaAngle <= -7*M_PI/8) {
        element = 2;
    } else if(baguaAngle >= -7*M_PI/8 && baguaAngle <= -5*M_PI/8) {
        element = 1;
    } else if(baguaAngle >= -5*M_PI/8 && baguaAngle <= -3*M_PI/8) {
        element = 8;
    } else if(baguaAngle >= -3*M_PI/8 && baguaAngle <= -1*M_PI/8) {
        element = 7;
    } else if(baguaAngle >= -1*M_PI/8 && baguaAngle <= 1*M_PI/8) {
        element = 6;
    } else if(baguaAngle >= 1*M_PI/8 && baguaAngle <= 3*M_PI/8) {
        element = 5;
    } else if(baguaAngle >= 3*M_PI/8 && baguaAngle <= 5*M_PI/8) {
        element = 4;
    } else if(baguaAngle >= 5*M_PI/8 && baguaAngle <= 7*M_PI/8) {
        element = 3;
    }
    return element;
}

-(void) levelBagua{
    int element = [self getBottomBaguaElement];
    switch (element) {
        case 1:
            bagua.transform = CGAffineTransformMakeRotation(-6*M_PI/8);
            break;
            
        case 2:
            bagua.transform = CGAffineTransformMakeRotation(M_PI);
            break;
            
        case 3:
            bagua.transform = CGAffineTransformMakeRotation(6*M_PI/8);
            break;
            
        case 4:
            bagua.transform = CGAffineTransformMakeRotation(4*M_PI/8);
            break;
            
        case 5:
            bagua.transform = CGAffineTransformMakeRotation(2*M_PI/8);
            break;
            
        case 6:
            bagua.transform = CGAffineTransformMakeRotation(0);
            break;
            
        case 7:
            bagua.transform = CGAffineTransformMakeRotation(-2*M_PI/8);
            break;
            
        case 8:
            bagua.transform = CGAffineTransformMakeRotation(-4*M_PI/8);
            break;
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint curPoint  = [[touches anyObject] locationInView:bagua];
    CGPoint prevPoint = [[touches anyObject] previousLocationInView:bagua];
    
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self.view];
    
    // calculate rotation angle between two points
    CGFloat angle = angleBetweenLinesInDegrees(bagua.center, prevPoint, bagua.center, curPoint);
    //NSLog(@"%f", angle);
    
    // Flip
    if (angle > 180) {
        angle -= 360;
    } else if (angle < -180) {
        angle += 360;
    }
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    if(touchPoint.y < height/2) {
        bagua.layer.transform = CATransform3DRotate(bagua.layer.transform, DEGREES_TO_RADIANS(angle), .0, .0, 1.0);
    }

}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint curPoint  = [[touches anyObject] locationInView:bagua];
    CGPoint prevPoint = [[touches anyObject] previousLocationInView:bagua];
    
    // calculate rotation angle between two points
    CGFloat angle = angleBetweenLinesInDegrees(bagua.center, prevPoint, bagua.center, curPoint);
    
    [self getBottomBaguaElement];

    // 10 is enough angular change to say the user wants to spin the wheel
    if(abs(angle) > 10) {
        [self Swipewheel];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Clock_Click:(id)sender
{
   // [self Stop_Time_Sound];
    [theAudio pause];
    CountTimer=20;
    playhexasound=0;
    
    show=10;
    //NotificationTable *add=[[NotificationTable alloc]initWithNibName:@"NotificationTable" bundle:nil];
    
    //[self .navigationController pushViewController:add animated:YES];
    
}

- (IBAction)Purchase_BtnClick:(id)sender
{
    [theAudio stop];
    [theAudio pause];
    [MP3_Player stop];
    CountTimer=20;
    playhexasound=0;
    if ([UIDevice currentResolution] == UIDevice_iPhoneTallerHiRes)
    {
        if (HexaButton.selected==YES)
        {
            HexaButton.selected=NO;
            
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:1];
            HexaView.frame=CGRectMake(65, -310, 190, 290);
            
            [HexaView setAlpha:50];
            [UIView commitAnimations];
            [HexaView setAlpha:50];
            
        }
    }
    else
    {
        if (HexaButton.selected==YES)
        {
            HexaButton.selected=NO;
            
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:1];
            HexaView.frame=CGRectMake(65, -310, 190, 250);
            
            [HexaView setAlpha:50];
            [UIView commitAnimations];
            [HexaView setAlpha:50];
            //[self.view addSubview:btn_start];
        }
    }
    
    MJSecondDetailViewController *secondDetailViewController = [[MJSecondDetailViewController alloc] initWithNibName:@"MJSecondDetailViewController" bundle:nil];
    if(MP3_Player == nil)
    {
        MP3_Player = [[AVAudioPlayer alloc] init];
    }
    [secondDetailViewController assignAudioPlayer:MP3_Player];
    [secondDetailViewController assignMainView:self];
    [secondDetailViewController assignDrumPlayer:theAudio];
    secondDetailViewController.delegate = self;
    [self presentPopupViewController:secondDetailViewController animationType:MJPopupViewAnimationFade];
}

- (void)cancelButtonClicked:(MJSecondDetailViewController *)aSecondDetailViewController
{
    [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationFade];
}

- (IBAction)Hexa_Btn_Click:(id)sender
{
    buttonarr=[[NSMutableArray alloc]init];
    buttonarr =[[[NSUserDefaults standardUserDefaults]objectForKey:@"PerchaseArray"]mutableCopy];
    
    NSLog(@"alray perchase list : %@",buttonarr);
    
    [theAudio stop];
    [MP3_Player stop];
    CountTimer=20;
    playhexasound=0;
    if ([UIDevice currentResolution] == UIDevice_iPhoneTallerHiRes)
    {
        if (HexaButton.selected==YES)
        {
            HexaButton.selected=NO;
            
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:1];
            HexaView.frame=CGRectMake(65, -310, 190, 290);
            
            [HexaView setAlpha:50];
            [UIView commitAnimations];
            [HexaView setAlpha:50];
        }
        else
        {
            HexaButton.selected=YES;
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:1];
            HexaView.frame=CGRectMake(65, 15, 190, 290);
            [UIView commitAnimations];
            
        }
    }
    else
    {
        if (HexaButton.selected==YES)
        {
            HexaButton.selected=NO;
            
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:1];
            HexaView.frame=CGRectMake(65, -310, 190, 250);
            
            [HexaView setAlpha:50];
            [UIView commitAnimations];
            [HexaView setAlpha:50];
           
        }
        else
        {
            HexaButton.selected=YES;
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:1];
            HexaView.frame=CGRectMake(65, 15, 190, 250);
            [UIView commitAnimations];
            
        }
 
    }
}

-(void) toggleTimer {
    
    
}

-(void)Stop_Time_Sound
{
    [theAudio stop];
    [MP3_Player stop];
    databaseDate = [NSDate dateWithTimeIntervalSinceNow:duration_Times];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return Mainarr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell=nil;
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text=[Mainarr objectAtIndex:indexPath.row];
    cell.textLabel.textColor=[UIColor whiteColor];
    
    [cell setBackgroundColor:[UIColor clearColor]];
    cell.selectionStyle=UITableViewCellSelectionStyleGray;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [theAudio stop];
    [MP3_Player stop];
    NSLog(@"Row Select");
    [HexaButton setTitle:[Mainarr objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    MainPattern1 =[MultiArrayFirst objectAtIndex:indexPath.row];
    MainPattern2 =[MultiArraySecond objectAtIndex:indexPath.row];
    
    NSString *pattern1=[MultiArrayFirst objectAtIndex:indexPath.row];
    NSString *pattern2=[MultiArraySecond objectAtIndex:indexPath.row];
    
    if ([pattern1 isEqualToString:@"9"])
    {
        pattern1=@"1";
    }
    if ([pattern2 isEqualToString:@"9"])
    {
        pattern2=@"1";
    }
    
    if ([MainPattern1 intValue]==1)
    {
        MainPattern1 =@"9";
    }
    if ([MainPattern2 intValue]==1)
    {
        MainPattern2 =@"9";
    }

    NSString *str1=[NSString stringWithFormat:@"%@%@",pattern1,@"Btn.png"];
     NSString *str2=[NSString stringWithFormat:@"%@%@",pattern2,@"Btn.png"];
    
    UIImage *img1=[UIImage imageNamed:str1];
    UIImage *img2=[UIImage imageNamed:str2];
    
    ColorPatern1.image=img1;
    ColorPatern2.image=img2;

    
    [self PassString1:MainPattern1];
    [self PassString2:MainPattern2];
    
    NSLog(@"hello 1=======%@",MainPattern1);
    NSLog(@"hello 2=======%@",MainPattern2);
    
    NSString *plate1=[NSString stringWithFormat:@"%@%@",MainPattern1,@"_Plate"];
    NSString *plate2=[NSString stringWithFormat:@"%@%@",MainPattern2,@"_Plate"];
    
    MainColorPlt1.image=[UIImage imageNamed:plate1];
    MainColorPlt2.image=[UIImage imageNamed:plate2];
    
  
    [self updateTimeLeft];
    
    damru=[MainPattern2 intValue];
    damru2=[MainPattern1 intValue];
    stopplay=0;
    CountTimer=0;
    playhexasound=20;
    

    [self playDrumSound];
    if (timestop==0)
    {
        int time=10*60;
        timestop=time;
       databaseDate = [NSDate dateWithTimeIntervalSinceNow:timestop];
    }
    else
    {
        databaseDate = [NSDate dateWithTimeIntervalSinceNow:timestop];
    }
    
    Hexaname=[Mainarr objectAtIndex:indexPath.row];
    [self CHK_MP3_Sound];
    
    [MPNowPlayingInfoCenter defaultCenter];
    NSLog(@"tabledamru==%d",damru);
}

-(void)Change_ButtonArray_Name
{
    
    if ([[buttonarr objectAtIndex:index] isEqualToString:@"9"])
    {
        HexaString=@"Allowing";
    }
    if ([[buttonarr objectAtIndex:index] isEqualToString:@"2"])
    {
        HexaString=@"Deep Water";
    }
    if ([[buttonarr objectAtIndex:index] isEqualToString:@"3"])
    {
        HexaString=@"Gentle Persistance";
    }
    if ([[buttonarr objectAtIndex:index] isEqualToString:@"4"])
    {
        HexaString=@"Joy";
    }
    if ([[buttonarr objectAtIndex:index] isEqualToString:@"5"])
    {
        HexaString=@"Passion";
    }
    if ([[buttonarr objectAtIndex:index] isEqualToString:@"6"])
    {
        HexaString=@"Power";
    }
    if ([[buttonarr objectAtIndex:index] isEqualToString:@"7"])
    {
        HexaString=@"Prosperity";
    }
    if ([[buttonarr objectAtIndex:index] isEqualToString:@"8"])
    {
        HexaString=@"Taking Action";
    }
    if ([[buttonarr objectAtIndex:index] isEqualToString:@"10"])
    {
        HexaString=@"Keeping Still";
    }
}

-(void)CHK_MP3_Sound
{
    int soundplayint=10;
    if ([Hexaname isEqualToString:@"Peace"])
    {
        [theAudio stop];
        MP3Sound=@"peace";
        [self PlayMP3];
        [self playDrumSound];
        [toggleMP3Button setHidden:NO];
    }
    else
    {
        
        if (buttonarr.count!=0)
        {
            
            for (index=0; index<buttonarr.count; index++)
            {
                [self Change_ButtonArray_Name];
                
                if ([Hexaname isEqualToString:HexaString])
                {
                    [theAudio stop];
                    MP3Sound=[buttonarr objectAtIndex:index];
                    [self PlayMP3];
                    soundplayint=20;
                    [toggleMP3Button setHidden:NO];
                }
            }
            if (soundplayint==10)
            {
                [MP3_Player setVolume: 1.0f];
                [MP3_Player stop];
                [theAudio play];
            }
            
        }
        else
        {
            [toggleMP3Button setHidden:YES];
            [MP3_Player setVolume: 0.0f];
            [MP3_Player stop];
            [theAudio play];
        }
       
        
    }
    
  NSTimer *Timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                  target:self
                                                selector:@selector(EnableCorcle)
                                                userInfo:nil
                                                 repeats:NO];
    NSLog(@"%@",Timer);
}

-(void)EnableCorcle
{
    [HexaButton setUserInteractionEnabled:YES];
    [Swipeimgeview setUserInteractionEnabled:YES];
    [btn_start setUserInteractionEnabled:YES];
}

- (IBAction)Timer_Click:(id)sender
{
    
    [timer invalidate];
      timer = nil;

    if ([UIDevice currentResolution] == UIDevice_iPhoneTallerHiRes)
    {
        if (HexaButton.selected==YES)
        {
            HexaButton.selected=NO;
            
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:1];
            HexaView.frame=CGRectMake(65, -310, 190, 290);
            
            [HexaView setAlpha:50];
            [UIView commitAnimations];
            [HexaView setAlpha:50];
        }
    }
    else
    {
        if (HexaButton.selected==YES)
        {
            HexaButton.selected=NO;
            
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:1];
            HexaView.frame=CGRectMake(65, -310, 190, 250);
            
            [HexaView setAlpha:50];
            [UIView commitAnimations];
            [HexaView setAlpha:50];
            //[self.view addSubview:btn_start];
        }
    }
    if([MP3_Player isPlaying] || [theAudio isPlaying]) {
        [theAudio pause];
        [MP3_Player pause];
    }
    SetTimer *timervw=[[SetTimer alloc]initWithNibName:@"SetTimer" bundle:nil];
   
    [self presentViewController:timervw animated:YES completion:nil];
}

- (IBAction)helpClicked:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Instructions:"
                                                    message:@"Set your intention and take a deep breath.\nSpin the wheel to select a random hexagram.\nPress the face to select a guided meditation.\nPress the drum to begin or pause drumming meditation.\n Press the timer to change meditation length."
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

-(void)PlayMP3
{
    mp3isplay=20;
    NSString *str=[NSString stringWithFormat:@"%@",MP3Sound];
    NSString *path = [[NSBundle mainBundle] pathForResource:str ofType:@"mp3"];
    
    MP3_Player=[[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
    [MP3_Player setDelegate:self];
    [MP3_Player setVolume:1.0f];
    
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    [[AVAudioSession sharedInstance] setActive: YES error: nil];
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    [MP3_Player prepareToPlay];
}

@end