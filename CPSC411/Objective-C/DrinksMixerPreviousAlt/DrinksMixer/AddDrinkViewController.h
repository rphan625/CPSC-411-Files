//
//  AddDrinkViewController.h
//  DrinkMixer
//
//  Created by William McCarthy on 12/8/2022.
//

#ifndef AddDrinkViewController_h
#define AddDrinkViewController_h

#import "DetailViewController.h"


@interface AddDrinkViewController : DetailViewController {
  BOOL keyboardVisible;
  NSMutableArray *drinkArray;
}

@property (nonatomic, retain) NSMutableArray *drinkArray;


- (void)keyboardDidShow:(NSNotification *)notif;
- (void)keyboardDidHide:(NSNotification *)notif;

@end

#endif /* AddDrinkViewController_h */
