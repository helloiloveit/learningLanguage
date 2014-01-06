//
//  ExampleTable+create.m
//  learningLanguage
//
//  Created by huyheo on 1/6/14.
//  Copyright (c) 2014 huyheo. All rights reserved.
//

#import "ExampleTable+create.h"

@implementation ExampleTable (create)
+ (ExampleTable *)createExampleOfWord:(NewWordTable *)word
                         example:(NSString *)example
          inManagedObjectContext:(NSManagedObjectContext *)context
{
    ExampleTable *exampleRecord = nil;
    NSLog(@"word = %@", word);
    NSLog(@"context = %@", context);
    
    // Build a fetch request to see if we can find this Flickr photo in the database.
    // The "unique" attribute in Photo is Flickr's "id" which is guaranteed by Flickr to be unique.
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"ExampleTable"];
    //request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES]];
    request.predicate = [NSPredicate predicateWithFormat:@"exampleOfWord = %@", word];
    
    // Execute the fetch
    
    NSError *error = nil;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    // Check what happened in the fetch
    
    if (!matches) {  // nil means fetch failed; more than one impossible (unique!)
        // handle error
        exampleRecord = [NSEntityDescription insertNewObjectForEntityForName:@"ExampleTable" inManagedObjectContext:context];
        exampleRecord.Example = example;
        exampleRecord.exampleOfWord = word;
        
    } else { // found the Photo, just return it from the list of matches (which there will only be one of)
        exampleRecord = [NSEntityDescription insertNewObjectForEntityForName:@"ExampleTable" inManagedObjectContext:context];
        exampleRecord.Example = example;
        exampleRecord.exampleOfWord = word;
    }
    NSLog(@"exampl record = %@", exampleRecord);
    return exampleRecord;
}
@end
