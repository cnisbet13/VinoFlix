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
@property (strong, nonatomic) IBOutlet UILabel *movieTitle;
@property (strong, nonatomic) IBOutlet UILabel *movieCast;

@property (strong, nonatomic) IBOutlet UITextView *movieSynopsis;
@property (strong, nonatomic) IBOutlet UILabel *movieRuntime;
@property (strong, nonatomic) IBOutlet UILabel *movieRating;

@property (strong, nonatomic) IBOutlet UILabel *releaseDate;
@property (nonatomic, strong) NSDictionary *movieChosen;
@property (nonatomic, strong) NSArray *cast;
//
//
//
////Hook This Up -->
//-(IBAction)findInMap:(id)sender;
//

@end
