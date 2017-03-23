//
//  ViewController.m
//  TextInputViewDemo
//
//  Created by SOTSYS024 on 23/03/17.
//  Copyright © 2017 SOTSYS024. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    TextTweakView *textTweakView;
    TextMenuBar *menuBar;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    menuBar = [[NSBundle mainBundle] loadNibNamed:@"TextTweakView" owner:self options:nil][2];
    textTweakView = [[NSBundle mainBundle] loadNibNamed:@"TextTweakView" owner:self options:nil][0];
    [textTweakView setSelectedTextField:self.textField];
    [self.textField setInputAccessoryView:menuBar];
    self.textField.text = @"Hello User";
    [self.textField becomeFirstResponder];
    __weak ViewController *weakSelf = self;
    menuBar.completion = ^(int index) {
        
        if (index == 1) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.textField setInputView:nil];
                [weakSelf.textField resignFirstResponder];
                [weakSelf.textField becomeFirstResponder];
            });
        } else if (index == 2) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.textField resignFirstResponder];
                [weakSelf.textField setInputView:textTweakView];
                textTweakView.colorWheel.hidden = true;
                textTweakView.viewOthers.hidden = true;
                textTweakView.viewFontList.hidden = false;
                [textTweakView bringSubviewToFront:textTweakView.viewFontList];
                [weakSelf.textField becomeFirstResponder];
                
            });
        } else if (index == 3) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.textField resignFirstResponder];
                [weakSelf.textField setInputView:textTweakView];
                textTweakView.colorWheel.hidden = false;
                textTweakView.viewOthers.hidden = true;
                textTweakView.viewFontList.hidden = true;
                [weakSelf.textField becomeFirstResponder];
            });
        } else if (index == 4) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.textField resignFirstResponder];
                [weakSelf.textField setInputView:textTweakView];
                textTweakView.colorWheel.hidden = true;
                textTweakView.viewOthers.hidden = false;
                textTweakView.viewFontList.hidden = true;
                [weakSelf.textField becomeFirstResponder];
            });
        }
    };    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
