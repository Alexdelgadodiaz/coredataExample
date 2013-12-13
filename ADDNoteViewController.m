//
//  ADDNoteViewController.m
//  Everpobre
//
//  Created by Alejandro Delgado Diaz on 03/11/13.
//  Copyright (c) 2013 Alejandro Delgado Diaz. All rights reserved.
//

#import "ADDNoteViewController.h"
#import "AGTnote.h"
#import "ADDPhotoViewController.h"

@interface ADDNoteViewController ()

@end

@implementation ADDNoteViewController

- (id) initWithModel:(AGTnote *)aNote{
    if (self == [super initWithNibName:nil
                                bundle:nil]) {
        _model = aNote;
    }
    
    return self;
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //Sincronizar modelo -> vista
    self.textField.text = self.model.name;
    self.textView.text = self.model.text;
    
    //Alta en Notificación
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    [center addObserver:self
               selector:@selector(keyboardWillAppear:)
                   name:UIKeyboardWillShowNotification
                 object:nil];
    
    [center addObserver:self
               selector:@selector(keyboardWillDisappear:)
                   name:UIKeyboardWillHideNotification
                 object:nil];
    
}

- (void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    self.model.name = self.textField.text;
    self.model.text = self.textView.text;
    
    NSNotificationCenter *center= [NSNotificationCenter defaultCenter];
    [center removeObserver:self];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)displayPhoto:(id)sender {
    
    //creo el photoVC
    ADDPhotoViewController *pVC = [[ADDPhotoViewController alloc]initWithModel:self.model];
    
    
    //hago el push
    
    [self.navigationController pushViewController:pVC animated:YES];
}

- (IBAction)removeKeyboard:(id)sender {
    
    [self.view endEditing:YES];
    

}

- (void)keyboardWillAppear:(NSNotification *)notification{
    
    //extraer el userInfo
    NSDictionary *info = notification.userInfo;
    
    //extraer el frame (CGRect) del teclado
    NSValue *frameValue= [info objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGRect frame = [frameValue CGRectValue];
    
    //extraer la duracion

    double duration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey]doubleValue];
    
    //calcular el frame del textView
    double newHeight = self.textView.frame.size.height - frame.size.height-20+59;
    
    CGRect newFrame = CGRectMake(self.textView.frame.origin.x, self.textView.frame.origin.y, self.textView.frame.size.width, newHeight);
    
    //animar el cambio
    [UIView animateKeyframesWithDuration:duration
                                   delay:0
                                 options:0
                              animations:^{
                                    self.textView.frame = newFrame;
                              }
                              completion:nil];

    
    
}

- (void)keyboardWillDisappear:(NSNotification *)notification{
    
    //extraer el userInfo
    NSDictionary *info = notification.userInfo;
    
    //extraer el frame (CGRect) del teclado
    NSValue *frameValue= [info objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGRect frame = [frameValue CGRectValue];
    
    //extraer la duracion
    
    double duration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey]doubleValue];
    
    //calcular el frame del textView
    double newHeight = self.textView.frame.size.height + frame.size.height+20-59;
    
    CGRect newFrame = CGRectMake(self.textView.frame.origin.x, self.textView.frame.origin.y, self.textView.frame.size.width, newHeight);
    
    //animar el cambio
    [UIView animateKeyframesWithDuration:duration
                                   delay:0
                                 options:0
                              animations:^{
                                  self.textView.frame = newFrame;
                              }
                              completion:nil];
    
}


@end
