//
//  DetailViewControl.h
//  DrinksMixer
//
//  Created by csuftitan on 10/3/22.
//

#ifndef DetailViewControl_h
#define DetailViewControl_h

#include <UIKit/UIKit.h>

@interface DetailViewControl: UIViewController {
@private
    UITextField *drinkName_;
    UITextView *ingredients_;
    UITextView *directions_;
    NSDictionary *drink_;
    UIScrollView *scrollView_;
}

@property (strong, nonatomic) IBOutlet UITextField *drinkName;
@property (strong, nonatomic) IBOutlet UITextView *ingredients;
@property (strong, nonatomic) IBOutlet UITextView *directions;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) NSDictionary *drink;


@end

#endif /* DetailViewControl_h */



