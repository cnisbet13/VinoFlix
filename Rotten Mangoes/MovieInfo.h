//
//  MovieInfo.h
//  Rotten Mangoes
//
//  Created by Calvin Nisbet on 2014-10-29.
//  Copyright (c) 2014 Calvin Nisbet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieInfo : NSObject

//@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *rating;
@property (nonatomic, strong) NSString *runtime;
@property (strong, nonatomic) NSString *castLabel;
@property (strong, nonatomic) NSString *runtimeLabel;
@property (strong, nonatomic) NSString *ratingLabel;
@property (strong, nonatomic) NSString *movieDescription;
@property (strong, nonatomic) NSString *scoreLabel;


@end
