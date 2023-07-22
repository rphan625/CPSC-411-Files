//
//  DetailViewControl.m
//  DrinksMixer
//
//  Created by csuftitan on 10/3/22.
//

#import "DetailViewControl.h"
#import "DrinkConstants.h"

@interface DetailViewControl ()

@end

@implementation DetailViewControl
@synthesize drink=drink_, drinkName=drinkName_, ingredients=ingredients_, directions=directions_, scrollView=scrollView_;

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // Set up our UI with the provided drink
    
    self.drinkName.text = [self.drink objectForKey:NAME_KEY];
    self.ingredients.text = [self.drink objectForKey:INGREDIENTS_KEY];
    self.directions.text = [self.drink objectForKey:DIRECTIONS_KEY];
//    NSLog(@"%@", self.drinkName.text);
//    NSLog(@"This code should run!");
}
- (void) viewDidLoad {
    [super viewDidLoad];
    self.scrollView.contentSize = self.view.frame.size;
}


//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view from its nib.
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
