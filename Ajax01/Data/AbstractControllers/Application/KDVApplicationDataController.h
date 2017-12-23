/**
  KDVApplicationDataController.h
  Ajax01

  Created by Kenn Villegas on 12/23/17.
  Copyright © 2017 Kenn Villegas. All rights reserved.

*/
#import "KDVAbstractDataController.h"


@interface KDVApplicationDataController : KDVAbstractDataController <NSFetchedResultsControllerDelegate>

- (instancetype)initAllUp;
@end
