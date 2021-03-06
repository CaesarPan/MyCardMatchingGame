//
//  PlayingCard.m
//  MyCardPlayingGame
//
//  Created by caesar on 15/2/5.
//  Copyright (c) 2015年 Caesar. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit;

+(NSArray *) validSuits{
    return @[@"♠️",@"♥️",@"♣️",@"♦️"];
}
+(NSArray *) rankStrings{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}
+(NSUInteger) maxRank{
    return [[PlayingCard rankStrings]count]-1;
}
-(int)match:(NSArray *)otherCards{
    int score = 0;
    if(otherCards.count == 1){
        PlayingCard *othercard = [otherCards firstObject];
        if(othercard.rank == self.rank){
            score = 4;
        }else if([othercard.suit isEqualToString:self.suit]){
            score = 1;
        }
    }
    return score;
}
-(NSString *)contents{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}
-(void)setSuit:(NSString *)suit{
    if([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}
-(NSString *)suit{
    return _suit ? _suit : @"?";
}
-(void) setRank : (NSUInteger)rank{
    if(rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
}

@end
