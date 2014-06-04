//
//  AddTimeNotification.m
//  Hexagram
//
//  Created by Creative Rohit on 3/31/14.
//  Copyright (c) 2014 Creative Rohit. All rights reserved.
//

#import "AddTimeNotification.h"
#import "NotificationTable.h"
#import "UIDevice+Resolutions.h"

@interface AddTimeNotification ()

@end

@implementation AddTimeNotification
@synthesize Textfild,Date_Picker,Save_Btn,Edit_Btn,Cancel_Btn;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    Date_Picker.backgroundColor=[UIColor lightTextColor];
    
    NSLog(@"%@",userInfoCurrent);
   
    if (userInfoCurrent.length!=0)
    {
        Textfild.text=userInfoCurrent;
        
        [Save_Btn setHidden:NO];
        [Cancel_Btn setHidden:YES];
        [Edit_Btn setHidden:NO];
        [Textfild setUserInteractionEnabled:NO];
        [Date_Picker setUserInteractionEnabled:NO];
        
        
    }
    else
    {
        Textfild.text=@"";
        [Save_Btn setHidden:NO];
        [Cancel_Btn setHidden:NO];
        [Edit_Btn setHidden:YES];
        [Textfild setUserInteractionEnabled:YES];
        [Date_Picker setUserInteractionEnabled:YES];
        
    }
   // userInfoCurrent=@"";
    
//     [Date_Picker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [Textfild resignFirstResponder];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [Textfild resignFirstResponder];
    return YES;
}
/*- (void) dateChanged:(id)sender
{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
   /// [dateFormatter setDateStyle:NSDateFormatterLongStyle];
    [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
   // [dateFormatter setTimeStyle:NSDateF];
    NSLog(@"hello===%@",[dateFormatter stringFromDate:Date_Picker.date]);
   
}*/
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)Save_Click:(id)sender
{
    if (Textfild.text.length==0)
    {
        UIAlertView *alt=[[UIAlertView alloc]initWithTitle:nil message:@"Please Enter Detail in Detail box." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alt show];
    }
    else
    {
        NSDate *pickerDate = [Date_Picker date];
        
        UILocalNotification* localNotification = [[UILocalNotification alloc] init];
        localNotification.fireDate = pickerDate;
        localNotification.alertBody = Textfild.text;
        localNotification.alertAction = @"Show me the item";
        // localNotification.
        localNotification.timeZone = [NSTimeZone localTimeZone];
        localNotification.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
        
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
        
        // Request to reload table view data
        [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadData" object:self];
        
        //NotificationTable *not=[[NotificationTable alloc]initWithNibName:@"NotificationTable" bundle:nil];
        [self.navigationController popViewControllerAnimated:YES];
    }
    
    
}

- (IBAction)Cancel_Click:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)Edit_Click:(id)sender
{
  //  userInfoCurrent=[[NSString alloc]init];
    [Textfild setUserInteractionEnabled:YES];
    [Date_Picker setUserInteractionEnabled:YES];

    int a=0;
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *eventArray = [app scheduledLocalNotifications];
    for (int i=0; i<[eventArray count]; i++)
    {
        UILocalNotification* oneEvent = [eventArray objectAtIndex:i];
        NSString *userInfoCurrent2 = oneEvent.alertBody;
        //        NSString *uid=[NSString stringWithFormat:@"%@",[userInfoCurrent valueForKey:@"uid"]];
        if ([userInfoCurrent isEqualToString:userInfoCurrent2])
        {
            //Cancelling local notification
            [app cancelLocalNotification:oneEvent];
            userInfoCurrent = oneEvent.alertBody;
            break;
        }
        a++;
    }
    userInfoCurrent=@"";
}
@end
