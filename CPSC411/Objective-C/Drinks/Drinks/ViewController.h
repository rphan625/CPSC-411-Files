//
//  ViewController.h
//  Drinks
//
//  Created by csuftitan on 9/7/22.
//

#import <UIKit/UIKit.h>

@class DetailViewController;
@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
@private
    UITableView *tableView;
}

@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end

