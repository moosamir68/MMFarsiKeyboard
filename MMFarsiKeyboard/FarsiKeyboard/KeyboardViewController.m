//
//  KeyboardViewController.m
//  FarsiKeyboard
//
//  Created by Moosa Mir on 4/15/17.
//  Copyright © 2017 Moosa Mir. All rights reserved.
//
#define DEFAULT_FONT_NAME @"BNazanin"

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
    [self addGestureToKeyboard];
    [self updateKeyboardUI];
    self.inputView = (UIInputView*)self.farsiKeyboard;
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

#pragma mark - keyboards
- (void)addGestureToKeyboard{
    [self.farsiKeyboard.buttonEnter addTarget:self action:@selector(userDidTapOnEnter) forControlEvents:UIControlEventTouchUpInside];
    [self.farsiKeyboard.buttonSpace addTarget:self action:@selector(userDidTapOnSpace) forControlEvents:UIControlEventTouchUpInside];
    [self.farsiKeyboard.buttonLanguge addTarget:self action:@selector(advanceToNextInputMode) forControlEvents:UIControlEventTouchUpInside];
    [self.farsiKeyboard.buttonDelete addTarget:self action:@selector(userDidTapOnDelete) forControlEvents:UIControlEventTouchUpInside];
    
    for(UIButton *button in self.farsiKeyboard.keysArray){
        [button addTarget:self action:@selector(userDidTapOnKeys:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)userDidTapOnEnter{
    [self.textDocumentProxy insertText:@"\n"];
}

- (void)userDidTapOnSpace{
    [self.textDocumentProxy insertText:@" "];
}

- (void)userDidTapOnDelete{
    [self.textDocumentProxy deleteBackward];
}

- (void)userDidTapOnKeys:(UIButton*)button{
    [self.textDocumentProxy insertText:[button currentTitle]];
}

- (void)updateKeyboardUI{
    [self.farsiKeyboard.buttonEnter.layer setCornerRadius:4.0f];
    [self.farsiKeyboard.buttonEnter.layer setMasksToBounds:YES];
    
    [self.farsiKeyboard.buttonSpace.layer setCornerRadius:4.0f];
    [self.farsiKeyboard.buttonSpace.layer setMasksToBounds:YES];
    
    [self.farsiKeyboard.buttonLanguge.layer setCornerRadius:4.0f];
    [self.farsiKeyboard.buttonLanguge.layer setMasksToBounds:YES];
    
    [self.farsiKeyboard.buttonDelete.layer setCornerRadius:4.0f];
    [self.farsiKeyboard.buttonDelete.layer setMasksToBounds:YES];
    
    for(UIButton *button in self.farsiKeyboard.keysArray){
        [button.layer setCornerRadius:4.0f];
        [button.layer setMasksToBounds:YES];
        [button.titleLabel setFont:[UIFont fontWithName:DEFAULT_FONT_NAME size:17.0f]];
    }
}
@end
