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

#define DEGREES_TO_RADIANS(angle) (angle / 180.0 * M_PI)
#define IS_PREMIUM_VERSION 0

@interface mainview ()<MJSecondPopupDelegate>
{
}

@end

@implementation mainview
@synthesize image1,Timer_Btn;
@synthesize MainColorPlt2,MainColorPlt1,HexaButton,Lable_2,Lable_3,ColorPatern1,ColorPatern2;
@synthesize ColorImg1, Swipeimage,Over_LBL;
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Hide Battery icon
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:YES];
    
    setfirsttimetimer=20;
    CONTINUTIMES=0;
    autoplayMP3 = FALSE;
    Mainarr=[[NSMutableArray alloc]initWithObjects:@"Taking Action",@"Allowing",@"Challenges",@"Innocence",@"Inevitability",@"Confrontation",@"Rallying",@"Union",@"Preparing",@"Cautious Action",@"Peace",@"Chaos",@"Fellowship",@"Prosperity",@"Humility",@"Energy Rising",@"Following",@"Healing",@"Thriving",@"Observation",@"Clearing Paths",@"Beauty",@"Release",@"Restoration",@"Presence",@"Focused Intention",@"Nourishment",@"Pressure",@"Deep Water",@"Passion",@"Attraction",@"Long Lasting", @"Restraint",@"Increasing Energy",@"Success",@"Dark Times",@"Family",@"Opposition",@"Obstacles",@"Freedom",@"Self-Discipline",@"Good Fortune",@"Determination",@"Over Indulgence",@"Unified Force",@"Growth",@"Emptiness",@"Feeding the Soul", @"Revolution",@"Alchemy",@"Power",@"Keeping Still",@"Steady Progress",@"Impulsiveness",@"Abundance",@"Restlessness",@"Gentle Persistance",@"Joy",@"Dissolving",@"Boundaries",@"Wisdom",@"Details",@"After Victory",@"Before Victory",nil];
    
    purchaseableTrackArray =[[NSMutableArray alloc]initWithObjects:@"none",@"peace",@"deep water",@"gentle persistance",@"joy",@"passion",@"power",@"prosperity",@"taking action",@"keeping still",@"allowing", nil];
    
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
        
        UIImageView *image_start = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BaguaWheel"]];
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
        
        UIImageView *image_start = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BaguaWheel"]];
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
    
    if([buttonarr indexOfObject:@"1"] > 12) {
        [buttonarr addObject:@"1"];
    }
    
    [self addPlayPauseButton];
    [self addHelpButton];
    //[self addHexaBtn];
    [self addMP3IndicatorButton];
    MaintimeSTR=@"10:00";
    
    if (show==20)
    {
        [self.view makeToast:@"Spin the wheel, then tap the drum to begin meditation."
                    duration:3.0
                    position:@"center"
                       image:[UIImage imageNamed:@"640x1136Fqce"]];
    }
    [bagua setUserInteractionEnabled:YES];
    
    btn_start.selected=YES;
    [self resetTime];
}

// Called when Purchase list menu closes
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
        CountTimer=YES;
        //Weird timing bug
        int tt=[MaintimeSTR intValue]*60;
        
        [Timer_Btn setTitle:MaintimeSTR forState:UIControlStateNormal];
        
        databaseDate = [NSDate dateWithTimeIntervalSinceNow:tt];
        //[self setTimeFromDisplay];
        [self resetTime];
        CountTimer = NO;
    }
}

-(void) addPlayPauseButton {
    playDrumButton = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    playDrumButton.frame = CGRectMake(2*width/3, 2*height/3, 80.0, 80.0);
    UIImage *drumImage=[UIImage imageNamed:@"Drum_Grey.png"];
    [playDrumButton setTitle:@"" forState:UIControlStateNormal];
    [playDrumButton setBackgroundImage:drumImage forState:UIControlStateNormal];
    // [btn_start setTitle:@"start" forState:UIControlStateNormal];
    [playDrumButton addTarget:self action:@selector(Btn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:playDrumButton];
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

-(void)Swipewheel
{
    soundgapint=20;
    
    buttonarr=[[NSMutableArray alloc]init];
    buttonarr =[[[NSUserDefaults standardUserDefaults]objectForKey:@"PerchaseArray"]mutableCopy];
    
    NSLog(@"alray perchase list : %@",buttonarr);
    firstcall=20;
    
    CountTimer=NO;
    playhexasound=0;
    
    [btn_start setUserInteractionEnabled:NO];
    [HexaButton setUserInteractionEnabled:NO];
    [Swipeimgeview setUserInteractionEnabled:NO];
    
    [self pauseDrumTrack];
    [self pauseMP3Track];
    [HexaButton setUserInteractionEnabled:NO];
    
    
    [btn_start setUserInteractionEnabled:NO];
    [image1 setHidden:NO];
    [bagua setHidden:NO];
    
    [ColorImg1 setHidden:YES];
    
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
    [theAudio setNumberOfLoops:-1];
    
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    [[AVAudioSession sharedInstance] setActive: YES error: nil];
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    [theAudio prepareToPlay];
    
}

-(void)loadDrumForMp3:(int)newDamru andNewDamru2:(int) newDamru2 {
    damru = newDamru;
    damru2 = newDamru2;
    [self playDrumSound];
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
    [self resetTime];
    
    int value = [self convertHexagramNameToPurchaseTrackID:MP3Sound];
    if([self hasTrackBeenPurchased:value]) {
        autoplayMP3 = TRUE;
        UIImage *imag=[UIImage imageNamed:@"Meditation.png"];
        [toggleMP3Button setTitle:@"" forState:UIControlStateNormal];
        [toggleMP3Button setBackgroundImage:imag forState:UIControlStateNormal];
    }
    
}

- (void) playPauseUnstick
{
    UIImage *drumImage=[UIImage imageNamed:@"Drum.png"];
    [playDrumButton setTitle:@"" forState:UIControlStateNormal];
    [playDrumButton setImage:drumImage forState:UIControlStateNormal];
    UIImage *newDrumImage=[UIImage imageNamed:@"Drum_Grey.png"];
    [playDrumButton setTitle:@"Hello" forState:UIControlStateNormal];
    [playDrumButton setImage:newDrumImage forState:UIControlStateNormal];
}

- (void)Btn
{
    if ([theAudio isPlaying]) {
        [self pauseDrumTrack];
    } else {
        [self playDrumTrack];
    }
}

-(void) setTimeFromDisplay {
    // The +2 here is to compensate for a weird timer bug.
    databaseDate = [NSDate dateWithTimeIntervalSinceNow:timestop+2];
}

-(void) playDrumTrack {
    if(damru > 0 && damru2 > 0) {
        UIImage *drumImage=[UIImage imageNamed:@"Drum.png"];
        [playDrumButton setTitle:@"" forState:UIControlStateNormal];
        [playDrumButton setImage:drumImage forState:UIControlStateNormal];
        [theAudio play];
        CountTimer=YES;
        playhexasound = 20;
        [SoundTimer invalidate];
        SoundTimer=nil;
        SoundTimer=[[NSTimer alloc]init];
        SoundTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                  target:self
                                                selector:@selector(updateTimeLeft)
                                                userInfo:nil
                                                 repeats:YES];
        [self setTimeFromDisplay];
    
        if(autoplayMP3) {
            [MP3_Player play];
            autoplayMP3 = false;
        }
    }
}

-(void) pauseDrumTrack {
    UIImage *drumImage=[UIImage imageNamed:@"Drum_Grey.png"];
    [playDrumButton setTitle:@"" forState:UIControlStateNormal];
    [playDrumButton setImage:drumImage forState:UIControlStateNormal];
    [theAudio pause];
    if([MP3_Player isPlaying]) {
        [self pauseMP3Track];
    }
    CountTimer=NO;
    playhexasound=0;
    [SoundTimer invalidate];
    SoundTimer=nil;
    NSTimeInterval remainingSec = [databaseDate timeIntervalSinceNow];
    NSInteger remainder = ((NSInteger)remainingSec)% 7200;
    
    timestop=remainder;

}

-(void) toggleMP3Track {
    if([MP3_Player isPlaying]) {
        [self pauseMP3Track];
    } else {
        [self playMP3Track];
    }
}

-(void) playMP3Track {
    int value = [self convertHexagramNameToPurchaseTrackID:MP3Sound];
    if (![MP3_Player isPlaying] && [self hasTrackBeenPurchased:value]) {
        UIImage *imag=[UIImage imageNamed:@"Meditation.png"];
        [toggleMP3Button setTitle:@"" forState:UIControlStateNormal];
        [toggleMP3Button setBackgroundImage:imag forState:UIControlStateNormal];
        [MP3_Player play];
        [self playDrumTrack];
    } else {
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
}

-(void) pauseMP3Track {
    if([MP3_Player isPlaying]) {
        UIImage *imag=[UIImage imageNamed:@"Meditation_grey.png"];
        [toggleMP3Button setTitle:@"" forState:UIControlStateNormal];
        [toggleMP3Button setBackgroundImage:imag forState:UIControlStateNormal];
        [MP3_Player pause];
        [self pauseDrumTrack];
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
    
    NSLog(@"Transform: %f", atan2(bagua.transform.b, bagua.transform.a));
    
    bagua.transform = CGAffineTransformMakeRotation(M_PI * atan2(bagua.transform.b, bagua.transform.a));
   
    [theAudio stop];
    [MP3_Player stop];
    [bagua setUserInteractionEnabled:YES];
    
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
    //[ColorImg1 setHidden:NO];
    
    int randomElement = rand()%8+1;
    MainPattern1= [NSString stringWithFormat:@"%dBtn.png",randomElement];
    UIImage *ptrnimg2=[UIImage imageNamed:MainPattern1];
    ColorPatern1.image=ptrnimg2;
   
    MainPattern2= [NSString stringWithFormat:@"%dBtn.png",[self getBottomBaguaElement]];
    UIImage *ptnimg11=[UIImage imageNamed:MainPattern2];
    ColorPatern2.image=ptnimg11;

    [self levelBagua];
    [self setTopElement:randomElement];
    
    
    [self MainLable];
    [self resetTime];
}

-(void)resetTime {
    // Weird timer bug
    int tt=[MaintimeSTR intValue]*60;
    databaseDate = [NSDate dateWithTimeIntervalSinceNow:tt];
    NSTimeInterval remainingSec = tt;
    timestop = tt;

    NSInteger remainder = ((NSInteger)remainingSec)% 7200;
    NSInteger minutess = remainder / 60;
    NSInteger secondss = remainder % 60;
    
    [Timer_Btn setTitle:[NSString stringWithFormat:@"%02d:%02d",minutess,secondss] forState:UIControlStateNormal];
    
}

-(void)setTopElement:(int) element {
    NSString * topImageName = [NSString stringWithFormat:@"Color1-%d.png",element];
    UIImage *ptnimg11=[UIImage imageNamed:topImageName];
    ColorImg1.image=ptnimg11;
    [self.view bringSubviewToFront:ColorImg1];
    [self.view bringSubviewToFront:btn_start];
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
    
    NSString *str1=[NSString stringWithFormat:@"%@%@",MainPattern1,@"_Plate"];
    NSString *str2=[NSString stringWithFormat:@"%@%@",MainPattern2,@"_Plate"];

    MainColorPlt1.image=[UIImage imageNamed:str1];
    MainColorPlt2.image=[UIImage imageNamed:str2];
    
  
    damru=[MainPattern2 intValue];
    damru2=[MainPattern1 intValue];
    stopplay=0;
    
    [self playDrumSound];
    NSLog(@"damru play==%d",damru);
    //CountTimer=NO;
    //playhexasound=20;
    NSLog(@"TIMES++++%d",timestop);
    databaseDate = [NSDate dateWithTimeIntervalSinceNow:timestop];
    
    
    Hexaname=[Mainarr objectAtIndex:set];
    [self CHK_MP3_Sound];
    [MP3_Player pause];
    [theAudio pause];
    CountTimer = 20;
    
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
    if(CountTimer == YES || CountTimer == 0) {
        NSTimeInterval remainingSec = [databaseDate timeIntervalSinceNow];
        NSInteger remainder = ((NSInteger)remainingSec)% 7200;
        NSInteger minutess = remainder / 60;
        NSInteger secondss = remainder % 60;
        
        timestop=remainder;
        
        [Timer_Btn setTitle:[NSString stringWithFormat:@"%02d:%02d",minutess,secondss] forState:UIControlStateNormal];
        NSLog(@"hello===%@",Timer_Btn.titleLabel.text);
        
        if ([Timer_Btn.titleLabel.text isEqualToString:@"00:00" ])
        {
            [self pauseDrumTrack];
            [self pauseMP3Track];
            [self resetTime];
            firsttimetimer = 0;
            setfirsttimetimer = 20;
            [SoundTimer invalidate];
        }
    } else {
        //NSTimeInterval remainingSec = [databaseDate timeIntervalSinceNow];
        //databaseDate = [NSDate dateWithTimeIntervalSinceNow:remainin]
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

-(void)showHexaview {
    
}

-(void)hideHexaview {
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
        [ColorImg1 setHidden:YES];
        bagua.layer.transform = CATransform3DRotate(bagua.layer.transform, DEGREES_TO_RADIANS(angle), .0, .0, 1.0);
    }
    
    // 1 to determine if the user imparted any decent amount of velocity after leaving - indicating a spin intent
    if(abs(angle) > 20 && [bagua isUserInteractionEnabled]) {
        [self Swipewheel];
        [bagua setUserInteractionEnabled:NO];
    }

}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint curPoint  = [[touches anyObject] locationInView:bagua];
    CGPoint prevPoint = [[touches anyObject] previousLocationInView:bagua];
    
    // calculate rotation angle between two points
    CGFloat angle = angleBetweenLinesInDegrees(bagua.center, prevPoint, bagua.center, curPoint);
    
    [self getBottomBaguaElement];
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
    CountTimer=NO;
    playhexasound=0;
    
    show=10;
    //NotificationTable *add=[[NotificationTable alloc]initWithNibName:@"NotificationTable" bundle:nil];
    
    //[self .navigationController pushViewController:add animated:YES];
    
}

- (IBAction)Purchase_BtnClick:(id)sender
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
    [self pauseDrumTrack];
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
    //[secondDetailViewController dismissPopupViewControllerWithanimationType:MJPopupViewAnimationFade];
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
    
    [self pauseDrumTrack];
    [self pauseMP3Track];
    CountTimer=NO;
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
    [self.view bringSubviewToFront:HexaView];
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
    
  
    //[self updateTimeLeft];
    
    damru=[MainPattern2 intValue];
    damru2=[MainPattern1 intValue];
    stopplay=0;
    CountTimer=YES;
    [self loadDrumForMp3:damru2 andNewDamru2:damru];
    //playhexasound=20;
    
    [self resetTime];
    //[self playDrumSound];
    
    Hexaname=[Mainarr objectAtIndex:indexPath.row];
    [self CHK_MP3_Sound];
    [self hideHexaview];
    
    [MPNowPlayingInfoCenter defaultCenter];
    NSLog(@"tabledamru==%d",damru);
}

-(int)convertHexagramNameToPurchaseTrackID:(NSString*) trackName{

    int trackList = [purchaseableTrackArray indexOfObject:trackName];
    return trackList;
}

-(bool)hasTrackBeenPurchased:(int)trackNumber{
    NSString * trackStringFromInt = [NSString stringWithFormat:@"%d", trackNumber];
    int indexOfTrack = 100;
    indexOfTrack = [buttonarr indexOfObject:trackStringFromInt];
    if((indexOfTrack > 0 && indexOfTrack < 12) || [Hexaname isEqualToString:@"Peace"] || IS_PREMIUM_VERSION) {
        return YES;
    } else return NO;
}

- (BOOL) isPremiumVersion {
    return IS_PREMIUM_VERSION;
}

-(void)CHK_MP3_Sound
{
    int soundplayint=10;
    MP3Sound=[Hexaname lowercaseString];
    int value = [self convertHexagramNameToPurchaseTrackID:MP3Sound];
    [self hasTrackBeenPurchased:value];
    if ([purchaseableTrackArray containsObject:MP3Sound]) {
        [theAudio stop];
        MP3Sound=[Hexaname lowercaseString];
        [self PlayMP3];
        soundplayint=20;
        [MP3_Player setVolume: 1.0f];
        [toggleMP3Button setHidden:NO];
    }
    else
    {
        [toggleMP3Button setHidden:YES];
        [MP3_Player setVolume: 0.0f];
        [MP3_Player stop];
        //[theAudio play];
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
    [self pauseDrumTrack];
    [self pauseMP3Track];
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

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
