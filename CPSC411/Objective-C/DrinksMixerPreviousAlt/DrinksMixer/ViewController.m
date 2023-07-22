//
//  ViewController.m
//  DrinkMixer
//
//  Created by William McCarthy on 02/8/2022.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "AddDrinkViewController.h"
#import "DrinkConstants.h"


@interface ViewController () {
  NSMutableArray *drinks;
  UIBarButtonItem *addButton;
}

@property (strong, nonatomic) IBOutlet UIBarButtonItem *addButton;
- (IBAction)addButtonPressed:(id)sender;

@end


@implementation ViewController

@synthesize tableView, addButton;

#pragma mark - View life cycle

//- (void)awakeFromNib {
//  [super awakeFromNib];
//  self.detailController = [[DetailViewController alloc] init];
//}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  NSString* path = [[NSBundle mainBundle] pathForResource:@"DrinkDirections" ofType:@"plist"];
  drinks = [[NSMutableArray alloc] initWithContentsOfFile:path];
//    drinks = [[NSMutableArray alloc] initWithObjects:@"Firecracker", @"Lemon Drop", @"Mojito", nil];
  
  self.navigationItem.leftBarButtonItem = self.editButtonItem;
  self.navigationItem.rightBarButtonItem = self.addButton;
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                        selector:@selector(applicationDidEnterBackground:)
                                        name:UIApplicationDidEnterBackgroundNotification
                                        object:nil];
}

- (void)applicationDidEnterBackground:(NSNotification *)notif {
  NSString *path = [[NSBundle mainBundle]
                    pathForResource:@"DrinksDirections" ofType:@"plist"];
  [drinks writeToFile:path atomically:YES];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView { return 1; }

- (NSInteger)tableView:(UITableView *)tableView
             numberOfRowsInSection:(NSInteger)section {
//  size_t ct = [drinks count];
//  NSLog(@"%@", [NSString stringWithFormat:@"ct is: %lu", ct]);
  return [self->drinks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
                     cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString* cellIdentifier = @"drinkCell";
  
  UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
  }
  
  cell.textLabel.text = [[drinks objectAtIndex:indexPath.row] objectForKey:NAME_KEY];
  cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
  return cell;
}

- (void)tableView:(UITableView *)tableView
        commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
        forRowAtIndexPath:(NSIndexPath *)indexPath {
  if (editingStyle == UITableViewCellEditingStyleDelete) {
    // delete the row from the data source
    [drinks removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
               withRowAnimation:UITableViewRowAnimationFade];
  } else if (editingStyle == UITableViewCellEditingStyleInsert) {
    // TODO: still to come
  }
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue
//        sender:(id)sender {
//  DetailViewController *detailVC;
//  if ([segue.identifier isEqualToString:@"detailVC"]) {
//    NSIndexPath *indexPath = [tableView indexPathForCell:sender];
//    detailVC = (DetailViewController *)segue.destinationViewController;
//    [detailVC setValue:[drinks objectAtIndex:indexPath.row] forKey:@"drink"];
//  }
//}

- (BOOL)tableView:(UITableView *)tableView
        canEditRowAtIndexPath:(NSIndexPath *)indexPath {
  return YES;
}

- (void)tableView:(UITableView*)tableView
        didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  NSLog(@"in didSelectViewRowAtIndexPath");
  
  if (!self.editing) {
    DetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"detailVC"];
    detailVC.drink = [drinks objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:detailVC animated:YES];
  } else {
    AddDrinkViewController *editingDrinkVC = [self.storyboard instantiateViewControllerWithIdentifier:@"addDrinkVC"];
    editingDrinkVC.drink = [drinks objectAtIndex:indexPath.row];
    editingDrinkVC.drinkArray = drinks;
    
    UINavigationController *editingNavCon = [[UINavigationController alloc] initWithRootViewController:editingDrinkVC];
    [self presentViewController:editingNavCon animated:YES completion:nil];
  }
}


- (void)receiveNotification:(NSNotification *)notif {
  NSLog(@"in receiveNotification, reloading data...");
  [tableView reloadData];
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}
  
#pragma mark - IBActions

- (IBAction)addButtonPressed:(id)sender {
  NSLog(@"Add button pressed!");

  AddDrinkViewController *addDrinkVC = [self.storyboard instantiateViewControllerWithIdentifier:@"addDrinkVC"];
  UINavigationController *addNavController = [[UINavigationController alloc] initWithRootViewController:addDrinkVC];
  
  addDrinkVC.drinkArray = drinks;

  // register self with NSNotificationCenter for tableShouldUpload selector
  //    allows addNavController to send request for data to upload when save is chosen
  NSLog(@"creating NSNotification for ReloadNotification");
  
  [[NSNotificationCenter defaultCenter]
      addObserver:self
      selector:@selector(receiveNotification:)
      name:@"ReloadNotification"
      object:nil];
  
  [self presentViewController:addNavController animated:YES completion:nil];
  
  NSLog(@"after presenting the addNavController");
//  [self.navigationController pushViewController:addDrinkVC animated:YES];
}
@end

