//
//  ViewController.m
//  EX_1_2_1
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 steve. All rights reserved.
//

#import "ViewController.h"
#import "ProductCell.h"
#import "Catalog.h"
#import "Product.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource,CartDelegate>{
    
    NSMutableArray* cartItems;
}

@property (weak, nonatomic) IBOutlet UITableView *table;
@end



@implementation ViewController


-(void)addItem:(id)sender{
    
    NSIndexPath* indexPath = [_table indexPathForCell:sender];
    
    Product *product = [[Catalog defaultCatalog] productAt:indexPath.row];
    
    [cartItems addObject:product];
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    
    [_table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if( 0 == section){
        
        return [[Catalog defaultCatalog] numberOfProducts];
        
    }
    else{
        
        return [cartItems count];
        
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (0 == indexPath.section) {
        ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PRODUCT_CELL"];
        
        cell.delegate = self;
        
        Product *product = [[Catalog defaultCatalog] productAt:indexPath.row];
        
        [cell setProductInfo:product];
        return cell;
        
    } //두번째 셀은 카트용
    else{
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CART_CELL"];
        Product *product = cartItems[indexPath.row];
        cell.textLabel.text = product.name;
        return cell;
        
    }
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    if (0 == section) {
        return @"Product";
    }
    else{
        
        return @"Items in Cart";
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    cartItems = [[NSMutableArray alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
