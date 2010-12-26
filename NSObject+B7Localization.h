//
//  NSObject+B7Localization.h
//  Records UI
//
//  Created by Georg C. on 09.08.09.
//  Copyright 2009 bloo7. All rights reserved.
//

/**
	The Localization category provides a methods that allow you to conveniently
	handle object-specific string tables.
	*/
@interface NSObject (B7Localization)

/**
	The name of the class-specific string table. Defaults to <code>nil</code>,
	so the default string table <code>Localizable.strings</code> is used.
	*/
+ (NSString *)stringTableName;

/**
	The name of the object-specific string table. The default implementation
	class <code>+[NSObject stringTableName]</code>.
	*/
@property(readonly, nonatomic, copy) NSString *stringTableName;
@property(readonly, nonatomic, assign) NSBundle *stringTableBundle;

/** Localizes a string using the receiver-specific string table. */
- (NSString *)localizedString:(NSString *)string;
/**
	Formats a string according to the current user's locale. This method also
	localizes the format string before formatting.
	*/
- (NSString *)localizedStringWithFormat:(NSString *)string, ...;

/** Localizes the name of the class the receiver is a instance of using the receiver-specific string table. */
- (NSString *)localizedClassName;

@end

