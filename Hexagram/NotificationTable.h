//
//  NotificationTable.h
//  Hexagram
//
//  Created by Creative Rohit on 3/31/14.
//  Copyright (c) 2014 Creative Rohit. All rights reserved.
//

#import <UIKit/UIKit.h>
int note;
NSString *userInfoCurrent;
@interface NotificationTable : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *Main_Table;
- (IBAction)Back_Ckick:(id)sender;
- (IBAction)AddTime_click:(id)sender;

@end
