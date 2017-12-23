//
//  KDVAbstractDataController.h
//  Ajax01
//
//  Created by Kenn Villegas on 12/22/17.
//  Copyright © 2017 Kenn Villegas. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <Foundation/Foundation.h>
#import "Ajax+CoreDataModel.h"
//wow lots of these'ns
//#import "KDVAbstractEntity+CoreDataClass.h"


/**
OKrazy I need this to be in test from the get-go
But to do that need to define the test then fail it and init it
_then set a default init_
*/

@interface KDVAbstractDataController : NSObject <NSFetchedResultsControllerDelegate>
/*Surprisingly Important*/

@property (nonatomic, copy) NSString* applicationName;

@property (nonatomic, copy) NSString* databaseName;

@property (nonatomic, copy) NSString* entityClassName;

/*these are constructed from those */

@property (nonatomic, retain) NSManagedObjectContext *MOC;

@property (readonly, strong, nonatomic) NSManagedObjectModel *MOM;

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *PSK;

@property (strong, nonatomic) NSFetchedResultsController *fetchCon;
@end
