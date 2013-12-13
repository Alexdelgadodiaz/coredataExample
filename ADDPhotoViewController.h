//
//  ADDPhotoViewController.h
//  Everpobre
//
//  Created by Alejandro Delgado Diaz on 03/11/13.
//  Copyright (c) 2013 Alejandro Delgado Diaz. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AGTnote;

@interface ADDPhotoViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>


@property (strong, nonatomic) AGTnote *model;
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
- (IBAction)takePhoto:(id)sender;
- (IBAction)deletePhoto:(id)sender;


-(id) initWithModel:(AGTnote *)aNote;

@end
