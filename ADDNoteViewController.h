//
//  ADDNoteViewController.h
//  Everpobre
//
//  Created by Alejandro Delgado Diaz on 03/11/13.
//  Copyright (c) 2013 Alejandro Delgado Diaz. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AGTnote;


@interface ADDNoteViewController : UIViewController

@property (strong, nonatomic) AGTnote *model;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *textView;
- (IBAction)displayPhoto:(id)sender;
- (IBAction)removeKeyboard:(id)sender;

- (id) initWithModel:(AGTnote *)aNote;


@end
