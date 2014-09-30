//
//  PresidentDetailViewController.m
//  Navigation Bar
//
//  Created by JUN LIU on 30/9/14.
//  Copyright (c) 2014 JUN LIU. All rights reserved.
//

#import "PresidentDetailViewController.h"
#import "President.h"

#define kNumberOfEditableRows   4
#define kNameRowIndex           0
#define kFromYearRowIndex       1
#define kToYearRowIndex         2
#define kPartyRowIndex          3

#define kLabelTag       2048
#define kTextFieldTag   4094

@interface PresidentDetailViewController ()

@end

@implementation PresidentDetailViewController{
    NSString* initialText;
    BOOL hasChanged;
}

- (IBAction)cancel:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)save:(id)sender{
    [self.view endEditing:YES];
    if (hasChanged){
        [self.delegate presidentDetailViewController:self didUpdatePresident:self.president];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)textFieldDone:(id)sender{
    //[sender resignFirstResponder];
    UITextField* senderField = sender;
    NSInteger nextRow = (senderField.superview.tag + 1) % kNumberOfEditableRows;
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:nextRow inSection:0];
    UITableViewCell* nextCell = [self.tableView cellForRowAtIndexPath:indexPath];
    UITextField* nextField = (id)[nextCell viewWithTag:kTextFieldTag];
    [nextField becomeFirstResponder];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        // Custom initialization
        self.fieldLabels = @[@"Name:",@"From:", @"To:", @"Party:"];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
                                                  initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                  target:self
                                                  action:@selector(cancel:)];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                                  initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                                                  target:self
                                                  action:@selector(save:)];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.tableView.allowsSelection = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return kNumberOfEditableRows;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* reuseIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    // Configure the cell...
    if (cell == nil){
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(10,10,75,25)];
        label.tag = kLabelTag;
        label.textAlignment = NSTextAlignmentRight;
        label.font = [UIFont boldSystemFontOfSize:14];
        [cell.contentView addSubview:label];
        
        UITextField* textField = [[UITextField alloc] initWithFrame:CGRectMake(90,12,200,25)];
        textField.tag = kTextFieldTag;
        textField.clearsOnBeginEditing = NO;
        textField.delegate = self;
        //textField.returnKeyType = UIReturnKeyDone;
        [textField addTarget:self action:@selector(textFieldDone:) forControlEvents:UIControlEventEditingDidEndOnExit];
        [cell.contentView addSubview:textField];
    }
    
    UILabel* label = (id)[cell viewWithTag:kLabelTag];
    label.text = self.fieldLabels[indexPath.row];
    
    UITextField* textField = (id)[cell viewWithTag:kTextFieldTag];
    textField.superview.tag = indexPath.row;
    switch(indexPath.row){
        case kNameRowIndex:
            textField.text = self.president.name;
            break;
        case kFromYearRowIndex:
            textField.text = self.president.fromYear;
            break;
        case kToYearRowIndex:
            textField.text = self.president.toYear;
            break;
        case kPartyRowIndex:
            textField.text = self.president.party;
            break;
        default:
            break;
    }
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Text Field Delegate Methods
- (void) textFieldDidBeginEditing:(UITextField *)textField{
    initialText = textField.text;
}

- (void) textFieldDidEndEditing:(UITextField *)textField{
    if (![textField.text isEqualToString:initialText]){
        hasChanged = YES;
        switch (textField.superview.tag) {
            case kNameRowIndex:
                self.president.name = textField.text;
                break;
            case kFromYearRowIndex:
                self.president.fromYear = textField.text;
                break;
            case kToYearRowIndex:
                self.president.toYear = textField.text;
                break;
            case kPartyRowIndex:
                self.president.party = textField.text;
                break;
                
            default:
                break;
        }
    }
}

@end
