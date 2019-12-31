//
//  JooSo+CoreDataProperties.h
//  CoreDataTest
//
//  Created by 김학철 on 2019/12/30.
//  Copyright © 2019 김학철. All rights reserved.
//
//

#import "JooSo+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface JooSo (CoreDataProperties)

+ (NSFetchRequest<JooSo *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *createDate;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) Thumnail *toThumnail;
@property (nullable, nonatomic, retain) NSOrderedSet<PhonNumber *> *toPhoneNumber;

@end

@interface JooSo (CoreDataGeneratedAccessors)

- (void)insertObject:(PhonNumber *)value inToPhoneNumberAtIndex:(NSUInteger)idx;
- (void)removeObjectFromToPhoneNumberAtIndex:(NSUInteger)idx;
- (void)insertToPhoneNumber:(NSArray<PhonNumber *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeToPhoneNumberAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInToPhoneNumberAtIndex:(NSUInteger)idx withObject:(PhonNumber *)value;
- (void)replaceToPhoneNumberAtIndexes:(NSIndexSet *)indexes withToPhoneNumber:(NSArray<PhonNumber *> *)values;
- (void)addToPhoneNumberObject:(PhonNumber *)value;
- (void)removeToPhoneNumberObject:(PhonNumber *)value;
- (void)addToPhoneNumber:(NSOrderedSet<PhonNumber *> *)values;
- (void)removeToPhoneNumber:(NSOrderedSet<PhonNumber *> *)values;

@end

NS_ASSUME_NONNULL_END
