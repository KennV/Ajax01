/**
  KDVApplicationDataController.m
  Ajax01

  Created by Kenn Villegas on 12/23/17.
  Copyright © 2017 Kenn Villegas. All rights reserved.

*/
#import "KDVApplicationDataController.h"

@implementation KDVApplicationDataController


- (instancetype)initAllUp
{
  self = [self initWithAppName:@"Ajax" databaseName:@"Ajax.sqlite" className:@"KDVRootEntity"];
  if (self) {
    
  }
  return self;
}
@end
