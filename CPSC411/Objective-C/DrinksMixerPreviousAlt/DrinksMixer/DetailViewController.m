//
//  DetailViewController.m
//  Drinks
//
//  Created by csuftitan on 9/12/22.
//

#import "DetailViewController.h"
#import "DrinkConstants.h"


@implementation DetailViewController

@synthesize drink=drink, scrollView=scrollView_;

- (void)viewDidLoad{
    [super viewDidLoad];
    self.scrollView.contentSize = self.view.frame.size;
    
    NSLog(@"the detail view did load");
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"the detail view will appear");
    
    self.drinkName.text = [self.drink objectForKey:NAME_KEY];
    self.ingredients.text = [self.drink objectForKey:INGREDIENTS_KEY];
    self.directions.text = [self.drink objectForKey:DIRECTIONS_KEY];
}

@end
