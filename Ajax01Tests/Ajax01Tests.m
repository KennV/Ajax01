//
//  Ajax01Tests.m
//  Ajax01Tests
//
//  Created by Kenn Villegas on 12/22/17.
//  Copyright © 2017 Kenn Villegas. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KDVAbstractDataController.h"

@interface Ajax01Tests : XCTestCase

@end

@implementation Ajax01Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testOne {
  KDVAbstractDataController *j = [[KDVAbstractDataController alloc]init];
  XCTAssertNotNil(j.applicationName);
  XCTAssertNotNil(j.databaseName);
  XCTAssertNotNil(j.entityClassName);
  XCTAssert([[j MOM]isMemberOfClass:[NSManagedObjectModel class]]);
  XCTAssert([[j MOC]isMemberOfClass:[NSManagedObjectContext class]]);
  XCTAssert([[j PSK]isMemberOfClass:[NSPersistentStoreCoordinator class]]);
}
@end
