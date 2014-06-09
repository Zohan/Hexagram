//
//  NotificationTable.m
//  Hexagram
//
//  Created by Creative Rohit on 3/31/14.
//  Copyright (c) 2014 Creative Rohit. All rights reserved.
//

#import "NotificationTable.h"
#import "mainview.h"
#import "AddTimeNotification.h"
#import "UIDevice+Resolutions.h"
@interface NotificationTable ()

@end

@implementation NotificationTable
@synthesize Main_Table;
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
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reloadTable)
                                                 name:@"reloadData"
                                               object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[[UIApplication sharedApplication] scheduledLocalNotifications] count];
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
    
    // Get list of local notifications
    NSArray *localNotifications = [[UIApplication sharedApplication] scheduledLocalNotifications];
    UILocalNotification *localNotification = [localNotifications objectAtIndex:indexPath.row];
    
    // Display notification info
    [cell.textLabel setText:localNotification.alertBody];
    cell.textLabel.textColor=[UIColor whiteColor];
    
    
    NSString *dateStr = [localNotification.fireDate description];
    dateStr=[dateStr substringToIndex:dateStr.length -6];
    NSDateFormatter *dtF = [[NSDateFormatter alloc] init];
    [dtF setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    NSDate *d = [dtF dateFromString:dateStr];
    
    NSDateFormatter *dateFormatStr = [[NSDateFormatter alloc] init];
    [dateFormatStr setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    NSString *strDate = [dateFormatStr stringFromDate:d];
    NSLog(@"%@",strDate);
        
    [cell.detailTextLabel setText:[localNotification.fireDate description]];
    cell.detailTextLabel.textColor=[UIColor whiteColor];
    
    [cell setBackgroundColor:[UIColor clearColor]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"ketan" object:nil];

    userInfoCurrent=[[NSString alloc]init];
    int a=0;
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *eventArray = [app scheduledLocalNotifications];
    for (int i=0; i<[eventArray count]; i++)
    {
        UILocalNotification* oneEvent = [eventArray objectAtIndex:i];
     //   NSString *userInfoCurrent = oneEvent.alertBody;
//        NSString *uid=[NSString stringWithFormat:@"%@",[userInfoCurrent valueForKey:@"uid"]];
        if (a==indexPath.row)
        {
            //Cancelling local notification
            //[app cancelLocalNotification:oneEvent];
            userInfoCurrent = oneEvent.alertBody;
            break;
        }
        a++;
    }
    
    
    if ([UIDevice currentResolution] == UIDevice_iPhoneTallerHiRes)
    {
        AddTimeNotification *adds=[[AddTimeNotification alloc]initWithNibName:@"AddTimeNotification" bundle:nil];
        [self.navigationController pushViewController:adds animated:YES];
    }
    else
    {
        AddTimeNotification *adds=[[AddTimeNotification alloc]initWithNibName:@"AddTimeNotification_IPhone3" bundle:nil];
        [self.navigationController pushViewController:adds animated:YES];
    }
    
    
    
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return YES - we will be able to delete all rows
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Perform the real delete action here. Note: you may need to check editing style
    //   if you do not perform delete only.
    NSLog(@"Deleted row.");
    
    int a=0;
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *eventArray = [app scheduledLocalNotifications];
    for (int i=0; i<[eventArray count]; i++)
    {
        UILocalNotification* oneEvent = [eventArray objectAtIndex:i];
        //        NSString *userInfoCurrent = oneEvent.alertBody;
        //        NSString *uid=[NSString stringWithFormat:@"%@",[userInfoCurrent valueForKey:@"uid"]];
        if (a==indexPath.row)
        {
            //Cancelling local notification
            [app cancelLocalNotification:oneEvent];
            break;
        }
        a++;
    }
    
    [self reloadTable];
    
}

- (void)reloadTable
{
    [Main_Table reloadData];
}


- (IBAction)Back_Ckick:(id)sender
{
//    if ([UIDevice currentResolution] == UIDevice_iPhoneTallerHiRes)
//    {
//        mainview *main=[[mainview alloc]initWithNibName:@"mainview" bundle:nil];
//        [self.navigationController popToViewController:main animated:YES];
//    }
//    else
//    {
//        mainview *main=[[mainview alloc]initWithNibName:@"MainView_Iphone3" bundle:nil];
//        [self.navigationController popToViewController:main animated:YES];
//    }
    
    note=20;
    [self .navigationController popViewControllerAnimated:YES];
}

- (IBAction)AddTime_click:(id)sender
{
    
    if ([UIDevice currentResolution] == UIDevice_iPhoneTallerHiRes)
    {
        AddTimeNotification *adds=[[AddTimeNotification alloc]initWithNibName:@"AddTimeNotification" bundle:nil];
        [self.navigationController pushViewController:adds animated:YES];
    }
    else
    {
        AddTimeNotification *adds=[[AddTimeNotification alloc]initWithNibName:@"AddTimeNotification_IPhone3" bundle:nil];
        [self.navigationController pushViewController:adds animated:YES];
    }
    
    
}
@end
