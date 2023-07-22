//
//  DetailViewController.h
//  DrinkMixer
//
//  Created by William McCarthy on 10/8/2022.
//

#ifndef DetailViewController_h
#define DetailViewController_h

#include <UIKit/UIKit.h>

@interface DetailViewController : UIViewController {
@private
  NSDictionary *drink;
  UIScrollView *scrollView_;
}

@property (strong, nonatomic) IBOutlet UITextField *drinkName;
@property (strong, nonatomic) IBOutlet UITextView *ingredients;
@property (strong, nonatomic) IBOutlet UITextView *directions;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, retain) NSDictionary *drink;

@end

#endif /* DetailViewController_h */
