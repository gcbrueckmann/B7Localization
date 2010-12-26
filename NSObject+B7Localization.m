//
//  NSObject+B7Localization.m
//  Records UI
//
//  Created by Georg C. on 09.08.09.
//  Copyright 2009 bloo7. All rights reserved.
//

#import "NSObject+B7Localization.h"


@implementation NSObject (B7Localization)

@dynamic stringTableName, stringTableBundle;


+ (NSString *)stringTableName {
	return NSStringFromClass(self);
}


- (NSString *)stringTableName {
	return [self.class stringTableName];
}


- (NSBundle *)stringTableBundle {
	return [NSBundle bundleForClass:self.class];
}


- (NSString *)localizedString:(NSString *)string {
	NSString *stringTableNamePrefix = [[self stringTableBundle] objectForInfoDictionaryKey:@"B7SymbolNamePrefix"];
	NSString *stringTableName = self.stringTableName;
	if (stringTableNamePrefix.length && [stringTableName hasPrefix:stringTableNamePrefix]) {
		stringTableName = [stringTableName substringFromIndex:stringTableNamePrefix.length];
	}
	NSString *localizedString = NSLocalizedStringFromTableInBundle(string, stringTableName,
																   self.stringTableBundle, nil);
	if ([localizedString isEqual:string]) {
		if ([[self.class superclass] isKindOfClass:[NSObject class]]) {
			localizedString = NSLocalizedStringFromTableInBundle(string, [[self.class superclass] stringTableName],
																 [[self.class superclass] stringTableBundle], nil);
			if ([localizedString isEqual:string]) {
				localizedString = NSLocalizedString(string, nil);
			}
		} else {
			localizedString = NSLocalizedString(string, nil);
		}
	}
	return localizedString;
}


- (NSString *)localizedStringWithFormat:(NSString *)string, ... {
	string = [self localizedString:string];
	va_list arguments;
	va_start(arguments, string);
	string = [[[NSString alloc] initWithFormat:string locale:[NSLocale currentLocale] arguments:arguments] autorelease];
	va_end(arguments);
	return string;
}


- (NSString *)localizedClassName {
	return [self localizedString:NSStringFromClass(self.class)];
}

@end

