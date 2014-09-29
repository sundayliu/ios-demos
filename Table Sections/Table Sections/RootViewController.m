//
//  RootViewController.m
//  Table Sections
//
//  Created by JUN LIU on 29/9/14.
//  Copyright (c) 2014 JUN LIU. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController{
    NSMutableArray* filteredNames;
    UISearchDisplayController* searchController;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


static NSString* SectionsTableIdentifier = @"SectionsTableIdentifier";
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UITableView* tableView = (id)[self.view viewWithTag:1];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:SectionsTableIdentifier];
    
    filteredNames = [NSMutableArray array]; // empty array
    UISearchBar* searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0,0,320,44)];
    tableView.tableHeaderView = searchBar;
    
    searchController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    searchController.delegate = self;
    searchController.searchResultsDataSource = self;
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"sortednames" ofType:@"plist"];
    self.names = [NSDictionary dictionaryWithContentsOfFile:path];
    self.keys = [[self.names allKeys] sortedArrayUsingSelector:@selector(compare:)];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Table Data Source Methods
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView.tag == 1){
        return [self.keys count];
    }
    else{
        return 1;
    }
    
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView.tag == 1){
        NSString* key = self.keys[section];
        NSArray* nameSection = self.names[key];
        return [nameSection count];
    }
    else{
        return [filteredNames count];
    }
}

- (NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (tableView.tag == 1){
        return self.keys[section];
    }
    else{
        return nil;
    }
}

- (UITableViewCell*) tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:SectionsTableIdentifier];
    
    if (tableView.tag == 1){
        NSString* key = self.keys[indexPath.section];
        NSArray* nameSection = self.names[key];
        cell.textLabel.text = nameSection[indexPath.row];
        
    }
    else{
        cell.textLabel.text = filteredNames[indexPath.row];
    }
    
    return cell;
}
#pragma mark Table Delegate Methods

- (NSArray*) sectionIndexTitlesForTableView:(UITableView *)tableView{
    if (tableView.tag == 1){
        return self.keys;
    }
    else{
        return nil;
    }
}

#pragma mark Search Display Delegate Methods
- (void)searchDisplayController:(UISearchDisplayController *)controller didLoadSearchResultsTableView:(UITableView *)tableView{
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:SectionsTableIdentifier];
}

- (BOOL) searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{
    
    [filteredNames removeAllObjects];
    if (searchString.length > 0){
        NSPredicate* predicate = [NSPredicate predicateWithBlock:^BOOL(NSString* name, NSDictionary* b){
            NSRange range = [name rangeOfString:searchString options:NSCaseInsensitiveSearch];
            return range.location != NSNotFound;
        }];
        
        for (NSString* key in self.keys){
            NSArray* matches = [self.names[key] filteredArrayUsingPredicate:predicate];
            [filteredNames addObjectsFromArray:matches];
        }
    }
    return YES;
}

@end
