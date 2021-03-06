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

//-(void)setWords:(NSString *)inputString {
//    _words = [[inputString componentsSeparatedByString:@" "] mutableCopy];
//}

//Write a method called stringFormat that returns an NSString that is the full sentence.
-(NSString *)stringFormat {
    return [self.words componentsJoinedByString:@" "];
}

//Write a method called numOfWords that returns the number of words in the sentence.
-(NSNumber *)numOfWords {
    return [NSNumber numberWithInteger: [self.words count]];
}

//Write a method called containsWord: that takes an NSString to search for, and returns a YES or NO if that word is in the sentence.
-(BOOL)containsWord:(NSString *)searchTerm {
    return [self.words containsObject:searchTerm];
}

//Write an accessor method called words that returns the instance variable containing all the words.
-(NSArray *)words {
    return [_words copy];
}

//EXTRA CREDIT
//Write a method called isProperSentence that ensures that the first word is capitalized and the last word as a punctuation mark.
-(BOOL)isProperSentence {
    NSCharacterSet *punctuationMark = [NSCharacterSet punctuationCharacterSet];

//   Is the last charachter in the punctuationCharacterSet (or not)?
    NSString *lastWord = [self.words lastObject];
    BOOL endsWithPunctuationMark = [punctuationMark characterIsMember: [lastWord characterAtIndex:[lastWord length] -1]];

//    Is the first letter of the first word capitalized (or not)?
    BOOL isSentenceCase = [[[self.words firstObject] capitalizedString] isEqualToString:[self.words firstObject]];
    
    if (isSentenceCase && endsWithPunctuationMark) {
        return YES;
    }
    return NO;
}

//Write a method called isEqualToSentence that takes in another FISSentence object and returns a YES or NO if the sentences are the same. Be a bit loose with that definition. If the capitalization or punctuation is a bit different that is fine.

// Still fails - it's extra credit, so I'll leave it out for now.
// ##############
 -(BOOL)isEqualToSentence:(FISSentence *)otherSentence {
    NSMutableString *thisSentence = [[self punctuationFilter:[self stringFormat]] mutableCopy];
    NSMutableString *theOtherSentence = [[self punctuationFilter:[otherSentence stringFormat]] mutableCopy];
    NSLog(@"thisSentence:\n%@\n\ntheOtherSentence:\n%@", thisSentence, theOtherSentence);
    thisSentence = [[thisSentence lowercaseString] mutableCopy];
    theOtherSentence = [[theOtherSentence lowercaseString] mutableCopy];
    NSLog(@"A Second-ah Time-ah:\n\nthisSentence:\n%@\n\ntheOtherSentence:\n%@", thisSentence, theOtherSentence);

    return [thisSentence isEqualToString:theOtherSentence];
}


-(NSString *)punctuationFilter:(NSString *)inputString {
    NSMutableArray *outputArray = [[inputString componentsSeparatedByCharactersInSet:[NSCharacterSet punctuationCharacterSet]] mutableCopy];
    for (NSInteger i = [outputArray count] -1; i >= 0; i--) {
        if ([outputArray[i] isEqualToString:@""]) {
            [outputArray removeObject:outputArray[i]];
        }
    }
    NSMutableArray *outputString = [[outputArray description] mutableCopy];
    return [outputString copy];
}



@end
