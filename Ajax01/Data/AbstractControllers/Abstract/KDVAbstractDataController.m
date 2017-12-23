//
//  KDVAbstractDataController.m
//  Ajax01
//
//  Created by Kenn Villegas on 12/22/17.
//  Copyright © 2017 Kenn Villegas. All rights reserved.
//

#import "KDVAbstractDataController.h"

@implementation KDVAbstractDataController
@synthesize applicationName = _applicationName;
@synthesize databaseName = _databaseName;
@synthesize entityClassName = _entityClassName;
//
@synthesize MOC = _MOC;
@synthesize MOM = _MOM;
@synthesize PSK = _PSK;
@synthesize fetchCon = _fetchCon;

- (instancetype)init
{
  self = [super init];
  if (self) {
    _applicationName = (@"Ajax");
    _databaseName = (@"Ajax.sqlite");
    _entityClassName = (@"KDVAbstractEntity");
  }
  return self;
}
#pragma mark - Core Data stack
- (NSURL *)applicationDocumentsDirectory {
  // The directory the application uses to store the Core Data store file. This code uses a directory named "edu._Company._Application" in the application's documents directory.
  return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}
// SET URL Name for abstraction
// ApplicationName
- (NSManagedObjectModel *)MOM {
  // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
  if (_MOM != nil) {
    return _MOM;
  }
  NSURL *modelURL = [[NSBundle mainBundle] URLForResource:[self applicationName] withExtension:@"momd"];
  _MOM = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
  return _MOM;
}
// SET URL Name for abstraction HERE TOO
// DatabaseName
- (NSPersistentStoreCoordinator *)PSK {
  // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
  if (_PSK != nil) {
    return _PSK;
  }
  
  // Create the coordinator and store
  
  _PSK = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self MOM]];
  NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:[self databaseName]];
  NSError *error = nil;
  NSString *failureReason = @"There was an error creating or loading the application's saved data.";
  if (![_PSK addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
    // Report any error we got.
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
    dict[NSLocalizedFailureReasonErrorKey] = failureReason;
    dict[NSUnderlyingErrorKey] = error;
    error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
    // Replace this with code to handle the error appropriately.
    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    abort();
  }
  
  return _PSK;
}

- (NSManagedObjectContext *)MOC {
  // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
  if (_MOC != nil) {
    return _MOC;
  }
  
  NSPersistentStoreCoordinator *coordinator = [self PSK];
  if (!coordinator) {
    return nil;
  }
  _MOC = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
  [_MOC setPersistentStoreCoordinator:coordinator];
  return _MOC;
}


#pragma mark - Fetched results controller

- (NSFetchedResultsController *)fetchCon {
  NSString *defaultKey = (@"incepDate");
  if (_fetchCon != nil) {
    return _fetchCon;
  }
  NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
  // Edit the entity name as appropriate. (Event, RootEntity, ABSTRACT_OBJ)
  NSEntityDescription *entity = [NSEntityDescription entityForName:self.entityClassName inManagedObjectContext:self.MOC];
  
  [fetchRequest setEntity:entity];
  // Set the batch size to a suitable number.
  [fetchRequest setFetchBatchSize:20];
  // Edit the sort key as appropriate.
  // GENERALLY @"incepDate"
  NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:(defaultKey) ascending:NO];
  NSArray *sortDescriptors = @[sortDescriptor];
  [fetchRequest setSortDescriptors:sortDescriptors];
  
  // Edit the section name key path and cache name if appropriate.
  // nil for section name key path means "no sections".
  NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.MOC sectionNameKeyPath:nil cacheName:@"Master"];
  aFetchedResultsController.delegate = self;
  self.fetchCon = aFetchedResultsController;
  
  NSError *error = nil;
  
  if (![self.fetchCon performFetch:&error]) {
    NSLog(@"It is Fun \nAND Insightful to Know when and Why this happened");
    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    abort();
  }
  return _fetchCon;
}
@end
