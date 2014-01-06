//
//  ExampleTable+RetrieveData.h
//  learningLanguage
//
//  Created by huyheo on 1/6/14.
//  Copyright (c) 2014 huyheo. All rights reserved.
//

#import "ExampleTable.h"

@interface ExampleTable (RetrieveData)
+ (ExampleTable *)getExampleOfWord:(NewWordTable *)word
            inManagedObjectContext:(NSManagedObjectContext *)context;
@end
