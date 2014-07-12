//
//  SetTimer.m
//  Hexagram
//
//  Created by Creative Rohit on 4/8/14.
//  Copyright (c) 2014 Creative Rohit. All rights reserved.
//

#import "SetTimer.h"
#import "mainview.h"

@interface SetTimer ()

@end

@implementation SetTimer
@synthesize Timer_LBL,picker;

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
    
    Mint=[[NSMutableArray alloc]init];
    for (int i=1; i<61; i++)
    {
        [Mint addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    NSLog(@"hello===%@",Mint);
    CountTimer=20;
    [picker selectRow:9 inComponent:0 animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component==0)
    {
        return 60;
    }
    else if(component==1)
    {
        return 60;
    }
    return 2;
}
// tell the picker the title for a given component
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    if(component==0)
    {
        NSString *str=[NSString stringWithFormat:@"%@",[Mint objectAtIndex:row%60]];
        return str;
    }else if(component == 1)
    {
        return [NSString stringWithFormat:@"%d", (row%60)];
    }
    return @"10";
}

// tell the picker the width of each row for a given component
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    switch (component)
    {
        case 0:
            return 100;
            break;
        case 1:
            return 100;
            break;
        default:
            return 60;
            break;
    }
}
- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSInteger row0 = [pickerView selectedRowInComponent:0];
    NSInteger row1 = [pickerView selectedRowInComponent:1];
    
    
   MaintimeSTR=[NSString stringWithFormat:@"%@:%02d",[Mint objectAtIndex:row0%60],(row1%60)];
    NSLog(@"hello==%@",MaintimeSTR);
    
    Timer_LBL.text=MaintimeSTR;
    
    MaintimeSTR=[[NSString alloc]initWithFormat:@"%@",MaintimeSTR];

}
    

- (IBAction)Back_Click:(id)sender
{
    if (MaintimeSTR.length==0 || MaintimeSTR==nil)
    {
        MaintimeSTR=@"10:00";
    }
    
    [self dismissViewControllerAnimated:self.view completion:nil];
}

@end
