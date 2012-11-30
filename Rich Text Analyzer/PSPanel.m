//
//  PSPanel.m
//  Rich Text Analyzer
//
//  Created by Dexter Weiss on 10/1/12.
//  Copyright (c) 2012 Peppered Software. All rights reserved.
//

#import "PSPanel.h"

@implementation PSPanel

- (void)textViewDidChangeSelection:(NSNotification *)notification {
    NSTextView *textViewObject = [notification object];
    NSRange range = [textViewObject selectedRange];
    if (![[textViewObject textStorage] length]) {
        return;
    }
    
    NSUInteger location = range.location;
    if (range.location > 0) {
        location -= 1;
    }
    NSRange effectiveRange;
    NSDictionary *attributes = [[textViewObject textStorage] attributesAtIndex:location effectiveRange:&effectiveRange];
    NSMutableString *output = [NSMutableString string];
    for (NSString *key in [attributes allKeys]) {
        [output appendString:@"***************************\n"];
        [output appendString:key];
        [output appendString:@" ---- "];
        [output appendFormat:@"%@", [attributes objectForKey:key]];
        [output appendString:@"\n"];
    }
    [output appendString:@"************TEXT**********\n"];
    NSString *stringWithRange = [[[textViewObject textStorage] string] substringWithRange:effectiveRange];
    stringWithRange = [stringWithRange stringByReplacingOccurrencesOfString:@"\n" withString:@"****NEWLINE****"];
    stringWithRange = [stringWithRange stringByReplacingOccurrencesOfString:@"\t" withString:@"****TAB****"];
    [output appendString:stringWithRange];
    [textView selectAll:self];
    [textView delete:self];
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:output];
    [[textView textStorage] setAttributedString:string];
}

@end
