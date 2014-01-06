//
//  NewWordTable+retrieveData.m
//  learningLanguage
//
//  Created by huyheo on 1/6/14.
//  Copyright (c) 2014 huyheo. All rights reserved.
//

#import "NewWordTable+retrieveData.h"
#include <stdlib.h>

@implementation NewWordTable (retrieveData)

+ (NewWordTable *)newWordByRandom:(NSManagedObjectContext *)context{
    NewWordTable *newWord = nil;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"NewWordTable"];
    //    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES]];
    //   request.predicate = [NSPredicate predicateWithFormat:@"id = %@", [photoDictionary[FLICKR_PHOTO_ID] description]];
    NSError *error = nil;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    if (!matches ) {  // nil means fetch failed; more than one impossible (unique!)
        // handle error
        NSLog(@"error");
    }else if ([matches count] >= 1) {
        int r = arc4random() % [matches count];
        NSLog(@"r = %d",r);
        return matches[r];
        
    } else {
        NSLog(@"error");
    }
    return newWord;
}


@end
