//
//  NewWordTable+create.h
//  learningLanguage
//
//  Created by huyheo on 1/2/14.
//  Copyright (c) 2014 huyheo. All rights reserved.
//

#import "NewWordTable.h"

@interface NewWordTable (create)


+ (NewWordTable *)newWordWithMeaning:(NSString *)word
                        withMeanning:(NSString *)meanning
        inManagedObjectContext:(NSManagedObjectContext *)context;
@end
