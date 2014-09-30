//
//  CheckListViewController.m
//  Navigation Bar
//
//  Created by JUN LIU on 29/9/14.
//  Copyright (c) 2014 JUN LIU. All rights reserved.
//

#import "CheckListViewController.h"

@interface CheckListViewController ()

@end

static NSString* CellIdentifier = @"Cell";

@implementation CheckListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Check One";
        self.rowImage = [UIImage imageNamed:@"checkmarkControllerIcon.png"];
        self.snacks = @[@"Who Hash", @"Bubba Gump Shrimp Étouffée",
                        @"Who Pudding", @"Scooby Snacks", @"Everlasting Gobstopper",
                        @"Green Eggs and Ham", @"Soylent Green", @"Hard Tack",
                        @"Lembas Bread", @"Roast Beast", @"Blancmange"];
        self.selectedSnacks = NSNotFound;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Table View Data Source Methods
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.snacks count];
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.textLabel.text = self.snacks[indexPath.row];
    if (self.selectedSnacks == indexPath.row){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

#pragma mark - Table View Delegate Methods
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row != self.selectedSnacks){
        
        if (self.selectedSnacks != NSNotFound){
            NSIndexPath* oldIndexPath = [NSIndexPath indexPathForRow:self.selectedSnacks inSection:0];
            UITableViewCell* oldCell = [tableView cellForRowAtIndexPath:oldIndexPath];
            oldCell.accessoryType = UITableViewCellAccessoryNone;
        }
        
        UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        self.selectedSnacks = indexPath.row;
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
