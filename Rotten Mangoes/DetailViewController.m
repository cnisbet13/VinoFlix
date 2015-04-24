//
//  DetailViewController.m
//  Rotten Mangoes
//
//  Created by Calvin Nisbet on 2014-10-30.
//  Copyright (c) 2014 Calvin Nisbet. All rights reserved.
//

#import "DetailViewController.h"
#import "MasterCollectionViewController.h"
#import "MapKitViewController.h"


@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad
{

    [super viewDidLoad];
    [self configureView];

}

-(void)viewWillAppear:(BOOL)animated
{



}


-(void)configureView
{

    UIImage *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[self.movieChosen valueForKeyPath:@"posters.original"]]]];
    [self.movieImage setImage:image];
    self.movieSynopsis.text = [self.movieChosen objectForKey:@"synopsis"];
    self.movieTitle.text = [self.movieChosen objectForKey:@"title"];
    
    NSString *castName1 = [_movieChosen valueForKeyPath:@"abridged_cast.name"][0];
    NSString *castName2 = [_movieChosen valueForKeyPath:@"abridged_cast.name"][1];
    NSString *castName3 = [_movieChosen valueForKeyPath:@"abridged_cast.name"][2];
    [self.movieCast setText:[NSString stringWithFormat:@"Starring: %@, %@, and %@", castName2, castName3, castName1]];
    
    NSString *releaseDate =[_movieChosen valueForKeyPath:@"release_dates.theater"];
    [self.releaseDate setText:[NSString stringWithFormat:@"In Theatres: %@", releaseDate]];
    NSLog(@"Release Date: %@", releaseDate);
    
    NSNumber *runtime = [_movieChosen valueForKeyPath:@"runtime"];
    [self.movieRuntime setText:[NSString stringWithFormat:@"Runtime: %@ mins", runtime]];

    NSString *rating = [_movieChosen valueForKey:@"mpaa_rating"];
    [self.movieRating setText:[NSString stringWithFormat:@"Rated: %@", rating]];
}

-(IBAction)findInMap:(id)sender
{    
    [self performSegueWithIdentifier:@"showMapView" sender:sender];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation

 
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     
    
     [segue destinationViewController];
   
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
