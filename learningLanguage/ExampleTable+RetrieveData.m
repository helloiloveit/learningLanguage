//
//  ExampleTable+RetrieveData.m
//  learningLanguage
//
//  Created by huyheo on 1/6/14.
//  Copyright (c) 2014 huyheo. All rights reserved.
//

#import "ExampleTable+RetrieveData.h"

@implementation ExampleTable (RetrieveData)


+ (ExampleTable *)getExampleOfWord:(NewWordTable *)word
               inManagedObjectContext:(NSManagedObjectContext *)context
{
    ExampleTable *exampleRecord = nil;

    
    // Build a fetch request to see if we can find this Flickr photo in the database.
    // The "unique" attribute in Photo is Flickr's "id" which is guaranteed by Flickr to be unique.
    NSLog(@"word = %@", word);
    if (word == NULL) {
        return nil;
    }
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"ExampleTable"];
    //request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES]];
   // request.predicate = [NSPredicate predicateWithFormat:@"exampleOfWord = %@", word];
    
    
    // Execute the fetch
    
    NSError *error = nil;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    NSLog(@"matches = %@", matches);
    // Check what happened in the fetch
    
    if (!matches) {  // nil means fetch failed; more than one impossible (unique!)
        // handle error
        NSLog(@"no available example");
        return nil;
    }else if ([matches count] >= 1) {
        int r = arc4random() % [matches count];
        NSLog(@"r = %d",r);
            NSLog(@"exampleRecord = %@", matches[r]);
        return matches[r];

    } else if ([matches count] >= 0){ // found the Photo, just return it from the list of matches (which there will only be one of)
        NSLog(@"no available example");
        
    }
    NSLog(@"exampleRecord = %@", exampleRecord);
    return exampleRecord;
}
@end
