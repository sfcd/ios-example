//
//  FBPhotosViewController.m
//  flickBrowser
//
//  Created by Katekov Anton on 2/2/18.
//  Copyright © 2017 katekovanton. All rights reserved.
//

#import "FBPhotosViewController.h"
#import "FBPhotoCollectionViewCell.h"
#import "FBPhotosViewControllerModel.h"


@interface FBPhotosViewController () <UICollectionViewDelegate, UICollectionViewDataSource> {
    FBPhotosViewControllerModel *_model;
}

@end



@implementation FBPhotosViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (_model == nil) {
        _model = [FBPhotosViewControllerModel new];
    }
    
    [_collection registerNib:[UINib nibWithNibName:@"FBPhotoCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"FBPhotoCollectionViewCell"];
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)_collection.collectionViewLayout;
    CGSize size = CGSizeZero;
    
    CGFloat elementCount = 3;
    CGFloat elementSpace = 10;
    size.width = ([UIScreen mainScreen].bounds.size.width - (elementCount - 1) * elementSpace) / elementCount;
    size.height = size.width;
    layout.itemSize = size;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self loadMorePhotosIfNeeded];
}

- (void)handleOnPhotosLoaded:(NSArray *)photos error:(NSError *)error
{
    if (error != nil) {
        // present error
        return;
    }
    
    if (_model == nil) {
        _model = [FBPhotosViewControllerModel new];
    }
    NSMutableArray<__kindof NSIndexPath *> *indexPaths = [_model photosLoaded:photos];
    dispatch_async(dispatch_get_main_queue(), ^{
        [_collection insertItemsAtIndexPaths:indexPaths];
    });
}

- (void)loadMorePhotosIfNeeded
{
    if (_collection.contentOffset.y + _collection.frame.size.height > _collection.contentSize.height - 100) {
        PERFORM_BLOCK_IF_NOT_NIL(self.handlerOnScrollToBottom, self);
    }
}

#pragma mark - UICollectionViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self loadMorePhotosIfNeeded];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    PERFORM_BLOCK_IF_NOT_NIL(self.handlerOnPhotoTap, self, [_model photoAtIndex:indexPath.row]);
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_model numberOfPhotos];
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FBPhotoCollectionViewCell *cell = (FBPhotoCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"FBPhotoCollectionViewCell" forIndexPath:indexPath];
    cell.photo = [_model photoAtIndex:indexPath.row];
    return cell;
}

@end
