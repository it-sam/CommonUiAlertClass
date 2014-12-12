//
//  ViewController.m
//  UiCommonAlert-Demo
//
//  Created by Shyam Parmar on 13/12/14.
//  Copyright (c) 2014 FreeWare. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self performSelector:@selector(showAlert) withObject:nil afterDelay:0.2f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Show Alert
-(void)showAlert
{
    //Define Alert
    MyAlertView *alert=[[MyAlertView alloc]initWithTitle:@"FreeWare" message:@"Welcome to Common class" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
    
    //set alert tag
    alert.Tag=7;
    //Show alert
    [alert show];
    
}


#pragma mark Alert Delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self myAlertViewWithTag:alertView.tag CancelButtonTag:alertView.cancelButtonIndex clickedButtonAtIndex:buttonIndex];
}

-(void)myAlertViewWithTag:(NSInteger)aTag CancelButtonTag:(NSInteger)aCancelTag clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"my alert tag=%ld and button index=%ld",(long)aTag,(long)buttonIndex);
}

@end
