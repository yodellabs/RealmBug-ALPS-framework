//
//  NSString+NSDictionary.m
//  alps-framework-objc
//
//  Created by Nick Wilkerson on 10/10/17.
//  Copyright © 2017 Yodel Labs. All rights reserved.
//

#import "NSString+NSDictionary.h"

@implementation NSString (NSDictionary)

-(NSDictionary *)dictionaryRepresentationWithError:(NSError **)error {
    NSDictionary *data = [NSJSONSerialization JSONObjectWithData:[self dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:error];
    return data;
}

@end

