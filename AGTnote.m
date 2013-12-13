#import "AGTnote.h"


@interface AGTnote ()

// Private interface goes here.
@property (strong, nonatomic) CLLocationManager *manager;

@end


@implementation AGTnote

// Custom logic goes here.

@synthesize manager = _manager;

+(instancetype) noteWithName: (NSString *) aName
                    notebook: (AGTnoteBook *) aNotebook
                   inContext:(NSManagedObjectContext *) aContext{
    
    AGTnote *note = [self insertInManagedObjectContext:aContext];
    note.name = aName;
    note.creationDate= [NSDate date];
    note.modifyDate= [NSDate date];
    note.notebook= aNotebook;
    
    return note;
}


#pragma mark - KVO
//alta
- (void) setupKVO{
    
    NSArray *keys =@[@"name", @"text", @"photo", @"notebook"];
    
    for (NSString *key in keys){
        [self addObserver:self
               forKeyPath:key options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                  context:NULL];
        
    }
}

//baja
-(void) tearDownKVO {
    NSArray *keys =@[@"name", @"text", @"photo", @"notebook"];
    
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

- (void) startLocationManager{
    
    self.manager = [[CLLocationManager alloc]init];
    self.manager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    
    [self.manager startUpdatingLocation];
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    
    CLLocation *loc  = [locations lastObject];
    
    self.latitudeValue = loc.coordinate.latitude;
    self.longitudeValue = loc.coordinate.longitude;
    
    //hacer una geolocalizacion inversa
    
    //parametros el manager
    [manager stopUpdatingLocation];
}


@end

