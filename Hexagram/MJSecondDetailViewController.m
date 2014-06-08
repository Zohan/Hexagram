//
//  MJSecondDetailViewController.m
//  MJPopupViewControllerDemo
//
//  Created by Martin Juhasz on 24.06.12.
//  Copyright (c) 2012 martinjuhasz.de. All rights reserved.
//

#import "MJSecondDetailViewController.h"
#import "UIViewController+MJPopupViewController.h"

@interface MJSecondDetailViewController ()
{
    int set;
}
@end

@implementation MJSecondDetailViewController

@synthesize delegate;
@synthesize Peace_Btn,Allowing,TakingAction,DeepWater,Passion,Power,Prosperity,Gentle_Btn,Joy,KeepingStill;


-(void)threadStartAnimating:(id) data
{
    [HUD show:YES];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    ListArr=[[NSMutableArray alloc]initWithObjects:@"Peace",@"Allowing",@"Deep Water",@"Gentle Persistance",@"Joy",@"Passion",@"Power",@"Prosperity",@"Taking Action",@"Keeping Still", nil];
    
    buttonarr=[[NSMutableArray alloc]init];
    buttonarr =[[[NSUserDefaults standardUserDefaults]objectForKey:@"PerchaseArray"]mutableCopy];
    NSLog(@"alray perchase list : %@",buttonarr);
    if (buttonarr==NULL||buttonarr.count==0)
    {
        buttonarr=[[NSMutableArray alloc]init];
    }
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"22" ofType:@"aiff"];
    [PlayMP3 initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
    
    [self removebuttoncolor];
    
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    NSString *str=@"Loading Data";
    HUD.delegate = self;
    HUD.labelText = str;
    HUD.detailsLabelText=@"Please Wait.!!";
    HUD.dimBackground = YES;
    
    [self.view addSubview:HUD];
}

-(void)removebuttoncolor
{
    for (int i=0; i<buttonarr.count; i++)
    {
        if ([[buttonarr objectAtIndex:i]isEqualToString:@"9"])
        {
            [Allowing setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        if ([[buttonarr objectAtIndex:i]isEqualToString:@"2"])
        {
            [DeepWater setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        if ([[buttonarr objectAtIndex:i]isEqualToString:@"3"])
        {
            [Gentle_Btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        if ([[buttonarr objectAtIndex:i]isEqualToString:@"4"])
        {
            [Joy setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        if ([[buttonarr objectAtIndex:i]isEqualToString:@"5"])
        {
            [Passion setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        if ([[buttonarr objectAtIndex:i]isEqualToString:@"6"])
        {
            [Power setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        if ([[buttonarr objectAtIndex:i]isEqualToString:@"7"])
        {
            [Prosperity setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        if ([[buttonarr objectAtIndex:i]isEqualToString:@"8"])
        {
            [TakingAction setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        if ([[buttonarr objectAtIndex:i]isEqualToString:@"10"])
        {
            [KeepingStill setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        
    }

}

- (void)presentPopupViewController:(UIViewController*)popupViewController animationType:(MJPopupViewAnimation)animationType dismissed:(void(^)(void))dismissed
{
    
}
-(void)SoundPlay
{
    [drumPlayer stop];
   // [MainAudio stop];
  // [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationFade];
    
    NSString *soundstr=[NSString stringWithFormat:@"%d",soundNo];
    
    NSMutableArray * nameArray=[[NSMutableArray alloc]initWithObjects:@"none",@"peace",@"deep water",@"gentle persistance",@"joy",@"passion",@"power",@"prosperity",@"taking action",@"keeping still",@"allowing", nil];
    
    int damru1, damru2;
    
    
    // To load the correct drum track
    switch (soundNo) {
        case 1:
            damru1 = 5;
            damru2 = 9;
            break;
        case 2:
            damru1 = 5;
            damru2 = 9;
            break;
        case 3:
            damru1 = 5;
            damru2 = 9;
            break;
        case 4:
            damru1 = 5;
            damru2 = 9;
            break;
        case 5:
            damru1 = 5;
            damru2 = 9;
            break;
        case 6:
            damru1 = 5;
            damru2 = 9;
            break;
        case 7:
            damru1 = 5;
            damru2 = 9;
            break;
        case 8:
            damru1 = 5;
            damru2 = 9;
            break;
        case 9:
            damru1 = 5;
            damru2 = 5;
            break;
        default:
            damru1 = 5;
            damru2 = 9;
            break;
            
    }
    
    NSString *str=[NSString stringWithFormat:@"%@",nameArray[soundNo]];
    NSString *path = [[NSBundle mainBundle] pathForResource:str ofType:@"mp3"];
    [PlayMP3 initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
    PlayMP3.delegate = self;
    
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    [[AVAudioSession sharedInstance] setActive: YES error: nil];
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    //[drumPlayer play];
    [mainView playDrumForMp3:damru1 andNewDamru2:damru2];
    //[PlayMP3 prepareToPlay];
    //[PlayMP3 play];
    [HUD hide:YES];

}


- (IBAction)AllBtn_Click:(id)sender
{
    [PlayMP3 play];
    [PlayMP3 stop];
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating:) toTarget:self withObject:nil];
    if ([sender isEqual:Peace_Btn])
    {
        soundNo=1;
        NSLog(@"Peace_Click");
        [self SoundPlay];
    }
    else if ([sender isEqual:Allowing])
    {
        
        soundNo=9;
        ForPerchase=@"Allowing";
        product_id=[[NSString alloc]initWithFormat:@"%@",@"allowing"];
        NSString *Nsuserdefault =[[NSUserDefaults standardUserDefaults]objectForKey:ForPerchase];
        if ([Nsuserdefault isEqualToString:@"Yes"])
        {
            [self SoundPlay];
        }
        else
        {
            [self Perchase];
        }
    }
    else if ([sender isEqual:DeepWater])
    {
        
        soundNo=2;
        ForPerchase=@"DeepWater";
        product_id=[[NSString alloc]initWithFormat:@"%@",@"deepwater"];
        NSString *Nsuserdefault =[[NSUserDefaults standardUserDefaults]objectForKey:ForPerchase];
        if ([Nsuserdefault isEqualToString:@"Yes"])
        {
            [self SoundPlay];
        }
        else
        {
            [self Perchase];
        }
    }
    else if ([sender isEqual:Gentle_Btn])
    {
        soundNo=3;
        ForPerchase=@"gentlepersistance";
         product_id=[[NSString alloc]initWithFormat:@"%@",@"gentlepersistance"];
        NSString *Nsuserdefault =[[NSUserDefaults standardUserDefaults]objectForKey:ForPerchase];
        if ([Nsuserdefault isEqualToString:@"Yes"])
        {
            [self SoundPlay];
        }
        else
        {
            [self Perchase];
        }
    }
    else if ([sender isEqual:Joy])
    {
        soundNo=4;
        ForPerchase=@"Joy";
        product_id=[[NSString alloc]initWithFormat:@"%@",@"joy"];
        NSString *Nsuserdefault =[[NSUserDefaults standardUserDefaults]objectForKey:ForPerchase];
        if ([Nsuserdefault isEqualToString:@"Yes"])
        {
            [self SoundPlay];
        }
        else
        {
            [self Perchase];
        }
    }
    else if ([sender isEqual:Passion])
    {
        soundNo=5;
         ForPerchase=@"Passion";
        product_id=[[NSString alloc]initWithFormat:@"%@",@"passion"];
        NSString *Nsuserdefault =[[NSUserDefaults standardUserDefaults]objectForKey:ForPerchase];
        if ([Nsuserdefault isEqualToString:@"Yes"])
        {
            [self SoundPlay];
        }
        else
        {
            [self Perchase];
        }
    }
    else if ([sender isEqual:Power])
    {
        soundNo=6;
       ForPerchase=@"Power";
        product_id=[[NSString alloc]initWithFormat:@"%@",@"power"];
        NSString *Nsuserdefault =[[NSUserDefaults standardUserDefaults]objectForKey:ForPerchase];
        if ([Nsuserdefault isEqualToString:@"Yes"])
        {
            [self SoundPlay];
        }
        else
        {
            [self Perchase];
        }
    }
    else if ([sender isEqual:Prosperity])
    {
        soundNo=7;
        ForPerchase=@"Prosperity";
        product_id=[[NSString alloc]initWithFormat:@"%@",@"prosperity"];
        NSString *Nsuserdefault =[[NSUserDefaults standardUserDefaults]objectForKey:ForPerchase];
        if ([Nsuserdefault isEqualToString:@"Yes"])
        {
            [self SoundPlay];
        }
        else
        {
            [self Perchase];
        }
    }
    else if ([sender isEqual:TakingAction])
    {
        soundNo=8;
         ForPerchase=@"TakingAction";
        product_id=[[NSString alloc]initWithFormat:@"%@",@"takingaction"];
        NSString *Nsuserdefault =[[NSUserDefaults standardUserDefaults]objectForKey:ForPerchase];
        if ([Nsuserdefault isEqualToString:@"Yes"])
        {
            [self SoundPlay];
        }
        else
        {
            [self Perchase];
        }
    }
    
    else if ([sender isEqual:KeepingStill])
    {
        soundNo=10;
        ForPerchase=@"Keeping Still";
        product_id=[[NSString alloc]initWithFormat:@"%@",@"keeping_still"];
        NSString *Nsuserdefault =[[NSUserDefaults standardUserDefaults]objectForKey:ForPerchase];
        if ([Nsuserdefault isEqualToString:@"Yes"])
        {
            [self SoundPlay];
        }
        else
        {
            [self Perchase];
        }
    }
}

-(void)Perchase
{
    if ([SKPaymentQueue canMakePayments])
    {
         SKProductsRequest *request = [[SKProductsRequest alloc] initWithProductIdentifiers:[NSSet setWithObject:product_id]];
        request.delegate = self;
        [request start];
    }
    else
    {
        UIAlertView *tmp = [[UIAlertView alloc]
                            initWithTitle:@"Prohibited"
                            message:@"Parental Control is enabled, cannot make a purchase!"
                            delegate:nil
                            cancelButtonTitle:nil
                            otherButtonTitles:@"Ok", nil];
        [tmp show];
    }
}

//inuf perchase
-(void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions
{
    for (SKPaymentTransaction *transaction in transactions)
    {
        UIAlertView *tmp = [[UIAlertView alloc]
                            initWithTitle:@"Thanks you"
                            message:@"purchase succesfully"
                            delegate:nil
                            cancelButtonTitle:nil
                            otherButtonTitles:@"Ok", nil];
        
       
        switch (transaction.transactionState)
        {
                 [HUD hide:YES];
            case SKPaymentTransactionStatePurchasing:
                break;
                
            case SKPaymentTransactionStatePurchased:
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                 [tmp show];
                
                [[NSUserDefaults standardUserDefaults]setObject:@"Yes" forKey:ForPerchase];
                [buttonarr addObject:[NSString stringWithFormat:@"%d",soundNo]];
                [[NSUserDefaults standardUserDefaults]setObject:buttonarr forKey:@"PerchaseArray"];
                
                [self removebuttoncolor];
                
                break;
                
                
            case SKPaymentTransactionStateRestored:
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                break;
                
            case SKPaymentTransactionStateFailed:
                
                if (transaction.error.code != SKErrorPaymentCancelled)
                {
                    
                    UIAlertView *tmp2 = [[UIAlertView alloc]
                                        initWithTitle:@"Error!"
                                        message:@"Please Try Again!"
                                        delegate:nil
                                        cancelButtonTitle:nil
                                        otherButtonTitles:@"Ok", nil];
                    [tmp2 show];
                }
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                break;
                
            default:
                break;
        }
    }
}
- (void)paymentQueueRestoreCompletedTransactionsFinished:(SKPaymentQueue *)queue
{
     [HUD hide:YES];
    NSMutableArray *purchasedItemIDs = [[NSMutableArray alloc] init];
    
    
    for (SKPaymentTransaction *transaction in queue.transactions)
    {
        NSString *productID = transaction.payment.productIdentifier;
        [purchasedItemIDs addObject:productID];
    }
}
-(void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response
{
     //SKProduct *validProduct = nil;
    int count = [response.products count];
    
    NSLog(@"Count===%u",[response.products count]);
     [HUD hide:YES];
    if (count>0)
    {
        //   validProduct = [response.products objectAtIndex:0];
        SKPayment *payment;
        // SKPayment *payment=[SKPayment paymentWithProduct:[response.products objectAtIndex:0]];
        payment = [SKPayment paymentWithProductIdentifier:product_id];
        [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
        [[SKPaymentQueue defaultQueue] addPayment:payment];
    }
    else
    {
        //  [indicator stopAnimating];
        UIAlertView *tmp = [[UIAlertView alloc]
                            initWithTitle:@"Not Available"
                            message:@"No products to purchase"
                            delegate:nil
                            cancelButtonTitle:nil
                            otherButtonTitles:@"Ok", nil];
        [tmp show];
    }
}

-(void)assignAudioPlayer:(AVAudioPlayer *) avPlayer
{
    PlayMP3 = avPlayer;
}

-(void)assignDrumPlayer:(AVAudioPlayer *) avPlayer
{
    drumPlayer = avPlayer;
}

-(void)assignMainView:(mainview *)mainViewToAssign
{
    mainView = mainViewToAssign;
}

-(void)requestDidFinish:(SKRequest *)request
{
    
}

-(void)request:(SKRequest *)request didFailWithError:(NSError *)error
{
     [HUD hide:YES];
    NSLog(@"Failed to connect with error: %@", [error localizedDescription]);
}
//end innuf perchase here
@end
