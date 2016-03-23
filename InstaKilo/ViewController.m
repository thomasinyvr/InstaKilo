//
//  ViewController.m
//  InstaKilo
//
//  Created by Thomas Friesman on 2016-03-23.
//  Copyright © 2016 Thomas Friesman. All rights reserved.
//

#import "ViewController.h"
#import "Photo.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

#pragma mark - Properties -

@property (nonatomic) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic)NSArray *photoArray;

@property (nonatomic) NSDictionary *data;
@property (nonatomic) NSDictionary *locationsDictionary;
@property (nonatomic) NSDictionary *subjectsDictionary;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.photoArray = [Photo photoArray];
    [self setupFlowLayout];
    
    self.data = [self unsortedPhotos];
    [self.collectionView reloadData];
     
     
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
