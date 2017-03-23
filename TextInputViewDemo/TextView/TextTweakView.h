//
//  TextTweakView.h
//  TextInputViewDemo
//
//  Created by SOTSYS024 on 23/03/17.
//  Copyright © 2017 SOTSYS024. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ISColorWheel.h"
#import "TextMenuBar.h"

@interface TextTweakView : UIView<UITableViewDelegate,UITableViewDataSource,ISColorWheelDelegate> {
    NSArray *fontList;
    __weak IBOutlet UISlider *sliderAlpha;
    __weak IBOutlet UISlider *SliderShadow;
    
}
@property (nonatomic) ISColorWheel *colorWheel;
@property (weak, nonatomic) IBOutlet UIView *viewFontList;
@property (weak, nonatomic) IBOutlet UITableView *tableViewFontList;
@property (weak, nonatomic) IBOutlet UIView *viewColors;
@property (weak, nonatomic) IBOutlet UIView *viewOthers;
@property (weak, nonatomic) UITextField *selectedTextField;
@end
