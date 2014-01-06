//
//  ExampleTable+create.h
//  learningLanguage
//
//  Created by huyheo on 1/6/14.
//  Copyright (c) 2014 huyheo. All rights reserved.
//

#import "ExampleTable.h"

@interface ExampleTable (create)
+ (ExampleTable *)createExampleOfWord:(NewWordTable *)word
                         example:(NSString *)example
          inManagedObjectContext:(NSManagedObjectContext *)context;
@end
