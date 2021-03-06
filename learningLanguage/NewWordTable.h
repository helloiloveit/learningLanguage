//
//  NewWordTable.h
//  learningLanguage
//
//  Created by huyheo on 1/6/14.
//  Copyright (c) 2014 huyheo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ExampleTable;

@interface NewWordTable : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * meanning;
@property (nonatomic, retain) NSString * word;
@property (nonatomic, retain) NSSet *wordToExample;
@end

@interface NewWordTable (CoreDataGeneratedAccessors)

- (void)addWordToExampleObject:(ExampleTable *)value;
- (void)removeWordToExampleObject:(ExampleTable *)value;
- (void)addWordToExample:(NSSet *)values;
- (void)removeWordToExample:(NSSet *)values;

@end
