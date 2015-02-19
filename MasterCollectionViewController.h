//
//  TwoCollectionViewController.h
//  Rotten Mangoes
//
//  Created by Calvin Nisbet on 2014-10-30.
//  Copyright (c) 2014 Calvin Nisbet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterCollectionViewController : UICollectionViewController<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) NSArray *movieInfoArray;

@end


