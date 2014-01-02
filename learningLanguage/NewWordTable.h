//
//  NewWordTable.h
//  learningLanguage
//
//  Created by huyheo on 1/2/14.
//  Copyright (c) 2014 huyheo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Example;

@interface NewWordTable : NSManagedObject

@property (nonatomic, retain) NSString * word;
@property (nonatomic, retain) NSString * meanning;
@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) Example *wordToExample;

@end
