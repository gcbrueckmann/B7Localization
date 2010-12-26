//
//  B7Localizer.h
//  Digest
//
//  Created by Georg C. on 26.12.10.
//  Copyright 2010 bloo7. All rights reserved.
//

/** A dummy class that can localize strings. */
@interface B7Localizer : NSObject {
	NSString *_stringTableName;
	NSBundle *_bundle;
}

/** Initializes the receiver with a string table name. */
- (id)initWithStringTableName:(NSString *)stringTableName;
- (id)initWithStringTableName:(NSString *)stringTableName
					   bundle:(NSBundle *)bundle;

@property(readonly, nonatomic, copy) NSString *stringTableName;
@property (readonly, nonatomic, retain) NSBundle *bundle;

@end
