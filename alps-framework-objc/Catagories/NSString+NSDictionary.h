//
//  NSString+NSDictionary.h
//  alps-framework-objc
//
//  Created by Nick Wilkerson on 10/10/17.
//  Copyright © 2017 Yodel Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NSDictionary)

-(NSDictionary *)dictionaryRepresentationWithError:(NSError **)error;

@end
