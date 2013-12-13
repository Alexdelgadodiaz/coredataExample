// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to AGTnote.h instead.

#import <CoreData/CoreData.h>


extern const struct AGTnoteAttributes {
	__unsafe_unretained NSString *creationDate;
	__unsafe_unretained NSString *latitude;
	__unsafe_unretained NSString *longitude;
	__unsafe_unretained NSString *modifyDate;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *photo;
	__unsafe_unretained NSString *text;
} AGTnoteAttributes;

extern const struct AGTnoteRelationships {
	__unsafe_unretained NSString *notebook;
} AGTnoteRelationships;

extern const struct AGTnoteFetchedProperties {
} AGTnoteFetchedProperties;

@class AGTnoteBook;






@class NSObject;


@interface AGTnoteID : NSManagedObjectID {}
@end

@interface _AGTnote : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (AGTnoteID*)objectID;





@property (nonatomic, strong) NSDate* creationDate;



//- (BOOL)validateCreationDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* latitude;



@property double latitudeValue;
- (double)latitudeValue;
- (void)setLatitudeValue:(double)value_;

//- (BOOL)validateLatitude:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* longitude;



@property double longitudeValue;
- (double)longitudeValue;
- (void)setLongitudeValue:(double)value_;

//- (BOOL)validateLongitude:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* modifyDate;



//- (BOOL)validateModifyDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) id photo;



//- (BOOL)validatePhoto:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* text;



//- (BOOL)validateText:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) AGTnoteBook *notebook;

//- (BOOL)validateNotebook:(id*)value_ error:(NSError**)error_;





@end

@interface _AGTnote (CoreDataGeneratedAccessors)

@end

@interface _AGTnote (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveCreationDate;
- (void)setPrimitiveCreationDate:(NSDate*)value;




- (NSNumber*)primitiveLatitude;
- (void)setPrimitiveLatitude:(NSNumber*)value;

- (double)primitiveLatitudeValue;
- (void)setPrimitiveLatitudeValue:(double)value_;




- (NSNumber*)primitiveLongitude;
- (void)setPrimitiveLongitude:(NSNumber*)value;

- (double)primitiveLongitudeValue;
- (void)setPrimitiveLongitudeValue:(double)value_;




- (NSDate*)primitiveModifyDate;
- (void)setPrimitiveModifyDate:(NSDate*)value;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (id)primitivePhoto;
- (void)setPrimitivePhoto:(id)value;




- (NSString*)primitiveText;
- (void)setPrimitiveText:(NSString*)value;





- (AGTnoteBook*)primitiveNotebook;
- (void)setPrimitiveNotebook:(AGTnoteBook*)value;


@end
