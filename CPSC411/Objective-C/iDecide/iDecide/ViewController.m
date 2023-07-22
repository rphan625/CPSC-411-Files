//
//  ViewController.m
//  iDecide
//
//  Created by csuftitan on 8/26/22.
//

#import "ViewController.h"

@interface ViewController () {
    UILabel* decisionText;
}

@property (strong, nonatomic) IBOutlet UILabel *decisionText;



@end

@implementation ViewController

@synthesize decisionText=decisionText;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


#pragma mark - Action Items

- (IBAction)buttonPressed:(id)sender {
    NSLog(@"Button was pressed");
    NSString* text;
    NSArray *textArray = @[@"Try Again!", @"You will be fine!", @"As I see it.", @"Ask again later!", @"Most likely.", @"Don't count on it.", @"My reply is no!", @"My sources say no."];
    NSUInteger randomIndex = arc4random() % [textArray count];
    text = [textArray objectAtIndex:randomIndex];
    decisionText.text = text;
}


@end
