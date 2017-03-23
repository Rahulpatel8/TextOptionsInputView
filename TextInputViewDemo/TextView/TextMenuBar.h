//
//  TextMenuBar.h
//  TextInputViewDemo
//
//  Created by SOTSYS024 on 23/03/17.
//  Copyright © 2017 SOTSYS024. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^MenuCompletion)(int buttonIndex);
@interface TextMenuBar : UIToolbar
@property MenuCompletion completion;
@end
