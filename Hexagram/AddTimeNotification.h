//
//  AddTimeNotification.h
//  Hexagram
//
//  Created by Creative Rohit on 3/31/14.
//  Copyright (c) 2014 Creative Rohit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddTimeNotification : UIViewController
{
    
}
@property (strong, nonatomic) IBOutlet UITextField *Textfild;

@property (strong, nonatomic) IBOutlet UIDatePicker *Date_Picker;
- (IBAction)Save_Click:(id)sender;
- (IBAction)Cancel_Click:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *Cancel_Btn;
@property (weak, nonatomic) IBOutlet UIButton *Save_Btn;
@property (weak, nonatomic) IBOutlet UIButton *Edit_Btn;
- (IBAction)Edit_Click:(id)sender;
@end
