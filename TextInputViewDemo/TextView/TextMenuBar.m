//
//  TextMenuBar.m
//  TextInputViewDemo
//
//  Created by SOTSYS024 on 23/03/17.
//  Copyright © 2017 SOTSYS024. All rights reserved.
//

#import "TextMenuBar.h"

@implementation TextMenuBar

-(IBAction)optionClicked:(UIBarButtonItem*)sender {
    if (_completion) {
        _completion((int)sender.tag);
    }
    
    if (self.delegate) {
        [self.delegate didSelectBarButton:sender];
    }
}

@end
