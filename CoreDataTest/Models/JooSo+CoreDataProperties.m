//
//  JooSo+CoreDataProperties.m
//  CoreDataTest
//
//  Created by 김학철 on 2019/12/30.
//  Copyright © 2019 김학철. All rights reserved.
//
//

#import "JooSo+CoreDataProperties.h"

@implementation JooSo (CoreDataProperties)

+ (NSFetchRequest<JooSo *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"JooSo"];
}

@dynamic createDate;
@dynamic name;
@dynamic toThumnail;
@dynamic toPhoneNumber;

@end
