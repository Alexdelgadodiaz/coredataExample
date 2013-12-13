//
//  ADDPhotoViewController.m
//  Everpobre
//
//  Created by Alejandro Delgado Diaz on 03/11/13.
//  Copyright (c) 2013 Alejandro Delgado Diaz. All rights reserved.
//

#import "ADDPhotoViewController.h"
#import "AGTnote.h"

@interface ADDPhotoViewController ()

@end

@implementation ADDPhotoViewController

-(id) initWithModel:(AGTnote *)aNote{
    
    if (self == [super initWithNibName:nil
                                bundle:nil]) {
        _model = aNote;
    }

    return self;
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    self.photoView.image = self.model.photo;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)takePhoto:(id)sender {
    
    //crear un picker
    UIImagePickerController *picker = [UIImagePickerController new];
    
    //asignar delegado
    picker.delegate = self;
    
    //configurar
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }else{
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    picker.allowsEditing = YES;
    picker.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    //mostrar
    
    [self presentViewController:picker animated:YES completion:^{
      //nada
    }];
}

- (IBAction)deletePhoto:(id)sender {
    
    CGRect oldBounds = self.photoView.bounds;
    
    [UIView animateWithDuration:0.75
                          delay:0
                        options:0
                     animations:^{
                         //cambier el alfa
                         self.photoView.alpha =0;
                         self.photoView.bounds = CGRectZero;
                         self.photoView.transform = CGAffineTransformMakeRotation(M_2_PI);
                     }
                     completion:^(BOOL finished){
                            self.model.photo = nil;
                            self.photoView.image = nil;
                         
                         // reponemos los valores antiguos
                         self.photoView.bounds = oldBounds;
                         self.photoView.alpha =1;
                         self.photoView.transform = CGAffineTransformIdentity;
                         //MIRAR AQUI
                    }];
    

}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    //sacamos del diccionario la imagen editada
    UIImage *photo = [info objectForKey:UIImagePickerControllerEditedImage];
    
    //la encasquetamos al modelo
    self.model.photo = photo;
    
    //quitamos el picker
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
}
@end
