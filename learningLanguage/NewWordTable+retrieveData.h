//
//  NewWordTable+retrieveData.h
//  learningLanguage
//
//  Created by huyheo on 1/6/14.
//  Copyright (c) 2014 huyheo. All rights reserved.
//

#import "NewWordTable.h"

@interface NewWordTable (retrieveData)
+ (NewWordTable *)newWordByRandom:(NSManagedObjectContext *)context;
@end
