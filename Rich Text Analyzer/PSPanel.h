//
//  PSPanel.h
//  Rich Text Analyzer
//
//  Created by Dexter Weiss on 10/1/12.
//  Copyright (c) 2012 Peppered Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface PSPanel : NSPanel <NSTextViewDelegate> {
    IBOutlet NSTextView *textView;
}

@end
