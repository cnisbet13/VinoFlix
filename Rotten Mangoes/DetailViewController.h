//
//  DetailViewController.h
//  Rotten Mangoes
//
//  Created by Calvin Nisbet on 2014-10-30.
//  Copyright (c) 2014 Calvin Nisbet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *movieImage;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *castLabel;

@property (strong, nonatomic) IBOutlet UILabel *ratingLabel;
@property (strong, nonatomic) IBOutlet UILabel *synopsis;
@property (strong, nonatomic) IBOutlet UILabel *runtimeLabel;

@property (nonatomic, strong) NSDictionary *movieChosen;
//
//
//
////Hook This Up -->
//-(IBAction)findInMap:(id)sender;
//

@end
