//
//  DetailViewController.m
//  Rotten Mangoes
//
//  Created by Calvin Nisbet on 2014-10-30.
//  Copyright (c) 2014 Calvin Nisbet. All rights reserved.
//

#import "DetailViewController.h"
#import "MasterCollectionViewController.h"


@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

   // need to create view
    

    
   // [self configureLabels];
  
    [self configureView];

    //NSLog(@"%@", self.movieChosen);
        // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated   {
    
   }


-(void)configureView
{
    self.synopsis.text = [self.movieChosen objectForKey:@"synopsis"];
    self.titleLabel.text = [self.movieChosen objectForKey:@"title"];
    self.movieImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[self.movieChosen objectForKey:@"posters"] objectForKey:@"detailed"]]]];
    self.ratingLabel = [[self.movieChosen objectForKey:@"ratings"] objectForKey:@"audience_rating"];
  //  self.runtimeLabel.text = [self.movieChosen objectForKey:@"runtime"];
    



//-(IBAction)findInMap:(id)sender{
//    
//}
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation

 
// - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//     
//    
//     [segue destinationViewController];
//   
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}

@end
