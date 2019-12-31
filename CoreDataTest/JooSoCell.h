//
//  JooSoCell.h
//  CoreDataTest
//
//  Created by 김학철 on 2019/12/30.
//  Copyright © 2019 김학철. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "JooSo+CoreDataProperties.h" 
#import "PhonNumber+CoreDataProperties.h"
#import "Thumnail+CoreDataProperties.h"
NS_ASSUME_NONNULL_BEGIN

@interface JooSoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lbName;
@property (weak, nonatomic) IBOutlet UIImageView *ivThumnail;
@property (weak, nonatomic) IBOutlet UILabel *lbRegiDate;
@property (strong, nonatomic) IBOutletCollection(UIStackView) NSArray *arrSvPhone;
- (void)configurationData:(JooSo *)jooso;
@end

NS_ASSUME_NONNULL_END
