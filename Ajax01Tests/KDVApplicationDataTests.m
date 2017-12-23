//
//  KDVApplicationDataTests.m
//  Ajax01Tests
//
//  Created by Kenn Villegas on 12/23/17.
//  Copyright © 2017 Kenn Villegas. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KDVApplicationDataController.h"

@interface KDVApplicationDataTests : XCTestCase

@end

@implementation KDVApplicationDataTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testTwo {
  KDVApplicationDataController *k = [[KDVApplicationDataController alloc]initAllUp];
  XCTAssertNotNil([k applicationName]);
  XCTAssertNotNil([k databaseName]);
  XCTAssertNotNil([k entityClassName]);
  XCTAssert([[k entityClassName] isEqualToString:(@"KDVRootEntity")]);
  XCTAssert([[k MOM]isMemberOfClass:[NSManagedObjectModel class]]);
  XCTAssert([[k MOC]isMemberOfClass:[NSManagedObjectContext class]]);
  XCTAssert([[k PSK]isMemberOfClass:[NSPersistentStoreCoordinator class]]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
