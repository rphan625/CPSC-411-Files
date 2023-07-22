//
//  ViewController.h
//  throwaway
//
//  Created by csuftitan on 9/21/22.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
@private
UITableView *tableView;
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end

