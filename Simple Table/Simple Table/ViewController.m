//
//  ViewController.m
//  Simple Table
//
//  Created by JUN LIU on 29/9/14.
//  Copyright (c) 2014 JUN LIU. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dwarves = @[@"Sleepy", @"Sneezy",
                     @"Bashful", @"Happy", @"Doc", @"Grumpy", @"Dopey", @"Thorin",
                     @"Dorin", @"Nori", @"Ori", @"Balin", @"Dwalin", @"Fili", @"Kili",
                     @"Oin", @"Gloin", @"Bifur", @"Bofur", @"Bombur"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Table Data Source Methods
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dwarves count];
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* simpleTableIdentifier = @"SimpleTableIdentifier";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil){
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:simpleTableIdentifier];
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:simpleTableIdentifier];
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:simpleTableIdentifier];
    }
    
    UIImage* imageNormal = [UIImage imageNamed:@"star.png"];
    UIImage* imageHighlighted = [UIImage imageNamed:@"star2.png"];
    cell.imageView.image = imageNormal;
    cell.imageView.highlightedImage = imageHighlighted;
    
    cell.textLabel.text = self.dwarves[indexPath.row];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:50];
    
    if (indexPath.row < 7){
        cell.detailTextLabel.text = @"Mr. Disney";
    }
    else{
        cell.detailTextLabel.text = @"Mr. Tolkien";
    }
    
    return cell;
    
}
#pragma mark Table Delegate Methods
- (NSInteger) tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath{
    //return indexPath.row;
    return 0;
}

- (NSIndexPath*) tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0){
        return nil;
    }
    else{
        return indexPath;
    }
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* rowValue = self.dwarves[indexPath.row];
    NSString* msg = [[NSString alloc] initWithFormat:@"You selected %@", rowValue];
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Row Selected"
                                                        message:msg delegate:nil
                                              cancelButtonTitle:@"Yes, I did"
                                              otherButtonTitles:nil];
    [alertView show];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

@end
