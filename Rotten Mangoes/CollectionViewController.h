//
//  CollectionViewController.h
//  Rotten Mangoes
//
//  Created by Calvin Nisbet on 2014-10-30.
//  Copyright (c) 2014 Calvin Nisbet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieInfo.h"

@interface CollectionViewController : UICollectionViewController<UICollectionViewDataSource, UICollectionViewDelegate, NSURLConnectionDelegate>

@property (nonatomic, strong) NSArray *movieObjects;

@end
