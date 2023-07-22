//
//  ViewController.h
//  InstaEmail
//
//  Created by William McCarthy on 19/7/2022.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface ViewController : UIViewController
<UIPickerViewDataSource, UIPickerViewDelegate, MFMailComposeViewControllerDelegate> {
  UIPickerView* emailPicker_;
  NSArray* activities_;
  NSArray* feelings_;
  UITextField* notesField_;
}

@property (nonatomic, retain) IBOutlet UIPickerView* emailPicker;
@property (nonatomic, retain) IBOutlet UITextField* notesField;

-(void) sendEmail: (NSString*)msg;

-(IBAction) sendButtonTapped: (id)sender;

-(IBAction) textFieldDoneEditing: (id) sender;

@end

