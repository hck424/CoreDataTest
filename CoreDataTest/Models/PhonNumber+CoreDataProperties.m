//
//  PhonNumber+CoreDataProperties.m
//  CoreDataTest
//
//  Created by 김학철 on 2019/12/30.
//  Copyright © 2019 김학철. All rights reserved.
//
//

#import "PhonNumber+CoreDataProperties.h"

@implementation PhonNumber (CoreDataProperties)

+ (NSFetchRequest<PhonNumber *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"PhonNumber"];
}

@dynamic number;
@dynamic isMainPoint;
@dynamic label;
@dynamic toJooSo;

@end
