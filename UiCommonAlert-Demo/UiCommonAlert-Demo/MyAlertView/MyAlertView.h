//
//  MyAlertView.h
//
//
//  Created by shyam parmar on 12/1/14.
//  Copyright (c) 2014 shyam parmar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@protocol myAlertDelegate <NSObject>;
- (void)myAlertView:(id)self clickedButtonAtIndex:(NSInteger)buttonIndex;
-(void)myAlertViewWithTag:(NSInteger)aTag CancelButtonTag:(NSInteger)aCancelTag clickedButtonAtIndex:(NSInteger)buttonIndex;
@end
@interface MyAlertView : NSObject 
{
    
}
@property(nonatomic,strong)id controller;
@property(nonatomic,assign)NSInteger Tag,cancelButtonIndex;
@property(nonatomic,weak)id<myAlertDelegate>delegate;
-(void)show;
-(id)initWithTitle:(NSString *)aStrTitle message:(NSString *)message delegate:(id)adelegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles,...NS_REQUIRES_NIL_TERMINATION;
-(void)addButtonWithTitle:(NSString *)aStrButtonTitle;
-(BOOL)isVisible;

@end
