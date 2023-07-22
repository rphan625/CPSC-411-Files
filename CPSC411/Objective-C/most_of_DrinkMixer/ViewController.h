//
//  ViewController.h
//  DrinkMixer
//
//  Created by William McCarthy on 02/8/2022.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
@private
  UITableView *tableView;
}

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

