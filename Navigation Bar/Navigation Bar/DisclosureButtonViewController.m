//
//  DisclosureButtonViewController.m
//  Navigation Bar
//
//  Created by JUN LIU on 29/9/14.
//  Copyright (c) 2014 JUN LIU. All rights reserved.
//

#import "DisclosureButtonViewController.h"
#import "DisclosureDetailViewController.h"

@interface DisclosureButtonViewController ()

@end

static NSString* CellIdentifier = @"CellDisclosureButton";

@implementation DisclosureButtonViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Disclosure Buttons";
        self.rowImage = [UIImage imageNamed:@"disclosureButtonControllerIcon.png"];
        
        self.movies = @[@"Toy Story", @"A Bug's Life", @"Toy Story 2",
                        @"Monsters, Inc.", @"Finding Nemo", @"The Incredibles",
                        @"Cars", @"Ratatouille", @"WALL-E", @"Up",
                        @"Toy Story 3", @"Cars 2", @"Brave"];
        self.disclosureDetailViewController = [[DisclosureDetailViewController alloc] init];

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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.movies count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    cell.textLabel.text = self.movies[indexPath.row];
    return cell;
}

#pragma mark - Table View Delegate Methods
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:@"Hey,do you see the disclosure button"
                                                       message:@"Touch that to drill down instead"
                                                      delegate:nil
                                             cancelButtonTitle:@"Won't happen again"
                                             otherButtonTitles:nil];
    [alertView show];
}

- (void) tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    self.disclosureDetailViewController.title = @"Disclosure Button Pressed";
    NSString* selectedMovie = self.movies[indexPath.row];
    NSString* detailMessage = [[NSString alloc] initWithFormat:@"This is details for %@",selectedMovie];
    
    self.disclosureDetailViewController.message = detailMessage;
    self.disclosureDetailViewController.title = selectedMovie;
    
    [self.navigationController pushViewController:self.disclosureDetailViewController animated:YES];
}

@end
