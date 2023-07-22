//
//  ViewController.m
//  Drinks
//
//  Created by csuftitan on 9/7/22.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "DrinkConstants.h"


@interface ViewController () {
    NSMutableArray *drinks;
    
}

@end

@implementation ViewController

@synthesize tableView;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *arrayPath = [[NSBundle mainBundle] pathForResource:@"drinkDirections" ofType:@"plist"];
    drinks = [[NSMutableArray alloc] initWithContentsOfFile:arrayPath];
    
//    self.navigationItem.leftBarButtonItem = self.editButtonItem;
//    self.navigationItem.rightBarButtonItem = self.addButton;
}

- (void)applicationDidEnterBackground:(NSNotification *)notif {
    NSString *path = [[NSBundle mainBundle]
                      pathForResource:@"DrinksDirection" ofType:@"plist"];
    [drinks writeToFile:path atomically:YES];
}

#pragma mark - Table View
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView { return 1;}

-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section {
    return [drinks count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellIdentifier = @"drinkCell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [[drinks objectAtIndex:indexPath.row] objectForKey:NAME_KEY];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(void)tableView:(UITableView*)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [drinks removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        /// TODO: STILL TO COME
    }
}

-(BOOL)tableview:(UITableView *)tableView
        canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView*)tableView
    didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSLog(@"in didSelectViewRowAtIndexPath");
    
    if (!self.editing) {
        DetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"detailVC"];
        detailVC.drink = [drinks objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:detailVC animated:YES];
    }
}



@end
