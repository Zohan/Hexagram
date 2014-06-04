//
//  SetTimer.h
//  Hexagram
//
//  Created by Creative Rohit on 4/8/14.
//  Copyright (c) 2014 Creative Rohit. All rights reserved.
//

#import <UIKit/UIKit.h>
NSString *MaintimeSTR;
@interface SetTimer : UIViewController
{
    NSMutableArray *Mint;
}
@property (strong, nonatomic) IBOutlet UILabel *Timer_LBL;
- (IBAction)Back_Click:(id)sender;
@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@end
