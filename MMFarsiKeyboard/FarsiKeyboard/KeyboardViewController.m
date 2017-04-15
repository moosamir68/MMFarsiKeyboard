//
//  KeyboardViewController.m
//  FarsiKeyboard
//
//  Created by Moosa Mir on 4/15/17.
//  Copyright © 2017 Moosa Mir. All rights reserved.
//

#import "KeyboardViewController.h"
#import "FarsiKeyboard.h"

@interface KeyboardViewController ()
@property (nonatomic, strong) FarsiKeyboard *farsiKeyboard;

@end

@implementation KeyboardViewController

- (void)updateViewConstraints {
    [super updateViewConstraints];
    
    // Add custom view sizing constraints here
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Perform custom UI setup here
    
    self.farsiKeyboard = [[[NSBundle mainBundle] loadNibNamed:@"FarsiKeyboard" owner:nil options:nil] objectAtIndex:0];
    self.inputView = (UIInputView*)self.farsiKeyboard;
    
//    [self.nextKeyboardButton addTarget:self action:@selector(handleInputModeListFromView:withEvent:) forControlEvents:UIControlEventAllTouchEvents];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated
}

- (void)textWillChange:(id<UITextInput>)textInput {
    // The app is about to change the document's contents. Perform any preparation here.
}

- (void)textDidChange:(id<UITextInput>)textInput {
    // The app has just changed the document's contents, the document context has been updated.
    
    UIColor *textColor = nil;
    if (self.textDocumentProxy.keyboardAppearance == UIKeyboardAppearanceDark) {
        textColor = [UIColor whiteColor];
    } else {
        textColor = [UIColor blackColor];
    }
}

@end
