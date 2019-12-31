//
//  Thumnail+CoreDataProperties.h
//  CoreDataTest
//
//  Created by 김학철 on 2019/12/31.
//  Copyright © 2019 김학철. All rights reserved.
//
//

#import "Thumnail+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Thumnail (CoreDataProperties)

+ (NSFetchRequest<Thumnail *> *)fetchRequest;

@property (nullable, nonatomic, retain) UIImage *image;
@property (nullable, nonatomic, retain) JooSo *toJooSo;

@end

NS_ASSUME_NONNULL_END
