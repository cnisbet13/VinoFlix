//
//  TwoCollectionViewController.m
//  Rotten Mangoes
//
//  Created by Calvin Nisbet on 2014-10-30.
//  Copyright (c) 2014 Calvin Nisbet. All rights reserved.
//

#import "MasterCollectionViewController.h"
#import "moviePhotoCell.h"
#import "DetailViewController.h"

@interface MasterCollectionViewController ()

@end

@implementation MasterCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.movieInfoArray = [NSArray array];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    NSString *rottenUrl = @"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=rk6mbwefv8ztmpa29xwtgxq3&page_limit=30";
    
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:rottenUrl]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                
                // handle response
                
                NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
                NSLog (@"%@", dataDictionary);
                NSArray *movies = [dataDictionary objectForKey:@"movies"];
                self.movieInfoArray = movies;
                
                
                dispatch_async(dispatch_get_main_queue(), ^(){
                    //Add method, task you want perform on mainQueue
                    //Control UIView, IBOutlet all here
                    [self.collectionView reloadData];
                    
                });
                
                
                
            }] resume];
        
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    NSLog(@"count for self.movieArray is %lu", (unsigned long)[self.movieInfoArray count]);
    return [self.movieInfoArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    moviePhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
   // cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"photo-frame.png"]];
    cell.moviePhotos.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:
                                                     [NSURL URLWithString:[[self.movieInfoArray[indexPath.item] objectForKey:@"posters"] objectForKey:@"detailed"]]]];
    cell.titleLabel.text = [self.movieInfoArray[indexPath.item]objectForKey:@"title"];
    
    return cell;
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems] lastObject];
        NSDictionary *selectedMovie = self.movieInfoArray[indexPath.item];
        [[segue destinationViewController] setMovieChosen:selectedMovie];
    } else if ([segue.identifier isEqualToString:@"showMapView"]) {
        NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems] lastObject];
        NSDictionary *selectedMovie = self.movieInfoArray[indexPath.item];
        [[segue destinationViewController] setMovieChosen:selectedMovie];
    }
}


#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
