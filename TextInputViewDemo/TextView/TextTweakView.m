//
//  TextTweakView.m
//  TextInputViewDemo
//
//  Created by SOTSYS024 on 23/03/17.
//  Copyright © 2017 SOTSYS024. All rights reserved.
//

#import "TextTweakView.h"

@implementation TextTweakView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupView];
    }
    return self;
}

-(void)setupView {
    //Font List view setup
    fontList = [UIFont familyNames];
    [self.tableViewFontList setDelegate:self];
    [self.tableViewFontList setDataSource:self];
    [self.tableViewFontList reloadData];
    [self.viewFontList setHidden:true];
    //Color view setup
    _colorWheel = [[ISColorWheel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    _colorWheel.continuous = true;
    _colorWheel.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, _colorWheel.frame.size.height/2 + 10);
    __weak TextTweakView *weakSelf = self;
    _colorWheel.completion = ^(UIColor *color){
        weakSelf.selectedTextField.textColor = color;
    };
    [self addSubview:_colorWheel];
    self.selectedTextField.layer.shadowOpacity = 0;
    self.selectedTextField.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    self.selectedTextField.layer.shadowOffset = CGSizeMake(0, 2);
    self.selectedTextField.layer.shadowRadius = 0;
}

- (IBAction)sliderAlphaChanged:(UISlider *)sender {
    self.selectedTextField.alpha = sender.value;
}

- (IBAction)sliderShadowChanged:(UISlider *)sender {
    self.selectedTextField.layer.shadowOpacity = sender.value;
}

#pragma mark - UItableview DataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return fontList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"recell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"recell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Hello %d",(int)indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:[fontList objectAtIndex:indexPath.row] size:25];
    return cell;
}
#pragma mark - Tableview Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.selectedTextField setFont:[UIFont fontWithName:[fontList objectAtIndex:indexPath.row] size:25]];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
