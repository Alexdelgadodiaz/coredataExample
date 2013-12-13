// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to AGTnoteBook.m instead.

#import "_AGTnoteBook.h"

const struct AGTnoteBookAttributes AGTnoteBookAttributes = {
	.creationDate = @"creationDate",
	.modifyDate = @"modifyDate",
	.name = @"name",
};

const struct AGTnoteBookRelationships AGTnoteBookRelationships = {
	.notes = @"notes",
};

const struct AGTnoteBookFetchedProperties AGTnoteBookFetchedProperties = {
};

@implementation AGTnoteBookID
@end

@implementation _AGTnoteBook

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Notebook" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Notebook";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Notebook" inManagedObjectContext:moc_];
}

- (AGTnoteBookID*)objectID {
	return (AGTnoteBookID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic creationDate;






@dynamic modifyDate;






@dynamic name;






@dynamic notes;

	
- (NSMutableSet*)notesSet {
	[self willAccessValueForKey:@"notes"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"notes"];
  
	[self didAccessValueForKey:@"notes"];
	return result;
}
	






@end
