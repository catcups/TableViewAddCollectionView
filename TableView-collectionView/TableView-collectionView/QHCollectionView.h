//
//  QHCollectionView.h
//  TableView-collectionView
//
//  Created by qh on 16/5/24.
//  Copyright © 2016年 qh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QHCollectionView : UICollectionView
/**
  *  @frame: 外界传来的frame 即collectionView的大小
  *
  *  @itemSize: 即collectionViewCell上的Item大小
  *
  *  @imagerArr: 外界存放UIImage的数组
  */
- (instancetype)initWithFrame:(CGRect)frame collectionViewItemSize:(CGSize)itemSize withImageArr:(NSArray *)imagerArr;
@end
