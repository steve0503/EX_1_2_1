//
//  ProductCell.h
//  3_4_16
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 steve. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Product.h"

#import "CartDelegate.h"

@interface ProductCell : UITableViewCell


-(void)setProductInfo:(Product *)item;

@property (weak)id <CartDelegate> delegate;

@end
