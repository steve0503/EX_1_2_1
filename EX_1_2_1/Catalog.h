//
//  Catalog.h
//  EX_1_2_1
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 steve. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Catalog : NSObject{
    
    NSArray *data;
    
}

-(id)productAt:(int)index;
-(int)numberOfProducts;


//싱글턴 방식으로 카탈로그 사용

+(id)defaultCatalog;

@end
