//
//  NewWordTable+create.m
//  learningLanguage
//
//  Created by huyheo on 1/2/14.
//  Copyright (c) 2014 huyheo. All rights reserved.
//

#import "NewWordTable+create.h"

@implementation NewWordTable (create)


+ (NewWordTable *)newWordWithMeaning:(NSString *)word
                        withMeanning:(NSString *)meanning
              inManagedObjectContext:(NSManagedObjectContext *)context{
    NewWordTable *newWord = nil;
    NSLog(@"context = %@", context);
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"NewWordTable"];
//    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES]];
 //   request.predicate = [NSPredicate predicateWithFormat:@"id = %@", [photoDictionary[FLICKR_PHOTO_ID] description]];
    NSError *error = nil;
    NSArray *matches = [context executeFetchRequest:request error:&error];
        NSLog(@"matches = %d", [matches count]);
    // Check what happened in the fetch
    
    if (!matches ) {  // nil means fetch failed; more than one impossible (unique!)
        // handle error
    } else if (![matches count])  {
        newWord = [NSEntityDescription insertNewObjectForEntityForName:@"NewWordTable" inManagedObjectContext:context];
        newWord.word =  word;
        newWord.meanning = meanning;

        newWord.id = [NSNumber numberWithInt:1];
    } else if ([matches count] >= 1) { // none found, so let's create a Photo for that Flickr photo
        newWord = [NSEntityDescription insertNewObjectForEntityForName:@"NewWordTable" inManagedObjectContext:context];
        newWord.word =  word;
        newWord.meanning = meanning;

        NewWordTable *newWordTemp =[matches lastObject];
        newWord.id = newWordTemp.id;

    } else { // found the Photo, just return it from the list of matches (which there will only be one of)
        NSLog(@"ERROR");
    }
    
    NSLog(@"newWord is %@", newWord);
    return newWord;
}


@end
