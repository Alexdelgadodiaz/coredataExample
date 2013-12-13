#import "AGTnoteBook.h"


@interface AGTnoteBook ()

// Private interface goes here.

@end


@implementation AGTnoteBook

// Custom logic goes here.



+(instancetype) notebookWithName:(NSString *)aName
                       inContext: (NSManagedObjectContext *) aContext{
    AGTnoteBook *nb = [AGTnoteBook insertInManagedObjectContext:aContext];
    
    nb.name = aName;
    nb.creationDate= [NSDate date];
    nb.modifyDate = [NSDate date];
    
    return nb;
    
    
    
}
#pragma mark - KVO
//alta
- (void) setupKVO{
    
    NSArray *keys =@[@"name", @"notes"];
    
    for (NSString *key in keys){
        [self addObserver:self
               forKeyPath:key options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                  context:NULL];
        
    }
}

//baja
-(void) tearDownKVO {
    NSArray *keys =@[@"name", @"notes"];
    
    for (NSString *key in keys){
        [self removeObserver:self
                  forKeyPath:key];
        
        
    }
    
}


//recepcion
- (void) observeValueForKeyPath:(NSString *)keyPath
                       ofObject:(id)object
                         change:(NSDictionary *)change
                        context:(void *)context{
    
    //actualizo  modification date
    self.modifyDate = [NSDate date];
    
}

//mensajes de coredata
#pragma mark - lifecycle
-(void) awakeFromInsert{ //solo una vez cuando se crea
    [super awakeFromInsert];
    [self setupKVO];
}

- (void)awakeFromFetch{ //cada vez que se modifica
    [super awakeFromFetch];
    [self setupKVO];
}

- (void) willTurnIntoFault{
    [super willTurnIntoFault];
    [self tearDownKVO];
}

@end
