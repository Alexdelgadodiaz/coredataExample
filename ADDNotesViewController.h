//
//  ADDNotesViewController.h
//  Everpobre
//
//  Created by Alejandro Delgado Diaz on 02/11/13.
//  Copyright (c) 2013 Alejandro Delgado Diaz. All rights reserved.
//


#import "AGTCoreDataTableViewController.h"
@class AGTnoteBook; //es lo mismo que hacer el import, pero mejor porque puedes crear una llamada continua de clases personales que no interesa, AGTnoteBook esta importado en el .m


@interface ADDNotesViewController : AGTCoreDataTableViewController

- (id) initWithFetchedResultsController:(NSFetchedResultsController *)aFetchedResultsController style:(UITableViewStyle)aStyle notebook: (AGTnoteBook *) aNoteBook;

@end
