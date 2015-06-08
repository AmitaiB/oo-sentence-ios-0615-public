//
//  FISSentence.h
//  OO-sentence
//
//  Created by Amitai Blickstein on 6/7/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISSentence : NSObject

@property (strong, nonatomic) NSMutableArray *words;

-(NSString *)stringFormat;
-(NSNumber *)numOfWords;
-(BOOL)containsWord:(NSString *)searchTerm;

-(NSArray *)words;

-(BOOL)isProperSentence;

-(BOOL)isEqualToSentence:(FISSentence *)otherSentence;
-(NSString *)punctuationFilter:(NSString *)inputString;

@end
