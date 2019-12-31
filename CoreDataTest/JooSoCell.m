//
//  JooSoCell.m
//  CoreDataTest
//
//  Created by 김학철 on 2019/12/30.
//  Copyright © 2019 김학철. All rights reserved.
//

#import "JooSoCell.h"

@implementation JooSoCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
- (void)configurationData:(JooSo *)jooso {
    
    _lbName.text = jooso.name;
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    df.dateFormat = @"yy.MM.dd HH:mm";
    NSString *strDate = [df stringFromDate:jooso.createDate];
    _lbRegiDate.text = strDate;
    _ivThumnail.image = jooso.toThumnail.image;
    
    NSOrderedSet *set = jooso.toPhoneNumber;
    
    for (NSInteger i = 0; i < _arrSvPhone.count; i++) {
        UIStackView *sv = [_arrSvPhone objectAtIndex:i];
        if (i < set.count) {
            sv.hidden = NO;
            PhonNumber *phone = [set objectAtIndex:i];
            UILabel *lbTitle = [sv viewWithTag:100];
            UILabel *lbNumber = [sv viewWithTag:200];
            
            lbTitle.text = phone.label;
            lbNumber.text = phone.number;
        }
        else {
            sv.hidden = YES;
        }
    }
}
@end
