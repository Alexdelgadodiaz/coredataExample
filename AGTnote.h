#import "_AGTnote.h"
#import "AGTnoteBook.h"

@interface AGTnote : _AGTnote <CLLocationManagerDelegate>
// Custom logic goes here.

+(instancetype) noteWithName: (NSString *) aName
                    notebook: (AGTnoteBook *) aNotebook
                   inContext: (NSManagedObjectContext *) aContext;

@end
