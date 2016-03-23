//
//  ViewController.m
//  InstaKilo
//
//  Created by Thomas Friesman on 2016-03-23.
//  Copyright © 2016 Thomas Friesman. All rights reserved.
//

#import "ViewController.h"
#import "Photo.h"
#import "MyCollectionViewCell.h"
#import "HeaderCollectionReusableView.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

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

#pragma mark - UICollectionViewDataSource - 

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.data.allKeys.count;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.data.allValues[section] count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.object = self.data.allValues[indexPath.section][indexPath.row];
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    HeaderCollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"Header" forIndexPath:indexPath];
    header.textLabel.text = self.data.allKeys[indexPath.section];
    return header;
}

#pragma mark - UICollectionViewDelegate -
-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - Actions -

- (IBAction)changeOrderOfPhotos:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        self.data = [self unsortedPhotos];
    } else if (sender.selectedSegmentIndex == 1) {
        self.data = [self photosSortedBySubject];
    } else {
        self.data = [self photosSortedByLocation];
    }
    
    [self.collectionView reloadData];
}


#pragma mark - General Methods - 

-(NSDictionary *)unsortedPhotos
{
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    result[@"Photos"] = self.photoArray;
    return result;
}

-(NSDictionary *)photosSortedByLocation
{
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    
    for (Photo *photo in self.photoArray) {
        NSMutableArray *locationArray = result[photo.location];
        if (!locationArray) locationArray = [NSMutableArray array];
        [locationArray addObject:photo];
        result[photo.location] = locationArray;
    }
    
    return result;
}

-(NSDictionary *)photosSortedBySubject
{
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    
    for (Photo *photo in self.photoArray) {
        NSMutableArray *subjArray = result[photo.subject];
        if (!subjArray) subjArray = [NSMutableArray array];
        [subjArray addObject:photo];
        result[photo.subject] = subjArray;
    }
    
    return result;
    
}

-(void)setupFlowLayout
{
    self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.flowLayout.itemSize = CGSizeMake(100, 100);
    self.flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 10, 10);
    self.flowLayout.minimumInteritemSpacing = 15;
    self.flowLayout.minimumLineSpacing = 10;
    self.flowLayout.headerReferenceSize = CGSizeMake(self.collectionView.frame.size.width, 50);
    self.collectionView.collectionViewLayout = self.flowLayout;
}



@end
