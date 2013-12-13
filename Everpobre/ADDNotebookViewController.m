//
//  ADDNotebookViewController.m
//  Everpobre
//
//  Created by Alejandro Delgado Diaz on 02/11/13.
//  Copyright (c) 2013 Alejandro Delgado Diaz. All rights reserved.
//

#import "ADDNotebookViewController.h"
#import "AGTnoteBook.h"
#import "AGTnote.h"
#import "ADDNotesViewController.h"


@interface ADDNotebookViewController ()

@end

@implementation ADDNotebookViewController



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
	// Do any additional setup after loading the view.
    
    UIBarButtonItem *btn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNoteBook:)];
    
    [self.navigationItem setRightBarButtonItem:btn];
    
}

-(void) addNoteBook:(UIBarButtonItem *) sender{
    
    AGTnoteBook *nb = [AGTnoteBook notebookWithName:@"otro notebook"
                                          inContext:self.fetchedResultsController.managedObjectContext];
    
    NSLog(@"creando una nueva libreta");
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Data Source

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //Averiguar la libreta en cuestion
    AGTnoteBook *nb = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    //Crear una celda
    static NSString *cellId = @"notebook";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        //no haria nada, ninguna que creciclar y hay que crearla de cero
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
                                     reuseIdentifier:cellId];
        
    }
    
    //Sincronizar  libreta y celda
    
    cell.textLabel.text=nb.name;
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateStyle = NSDateFormatterLongStyle;
    
    cell.detailTextLabel.text = [fmt stringFromDate:nb.modifyDate];
    
    //
    cell.accessoryType = UITableViewCellAccessoryDetailButton;
    
    return cell;
    
}

#pragma mark - tableView Delegate


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //averiguar la libreta
    AGTnoteBook *nb = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    //crear el fetch request
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[AGTnote entityName]];
    
    //configurar el fetch request
    req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES],
                            [NSSortDescriptor sortDescriptorWithKey:@"modifyDate" ascending:NO]];
    
    
    //predicado, algo nuevo que vale con cualquier cosa, nsstringWithFormat...
    req.predicate = [NSPredicate predicateWithFormat:@"self.notebook = %@", nb];
    
    //crear el fetchedResults
    NSFetchedResultsController *fetched = [[NSFetchedResultsController alloc]initWithFetchRequest:req
                                                                             managedObjectContext:self.fetchedResultsController.managedObjectContext
                                                                               sectionNameKeyPath:nil cacheName:nil];
    
    //crear el notesVC
    
    ADDNotesViewController *nVC= [[ADDNotesViewController alloc]initWithFetchedResultsController:fetched style:UITableViewStylePlain notebook:nb];
    
    //hacer un push
    [self.navigationController pushViewController:nVC animated:YES];
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    
    //averiguar el notebook
    
    
    //crear una instancia de notebookVC
    
    
    //mostrarlo de forma modal
    
    
}

@end
