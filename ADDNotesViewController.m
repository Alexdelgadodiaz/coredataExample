//
//  ADDNotesViewController.m
//  Everpobre
//
//  Created by Alejandro Delgado Diaz on 02/11/13.
//  Copyright (c) 2013 Alejandro Delgado Diaz. All rights reserved.
//

#import "ADDNotesViewController.h"
#import "AGTnote.h"
#import "ADDNoteViewController.h"

@interface ADDNotesViewController ()

@property (strong, nonatomic) AGTnoteBook *notebook;

@end

@implementation ADDNotesViewController

- (id) initWithFetchedResultsController:(NSFetchedResultsController *)aFetchedResultsController style:(UITableViewStyle)aStyle notebook: (AGTnoteBook *) aNoteBook{
    
    if (self = [super initWithFetchedResultsController:aFetchedResultsController style:aStyle]) {
        _notebook = aNoteBook;
    }
    
    return self;
}


- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    UIBarButtonItem *btn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNote:)];
    
    self.navigationItem.rightBarButtonItem = btn;
    
    
}

- (void) addNote:(UIBarButtonItem *) sender{
    
    AGTnote *note = [AGTnote noteWithName:@"New Note" notebook:self.notebook inContext:self.notebook.managedObjectContext];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //averiguar la nota
    AGTnote *note = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    
    //obtener una celda
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
                                     reuseIdentifier:cellId];
    }
    //sincronizar la celda
    cell.textLabel.text = note.name;
    cell.imageView.image = note.photo;
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateStyle = NSDateFormatterMediumStyle;
    cell.detailTextLabel.text = [fmt stringFromDate:note.modifyDate];
    
    return cell;


}


#pragma mark - tableView Delegate


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //averiguar la nota
    AGTnote *note = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    //crear el controlador de la nota
    
    ADDNoteViewController *noteVC= [[ADDNoteViewController alloc]initWithModel: note];
    
    //hacer un push
    [self.navigationController pushViewController:noteVC animated:YES];
}
@end
