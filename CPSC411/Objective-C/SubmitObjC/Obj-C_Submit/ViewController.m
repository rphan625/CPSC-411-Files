//
//  ViewController.m
//  SubmitObjC
//
//  Created by William McCarthy on 03/9/2022.
//

//  Modified by Richard Phan on 09/7/2022.

#import "ViewController.h"

@interface ViewController () {
  NSString* labelText;
  BOOL labelShowing;
}

// TODO: add properties to connect to the btn and the lbl
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;
@property (weak, nonatomic) IBOutlet UILabel *TextLabel;

@end

@implementation ViewController

@synthesize submitBtn=submitBtn;
@synthesize TextLabel=TextLabel;
// TODO: add required synthesize statements for the properties created

#pragma mark - Action Items
//          in Swift
// is... // MARK: - Action Items



- (IBAction)btnClicked:(id)sender {

    NSLog(@"Button Pressed!");
    
	// TODO: fill in the code for btnClicked:(id)sender
    if (labelShowing == true) {
        NSLog(@"True");
    }
    else {
        NSLog(@"False");
    }
    labelShowing = !labelShowing;
    [self showLabel];
}

- (void)showLabel {
    // TODO: fill in the code for (void)showLabel
    TextLabel.text = !labelShowing ? TextLabel.text: @"Button Tapped!"; 
}

#pragma mark - Lifecycle Functions

- (void)viewDidLoad {
  [super viewDidLoad];
  labelText = @"Touch the button";

	// TODO: fill in rest of missing assignments (use SubmitSwift for a guide)
	//       look up required examples of objective-C code on the Internet
    self.submitBtn.backgroundColor = [UIColor yellowColor];
    // ...
    self.submitBtn.titleLabel.text = @"Submit";
    // ...
    [submitBtn setTitleColor:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0] forState:UIControlStateNormal];
    // ...
  [[submitBtn layer] setBorderColor:[UIColor darkGrayColor].CGColor];
    // ...
    self.submitBtn.layer.borderWidth = 3.0f;
    // ...
    self.submitBtn.titleLabel.font = [UIFont systemFontOfSize:26.0];
    // ...
    self.submitBtn.layer.cornerRadius = 10;
	// ...
  [submitBtn sizeToFit];
    // ...
  
}


@end
