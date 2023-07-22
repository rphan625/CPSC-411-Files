//
//  ViewController.m
//  throwthrowaway
//
//  Created by csuftitan on 9/21/22.
//

#import "ViewController.h"
#import "DetailViewControl.h"
#import "AddDrinkViewController.h"
#import "DrinkConstants.h"

@interface ViewController () {
    UITableView *tableView;
    NSMutableArray *drinks;
    UIBarButtonItem *addButton;
}

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, retain) NSMutableArray *drinks;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *addButton;

@end

@implementation ViewController

@synthesize tableView=tableView, drinks=drinks, addButton=addButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    drinks = [[NSMutableArray alloc] initWithObjects:@"Firecracker", @"Lemon Drop", @"Mojito", @"Whiskey Sour", nil];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"DrinkDirections" ofType:@"plist"];
    self.drinks = [NSMutableArray arrayWithContentsOfFile:path];
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

#pragma mark - Table View Datasource Protocol

- (NSInteger)numberOfSectionsInTableView { return 1; }

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.drinks count];
}

- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString* cellIdentifier = @"drinkCell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
      cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
// Configure the cell.
    cell.textLabel.text = [[drinks objectAtIndex:indexPath.row] objectForKey:NAME_KEY];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView
        commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
        forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self setEditing:true animated:true];
    [[self tableView] reloadData];
  if (editingStyle == UITableViewCellEditingStyleDelete) {
    // delete the row from the data source
    [drinks removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
               withRowAnimation:UITableViewRowAnimationFade];
  } else if (editingStyle == UITableViewCellEditingStyleInsert) {
    // TODO: still to come
  }
}

- (BOOL)tableView:(UITableView *)tableView
        canEditRowAtIndexPath:(NSIndexPath *)indexPath {
  return YES;
}

#pragma mark -
#pragma mark Table View Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    NSLog(@"in didSelectViewRowAtIndexPath");
    // pass the selected object to new view controller

    
    if (!self.editing) {
//      DetailViewControl *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"detailVC"];
        DetailViewControl *detailVC = [[DetailViewControl alloc] initWithNibName:@"DetailViewControl" bundle:nil];
        
        detailVC.drink = [drinks objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:detailVC animated:YES];
        [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
    } else {
//      AddDrinkViewController *editingDrinkVC = [self.storyboard instantiateViewControllerWithIdentifier:@"addDrinkVC"];
      AddDrinkViewController *editingDrinkVC = [[AddDrinkViewController alloc] initWithNibName:@"DetailViewControl" bundle:nil];
      editingDrinkVC.drinkName = [drinks objectAtIndex:indexPath.row];
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

#pragma mark Actions

- (IBAction)addButtonPressed:(id)sender {
    NSLog(@"Add Button Pressed!");
    
//    AddDrinkViewController *addViewController = [[AddDrinkViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
//    [self presentViewController: addViewController animated:YES completion:nil];
//    AddDrinkViewController *addDrinkVC = [self.storyboard instantiateViewControllerWithIdentifier:@"addDrinkVC"];
    AddDrinkViewController *addDrinkVC = [[AddDrinkViewController alloc] initWithNibName:@"DetailViewControl" bundle:nil];
    
    UINavigationController *addNavController = [[UINavigationController alloc] initWithRootViewController: addDrinkVC];
//
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
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:editing];
}
@end
