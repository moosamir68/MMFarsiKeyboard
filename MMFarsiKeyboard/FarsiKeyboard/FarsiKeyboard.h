//
//  FarsiKeyboard.h
//  MMFarsiKeyboard
//
//  Created by Moosa Mir on 4/15/17.
//  Copyright © 2017 Moosa Mir. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FarsiKeyboard : UIView
@property (weak, nonatomic) IBOutlet UIButton *buttonEnter;
@property (weak, nonatomic) IBOutlet UIButton *buttonSpace;
@property (weak, nonatomic) IBOutlet UIButton *buttonLanguge;
@property (weak, nonatomic) IBOutlet UIButton *buttonDelete;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *keysArray;
@end
