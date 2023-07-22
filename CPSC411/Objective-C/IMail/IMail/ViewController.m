//
//  ViewController.m
//  InstaEmail
//
//  Created by William McCarthy on 19/7/2022.
//

#import "ViewController.h"

@implementation ViewController

@synthesize emailPicker=emailPicker_;
@synthesize notesField=notesField_;


- (void)viewDidLoad {
  [super viewDidLoad];
  activities_ = [[NSArray alloc] initWithObjects:@"sleeping", @"eating", @"working",
                 @"thinking", @"crying", @"begging",
                 @"leaving", @"shopping", @"writing",
                 @"reading", @"coding", @"philosophizing",
                 nil];
  feelings_ = [[NSArray alloc] initWithObjects:@"awesome", @"sad", @"happy",
               @"ambivalent", @"inspired", @"creative",
               @"nauseous", @"psyched", @"confused",
               @"hopeful", @"anxious", @"logical",
               nil];
  // Do any additional setup after loading the view.
}

#pragma mark -
#pragma mark Picker Datasource Protocol

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *) pickerView {
  return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
  return [(component == 0 ? activities_ : feelings_) count];
}

#pragma mark -
#pragma mark Picker Delegate Protocol

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
  return [(component == 0 ? activities_ : feelings_) objectAtIndex:row];
  return nil;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponenet:(NSInteger)component {
  return [(component == 0 ? activities_ : feelings_) count];
}

#pragma mark -
#pragma mark Actions

- (IBAction) sendButtonTapped: (id)sender {
  NSLog(@"Email button pressed!");

  NSString* theMessage = [NSString stringWithFormat:
                          @"%@ I'm %@ and feeling %@ about it. Just letting you know!",
                          notesField_.text ? notesField_.text : @"",
                          [activities_ objectAtIndex:[emailPicker_ selectedRowInComponent:0]],
                          [feelings_ objectAtIndex:[emailPicker_ selectedRowInComponent:1]]];
  NSLog(@"%@", theMessage);
  [self sendEmail:theMessage];
}

-(void) sendEmail: (NSString*)msg {
  if ([MFMailComposeViewController canSendMail]) {
    MFMailComposeViewController* ctrl = [[MFMailComposeViewController alloc] init];
    ctrl.mailComposeDelegate = self;
    [ctrl setToRecipients:@[@"willandmei@gmail.com"]];
    [ctrl setCcRecipients:nil];
    [ctrl setBccRecipients:nil];
    [ctrl setSubject:@"Hello, Mei!"];
    [ctrl setMessageBody:msg isHTML:NO];
//    [self presentModalViewController:ctrl animated:YES];
    
    [self presentModalViewController:ctrl animated:YES];
//    [ctrl release];
  } else {
    NSLog(@"%@", @"Sorry, you need to setup mail first!");
  }
}

-(IBAction) textFieldDoneEditing: (id) sender {
  [sender resignFirstResponder];
}

#pragma mark -
#pragma mark Mail composer delegate method

-(void)mailComposeController:(MFMailComposeViewController*) controller
         didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
  [self dismissModalViewControllerAnimated:YES];
}

- (void) dealloc {
//  [emailPicker_ release];    // ARC handles this now
//  [activities_ release];
//  [feelings_ release];
//  [notesField_ release];
//  [super dealloc];
}


@end
