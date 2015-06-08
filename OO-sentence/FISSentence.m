//
//  FISSentence.m
//  OO-sentence
//
//  Created by Amitai Blickstein on 6/7/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import "FISSentence.h"

@implementation FISSentence

//We are going to represent our sentence as an NSArray of NSStrings. So to represent the sentence "How are you?" we would have an array like this @[@"How", @"are", @"you?"]. To do this we will need to hold state in our object. This means an instance variable! Create a NSMutableArray instance variable to hold your words.
//@property (strong, nonatomic) NSMutableArray *theSentence;

//Write a method called stringFormat that returns an NSString that is the full sentence.
-(NSString *)stringFormat {
    return [self.theSentence componentsJoinedByString:@" "];
}

//Write a method called numOfWords that returns the number of words in the sentence.
-(NSUInteger)numOfWords {
    return [self.theSentence count];
}

//Write a method called containsWord: that takes an NSString to search for, and returns a YES or NO if that word is in the sentence.
-(BOOL)containsWord:(NSString *)searchTerm {
    return [self.theSentence containsObject:searchTerm];
}

//Write an accessor method called words that returns the instance variable containing all the words.
-(NSArray *)words {
    return [self.theSentence copy];
}

//EXTRA CREDIT
//Write a method called isProperSentence that ensures that the first word is capitalized and the last word as a punctuation mark.
-(BOOL)isProperSentence {
    NSCharacterSet *punctuationMark = [NSCharacterSet punctuationCharacterSet];
//    is the last char in the punctcharset?
    
//    NSPredicate *endsWithPunctuationMark = [NSPredicate predicateWithFormat: @"%@", punctuationMark];
    NSString *lastWord = [self.theSentence lastObject];
    BOOL endsWithPunctuationMark = [punctuationMark characterIsMember: [lastWord characterAtIndex:[lastWord length] -1]];

//    ;             componentsSeparatedByString:@""] lastObject] ;

    BOOL isSentenceCase = [[[self.theSentence firstObject] capitalizedString] isEqualToString:[self.theSentence firstObject]];
    
    if (isSentenceCase && endsWithPunctuationMark) {
        return YES;
    }
    return NO;
}

//Write a method called isEqualToSentence that takes in another FISSentence object and returns a YES or NO if the sentences are the same. Be a bit loose with that definition. If the capitalization or punctuation is a bit different that is fine.
-(BOOL)isEqualToSentence:(FISSentence *)otherSentence {
    return [self.stringFormat isEqualToString:otherSentence.stringFormat];
}





@end