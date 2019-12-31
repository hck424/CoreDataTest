//
//  PhonNumber+CoreDataProperties.h
//  CoreDataTest
//
//  Created by 김학철 on 2019/12/30.
//  Copyright © 2019 김학철. All rights reserved.
//
//

#import "PhonNumber+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface PhonNumber (CoreDataProperties)

+ (NSFetchRequest<PhonNumber *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *number;
@property (nonatomic) BOOL isMainPoint;
@property (nullable, nonatomic, copy) NSString *label;
@property (nullable, nonatomic, retain) JooSo *toJooSo;

@end

NS_ASSUME_NONNULL_END
