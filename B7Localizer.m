//
//  B7Localizer.m
//  Digest
//
//  Created by Georg C. on 26.12.10.
//  Copyright 2010 bloo7. All rights reserved.
//

#import "B7Localizer.h"


@implementation B7Localizer

- (id)initWithStringTableName:(NSString *)stringTableName {
	return [self initWithStringTableName:stringTableName
								  bundle:[NSBundle mainBundle]];
}


- (id)initWithStringTableName:(NSString *)stringTableName
					   bundle:(NSBundle *)bundle
{
	if ((self = [super init])) {
		_stringTableName = [stringTableName copy];
		_bundle = [bundle retain];
	}
	return self;
}


- (void)dealloc {
	[_stringTableName release], _stringTableName = nil;
	[_bundle release], _bundle = nil;
	[super dealloc];
}




- (NSBundle *)stringTableBundle {
	return _bundle;
}

@end
