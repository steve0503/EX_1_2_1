//
//  ProductCell.m
//  3_4_16
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 steve. All rights reserved.
//

#import "ProductCell.h"


@interface ProductCell()
@property (weak, nonatomic)IBOutlet UILabel *productName;
@property (weak, nonatomic)IBOutlet UILabel *productPrice;
@property (weak, nonatomic)IBOutlet UIImageView *productImage;


@end



@implementation ProductCell

-(void)setProductInfo:(Product *)item{
    
    _productName.text = item.name;
    _productPrice.text = item.price;
    _productImage.image = [UIImage imageNamed:item.imageName];
    
    
}


-(IBAction)addCart:(id)sender{
    
    [self.delegate addItem:self ];
    
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
