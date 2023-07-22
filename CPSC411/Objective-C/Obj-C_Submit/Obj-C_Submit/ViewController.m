//
//  ViewController.m
//  Obj-C_Submit
//
//  Created by csuftitan on 8/31/22.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UILabel *text;


@end

@implementation ViewController

@synthesize text=text;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
int count = 0;

- (IBAction)buttonPressed:(id)sender {
    count = count + 1;
    NSLog(@"Button was tapped %i", count);
    text.text = (@"Button tapped!");
}

@end
