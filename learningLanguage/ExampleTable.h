//
//  ExampleTable.h
//  learningLanguage
//
//  Created by huyheo on 1/6/14.
//  Copyright (c) 2014 huyheo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NewWordTable;

@interface ExampleTable : NSManagedObject

@property (nonatomic, retain) NSString * example;
@property (nonatomic, retain) NewWordTable *exampleOfWord;

@end
