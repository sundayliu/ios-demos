//
//  PresidentsViewController.m
//  Navigation Bar
//
//  Created by JUN LIU on 30/9/14.
//  Copyright (c) 2014 JUN LIU. All rights reserved.
//

#import "PresidentsViewController.h"
#import "PresidentDetailViewController.h"
#import "President.h"

static NSString* ReuseIdentifier = @"Cell";

@interface PresidentsViewController ()

@end

@implementation PresidentsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Detail Edit";
        self.rowImage = [UIImage imageNamed:@"detailEditIcon.png"];
        NSString* path = [[NSBundle mainBundle] pathForResource:@"Presidents" ofType:@"plist"];
        NSData* data = [[NSData alloc] initWithContentsOfFile:path];
        NSKeyedUnarchiver* unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        self.presidents = [unarchiver decodeObjectForKey:@"Presidents"];
        [unarchiver finishDecoding];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ReuseIdentifier];
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
    return [self.presidents count];
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:ReuseIdentifier];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    BIDPresident* president = self.presidents[indexPath.row];
    cell.textLabel.text = president.name;
    return cell;
}

#pragma mark - Table View Delegate Methods
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BIDPresident* president = self.presidents[indexPath.row];
    PresidentDetailViewController* controller = [[PresidentDetailViewController alloc] init];
    controller.president = president;
    controller.delegate = self;
    controller.row = indexPath.row;
    [self.navigationController pushViewController:controller animated:YES];
}
#pragma mark - President Detail Delegate Methods

- (void) presidentDetailViewController:(PresidentDetailViewController *)controller didUpdatePresident:(BIDPresident *)president{
    [self.presidents replaceObjectAtIndex:controller.row withObject:president];
    [self.tableView reloadData];
}

@end
