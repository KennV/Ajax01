//
//  KDVAbstractDataTests.m
//  Ajax01Tests
//
//  Created by Kenn Villegas on 12/23/17.
//  Copyright © 2017 Kenn Villegas. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KDVAbstractDataController.h"

@interface KDVAbstractDataTests : XCTestCase

@end

@implementation KDVAbstractDataTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testOne {
  KDVAbstractDataController *j = [[KDVAbstractDataController alloc]init];
  XCTAssertNotNil(j);
  XCTAssert([j isKindOfClass:[KDVAbstractDataController class]]);
  XCTAssertNotNil([j applicationName]);
  XCTAssertNotNil([j databaseName]);
  XCTAssertNotNil([j entityClassName]);
  XCTAssert([[j MOM]isMemberOfClass:[NSManagedObjectModel class]]);
  XCTAssert([[j MOC]isMemberOfClass:[NSManagedObjectContext class]]);
  XCTAssert([[j PSK]isMemberOfClass:[NSPersistentStoreCoordinator class]]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
