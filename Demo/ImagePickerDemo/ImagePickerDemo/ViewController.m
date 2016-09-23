//
//  ViewController.m
//  ImagePickerDemo
//
//  Created by hanxt on 16/9/21.
//  Copyright © 2016年 hanxt. All rights reserved.
//

#import "ViewController.h"
#import "ImagePickerController.h"

@interface ViewController () <ImagePickerDelegate>

@property (nonatomic, strong) UIButton *button;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.button];
    self.button.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.button attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.button attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
}

#pragma mark - ImagePickerDelegate
- (void)cancelButtonDidPress:(ImagePickerController *)imagePicker {
    [imagePicker dismissViewControllerAnimated:YES completion:nil];
}

- (void)wrapperDidPress:(ImagePickerController *)imagePicker images:(NSArray<UIImage *> *)images {
    if (images.count <= 0) {
        return;
    }
}

- (void)doneButtonDidPress:(ImagePickerController *)imagePicker images:(NSArray<UIImage *> *)images {
    [imagePicker dismissViewControllerAnimated:YES completion:nil];
}

- (void)buttonTouched:(UIButton *)button {
    ImagePickerController *imagePicker = [[ImagePickerController alloc] init];
    imagePicker.delegate = self;
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (UIButton *)button {
    if (!_button) {
        _button = [[UIButton alloc] init];
        [_button setTitle:@"Show ImagePicker" forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}
@end
