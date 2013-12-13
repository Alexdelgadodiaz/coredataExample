// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to AGTnoteBook.h instead.

#import <CoreData/CoreData.h>


extern const struct AGTnoteBookAttributes {
	__unsafe_unretained NSString *creationDate;
	__unsafe_unretained NSString *modifyDate;
	__unsafe_unretained NSString *name;
} AGTnoteBookAttributes;

extern const struct AGTnoteBookRelationships {
	__unsafe_unretained NSString *notes;
} AGTnoteBookRelationships;

extern const struct AGTnoteBookFetchedProperties {
} AGTnoteBookFetchedProperties;

@class AGTnote;





@interface AGTnoteBookID : NSManagedObjectID {}
@end

@interface _AGTnoteBook : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (AGTnoteBookID*)objectID;





@property (nonatomic, strong) NSDate* creationDate;



//- (BOOL)validateCreationDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* modifyDate;



//- (BOOL)validateModifyDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *notes;

- (NSMutableSet*)notesSet;





@end

@interface _AGTnoteBook (CoreDataGeneratedAccessors)

- (void)addNotes:(NSSet*)value_;
- (void)removeNotes:(NSSet*)value_;
- (void)addNotesObject:(AGTnote*)value_;
- (void)removeNotesObject:(AGTnote*)value_;

@end

@interface _AGTnoteBook (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveCreationDate;
- (void)setPrimitiveCreationDate:(NSDate*)value;




- (NSDate*)primitiveModifyDate;
- (void)setPrimitiveModifyDate:(NSDate*)value;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;





- (NSMutableSet*)primitiveNotes;
- (void)setPrimitiveNotes:(NSMutableSet*)value;


@end
