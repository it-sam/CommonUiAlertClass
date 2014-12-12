CommonUiAlertClass
==================

Common UiAlertClass that support all iOS6 iOS7 iOS8

****************************
//Old code
  UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"FreeWare" message:@"Welcome to Common class" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];

//New code
 MyAlertView *alert=[[MyAlertView alloc]initWithTitle:@"FreeWare" message:@"Welcome to Common class" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
*********************************

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