//
//  AddViewController.m
//  CoreDataTest
//
//  Created by 김학철 on 2019/12/29.
//  Copyright © 2019 김학철. All rights reserved.
//

#import "AddViewController.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "JooSo+CoreDataProperties.h"
#import "Thumnail+CoreDataProperties.h"
#import "PhonNumber+CoreDataProperties.h"

@interface AddViewController () <UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnSave;
@property (weak, nonatomic) IBOutlet UITextField *tfName;
@property (weak, nonatomic) IBOutlet UIButton *btnProfile;

@property (weak, nonatomic) IBOutlet UITextField *tfMobil;
@property (weak, nonatomic) IBOutlet UITextField *tfHome;
@property (weak, nonatomic) IBOutlet UITextField *tfCompony;
@property (weak, nonatomic) IBOutlet UITextField *tfFax;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomScrollView;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationHandler:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationHandler:) name:UIKeyboardWillHideNotification object:nil];
}
- (IBAction)textFieldEditingChanged:(UITextField *)sender {
}

- (IBAction)onClickedButton:(id)sender {
    if (sender == _btnSave) {

        NSManagedObjectContext *context = [AppDelegate instance].persistentContainer.viewContext;
        JooSo *js = [NSEntityDescription insertNewObjectForEntityForName:@"JooSo" inManagedObjectContext:context];
        
        js.name = _tfName.text;
        js.createDate = [NSDate date];
        
        
        Thumnail *th = [NSEntityDescription insertNewObjectForEntityForName:@"Thumnail" inManagedObjectContext:context];
        
        UIImage *img = nil;
        if (_btnProfile.imageView.image != nil) {
            img = _btnProfile.imageView.image;
        }
        else {
            [UIImage imageNamed:@"gangsora.jpg"];
        }
        th.image = img;
        js.toThumnail = th;
        
        PhonNumber *phone = nil;
        if (_tfMobil.text.length > 0) {
            phone = [NSEntityDescription insertNewObjectForEntityForName:@"PhonNumber" inManagedObjectContext:context];
            
            phone.isMainPoint = YES;
            phone.label = @"휴대폰";
            phone.number = _tfMobil.text;
            
            [js addToPhoneNumberObject:phone];
        }
        
        if (_tfHome.text.length > 0) {
            phone = [NSEntityDescription insertNewObjectForEntityForName:@"PhonNumber" inManagedObjectContext:context];
            
            phone.isMainPoint = NO;
            phone.label = @"집";
            phone.number = _tfHome.text;
            [js addToPhoneNumberObject:phone];
        }
        
        if (_tfCompony.text.length > 0) {
            phone = [NSEntityDescription insertNewObjectForEntityForName:@"PhonNumber" inManagedObjectContext:context];
            
            phone.isMainPoint = NO;
            phone.label = @"회사";
            phone.number = _tfCompony.text;
            [js addToPhoneNumberObject:phone];
        }
        if (_tfFax.text.length > 0) {
            phone = [NSEntityDescription insertNewObjectForEntityForName:@"PhonNumber" inManagedObjectContext:context];
            
            phone.isMainPoint = NO;
            phone.label = @"회사팩스";
            phone.number = _tfFax.text;
            [js addToPhoneNumberObject:phone];
        }
        
        NSError *error = nil;
        if (![[AppDelegate instance].persistentContainer.viewContext save:&error]) {
            NSLog(@"error: %@", error.localizedDescription);
        }
        else {
            NSLog(@"save success");
        }
        
        [self.navigationController popViewControllerAnimated:YES];
    }
    else if (sender == _btnProfile) {
        __block UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"선택해주세요" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        __weak typeof(self) weakSelf = self;
        UIAlertAction *actionCamera = [UIAlertAction actionWithTitle:@"카메라" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [alert dismissViewControllerAnimated:NO completion:^{
                [weakSelf showImagePicker:UIImagePickerControllerSourceTypeCamera];
            }];
        }];
        UIAlertAction *actionGalery = [UIAlertAction actionWithTitle:@"가져오기" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [alert dismissViewControllerAnimated:NO completion:^{
                [weakSelf showImagePicker:UIImagePickerControllerSourceTypePhotoLibrary];
            }];
        }];
        UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"취소" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [alert dismissViewControllerAnimated:NO completion:nil];
        }];
        
        [alert addAction:actionCamera];
        [alert addAction:actionGalery];
        [alert addAction:actionCancel];
        
        alert.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (void)showImagePicker:(UIImagePickerControllerSourceType)sourceType {
    UIImagePickerController *vc = [[UIImagePickerController alloc] init];
    vc.delegate = self;
    vc.sourceType = sourceType;
    [self presentViewController:vc animated:YES completion:nil];
}
- (void)notificationHandler:(NSNotification *)notification {
    
    CGFloat height = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    CGFloat duration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    if ([notification.name isEqualToString:UIKeyboardWillShowNotification]) {
        
        [UIView animateWithDuration:duration animations:^{
            self.bottomScrollView.constant = height - 34;
        }];
    
    }
    else if ([notification.name isEqualToString:UIKeyboardWillHideNotification]) {
        [UIView animateWithDuration:duration animations:^{
            self.bottomScrollView.constant = 0;
        }];
    }
}


#pragma mark - UIimagePickerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    
    UIImage *originImg = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    CGFloat with = 100;
    
    CGFloat rateW = originImg.size.width/with;
    
    if (originImg) {
        UIImage *img = [UIImage imageWithCGImage:[originImg CGImage] scale:rateW orientation:originImg.imageOrientation];
    
        [_btnProfile setImage:img forState:UIControlStateNormal];
    }
    
    [picker dismissViewControllerAnimated:NO completion:nil];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:NO completion:nil];
}
@end
