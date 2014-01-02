//
//  Example.h
//  learningLanguage
//
//  Created by huyheo on 1/2/14.
//  Copyright (c) 2014 huyheo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NewWordTable;

@interface Example : NSManagedObject

@property (nonatomic, retain) NSString * example;
@property (nonatomic, retain) NSSet *exampleOfWord;
@end

@interface Example (CoreDataGeneratedAccessors)

- (void)addExampleOfWordObject:(NewWordTable *)value;
- (void)removeExampleOfWordObject:(NewWordTable *)value;
- (void)addExampleOfWord:(NSSet *)values;
- (void)removeExampleOfWord:(NSSet *)values;

@end
