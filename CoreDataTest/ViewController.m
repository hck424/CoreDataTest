//
//  ViewController.m
//  CoreDataTest
//
//  Created by 김학철 on 2019/12/29.
//  Copyright © 2019 김학철. All rights reserved.
//

#import "ViewController.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "JooSoCell.h"
#import "JooSo+CoreDataProperties.h"
#import "Thumnail+CoreDataProperties.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tblView;
@property (strong, nonatomic) IBOutlet UIView *footerView;
@property (nonatomic, strong) NSMutableArray *arrData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrData = [NSMutableArray array];
    _tblView.tableFooterView = _footerView;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self requestData];
}

- (void)requestData {
    NSManagedObjectContext *context = [AppDelegate instance].persistentContainer.viewContext;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"JooSo"];
    NSError *error = nil;
    NSArray *results = [context executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"fetch error: %@", error.localizedDescription);
    } else {
        [_arrData setArray:results];
    }
    
    [_tblView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _arrData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JooSoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JooSoCell"];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"JooSoCell" owner:self options:nil].firstObject;
    }
    JooSo *jooso = [_arrData objectAtIndex:indexPath.row];
    [cell configurationData:jooso];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSLog(@"aaa");
        JooSo *delJooSo = [_arrData objectAtIndex:indexPath.row];
        [_arrData removeObject:delJooSo];
        [self.tblView reloadData];
        
        NSManagedObjectContext *context = [AppDelegate instance].persistentContainer.viewContext;
        [context deleteObject:delJooSo];
        NSError *error = nil;
        if ([context save:&error] == NO) {
            NSAssert(NO, @"save should not fail: %@", error.localizedDescription);
        }
        
    }
    
}
@end
