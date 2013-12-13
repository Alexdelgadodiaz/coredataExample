#import "_AGTnoteBook.h"

@interface AGTnoteBook : _AGTnoteBook {}
// Custom logic goes here.

+(instancetype) notebookWithName:(NSString *)aName inContext: (NSManagedObjectContext *) aContext;

@end
