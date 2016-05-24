//
//  QHCollectionView.m
//  TableView-collectionView
//
//  Created by qh on 16/5/24.
//  Copyright © 2016年 qh. All rights reserved.
//

#import "QHCollectionView.h"

#define cellID @"cellID"
@interface QHCollectionView ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionViewFlowLayout *layout;
@property (nonatomic, assign) CGSize ItemSize;
@property (nonatomic, strong) NSArray *ImageArray;
@end
@implementation QHCollectionView
- (UICollectionViewFlowLayout *)layout {
    if (!_layout) {
        _layout = [[UICollectionViewFlowLayout alloc] init];
        _layout.itemSize = self.ItemSize;
        _layout.minimumLineSpacing = 10.0;
        _layout.minimumInteritemSpacing = 0.0;
        _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    }
    return _layout;
}
- (instancetype)initWithFrame:(CGRect)frame collectionViewItemSize:(CGSize)itemSize withImageArr:(NSArray *)imagerArr {
    _ItemSize = itemSize;
    if (self = [super initWithFrame:frame collectionViewLayout:self.layout]) {
//        [self setLayout:self.layout];
        _ImageArray = imagerArr;
        self.bounces = NO;
        self.pagingEnabled = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellID];
    }
    return self;
}

#pragma mark - UICollectionViewDelegate --- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.ImageArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    UIImageView *imageV = [[UIImageView alloc] initWithImage:_ImageArray[indexPath.row]];
    CGRect imageFrame = imageV.frame;
    imageFrame.size = _ItemSize;
    imageV.frame = imageFrame;
    [cell.contentView addSubview:imageV];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"第%ld分区--第%ld个Item", indexPath.section, indexPath.row);
}

@end
