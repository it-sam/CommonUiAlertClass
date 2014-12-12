//
//  MyAlertView.m
//  
//
//  Created by shyam parmar on 12/1/14.
//  Copyright (c) 2014 shyam parmar. All rights reserved.
//

#import "MyAlertView.h"

@implementation MyAlertView
@synthesize delegate;
@synthesize controller;
@synthesize Tag=_Tag;
@synthesize cancelButtonIndex=_cancelButtonIndex;

-(UIAlertAction *)actionWithTitle:(NSString *)aStrTitle
{
    UIAlertAction* aAlertAction = [UIAlertAction actionWithTitle:aStrTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        if([self.delegate respondsToSelector:@selector(myAlertView:clickedButtonAtIndex:)])
        {
            UIAlertController *aAlert=(UIAlertController *)self.controller;
            NSInteger index=[[aAlert actions]indexOfObject:action];
            [self.delegate myAlertView:self clickedButtonAtIndex:index];
        }
        else if([self.delegate respondsToSelector:@selector(myAlertViewWithTag:CancelButtonTag:clickedButtonAtIndex:)])
        {
            UIAlertController *aAlert=(UIAlertController *)self.controller;
            NSInteger index=[[aAlert actions]indexOfObject:action];
            [self.delegate myAlertViewWithTag:self.Tag CancelButtonTag:[self cancelButtonIndex] clickedButtonAtIndex:index];
        }
    }];

    return aAlertAction;
}
-(UIAlertAction *)CancelActionWithTitle:(NSString *)aStrTitle
{
    UIAlertAction* aAlertAction = [UIAlertAction actionWithTitle:aStrTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * action){
        if([self.delegate respondsToSelector:@selector(myAlertView:clickedButtonAtIndex:)])
        {
            UIAlertController *aAlert=(UIAlertController *)self.controller;
            NSInteger index=[[aAlert actions]indexOfObject:action];
            [self.delegate myAlertView:self clickedButtonAtIndex:index];
        }
        else if([self.delegate respondsToSelector:@selector(myAlertViewWithTag:CancelButtonTag:clickedButtonAtIndex:)])
        {
            UIAlertController *aAlert=(UIAlertController *)self.controller;
            NSInteger index=[[aAlert actions]indexOfObject:action];
            [self.delegate myAlertViewWithTag:self.Tag CancelButtonTag:[self cancelButtonIndex] clickedButtonAtIndex:index];
        }
    }];
    
    return aAlertAction;
}

-(void)setTag:(NSInteger)aTag
{
      if(![UIAlertController class])
    {
        UIAlertView *alert=(UIAlertView *)self.controller;
        if(alert)alert.tag=aTag;
    }
    _Tag=aTag;
}
-(void)setCancelButtonIndex:(NSInteger)aCancelButtonIndex
{
    if(![UIAlertController class])
    {
        UIAlertView *alert=(UIAlertView *)self.controller;
        if(alert)alert.cancelButtonIndex=aCancelButtonIndex;
    }
    
    _cancelButtonIndex=aCancelButtonIndex;
}


-(instancetype)initWithTitle:(NSString *)aStrTitle message:(NSString *)message delegate:(id)adelegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles,...{
        if([UIAlertController class])
    {
        
        // use UIAlertController
        UIAlertController *aAlertControll= [UIAlertController
                                   alertControllerWithTitle:aStrTitle == nil ? @"": aStrTitle
                                   message:message
                                   preferredStyle:UIAlertControllerStyleAlert];

        if(cancelButtonTitle!=nil)[aAlertControll addAction:[self CancelActionWithTitle:cancelButtonTitle]];

        if(otherButtonTitles!=nil)[aAlertControll addAction:[self actionWithTitle:otherButtonTitles]];

        
        
        self.controller=aAlertControll;
        self.delegate=adelegate;
    }
    else
    {
        // use UIAlertView
        UIAlertView* dialog = [[UIAlertView alloc] initWithTitle:aStrTitle
                                                         message:message
                                                        delegate:adelegate
                                               cancelButtonTitle:cancelButtonTitle
                                               otherButtonTitles:otherButtonTitles,nil];
       
        dialog.alertViewStyle = UIAlertViewStyleDefault;
        dialog.delegate=adelegate;
        self.controller=dialog;
        
           }
    
    if (self && otherButtonTitles!=nil) {
        va_list args;
        va_start(args, otherButtonTitles);
        
        NSString* buttonTitle;
        while ((buttonTitle = va_arg(args, NSString *))) {
            [self addButtonWithTitle:buttonTitle];
        }
        
        
    }

    
    self.cancelButtonIndex=0;
    
    return self;
    

}
-(void)show
{
    if([UIAlertController class])
    {
        UIAlertController *alert=(UIAlertController *)self.controller;
        UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
        [rootViewController presentViewController:alert animated: YES completion: nil];
    }
    else
    {
        UIAlertView *alert=(UIAlertView*)self.controller;
        [alert show];
    }
}
-(BOOL)isVisible
{
    if([UIAlertController class])
    {
         UIAlertController *alert=(UIAlertController *)self.controller;
        if(alert) if([alert.view superview]) return true;
    }
    else
    {
        UIAlertView *alert=(UIAlertView*)self.controller;
        
        if(alert)return [alert isVisible];
    }
    return NO;
}
-(void)addButtonWithTitle:(NSString *)aStrButtonTitle
{
    if([UIAlertController class])
    {
        UIAlertController *alert=(UIAlertController *)self.controller;
        if(alert)[alert addAction:[self actionWithTitle:aStrButtonTitle]];
    }
    else
    {
        UIAlertView *alert=(UIAlertView*)self.controller;
        if(alert)[alert addButtonWithTitle:aStrButtonTitle];
    }

}

@end
