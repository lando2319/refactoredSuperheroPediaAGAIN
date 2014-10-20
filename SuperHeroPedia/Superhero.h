//
//  Superhero.h
//  SuperHeroPedia
//
//  Created by MM Driver on 10/20/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Superhero : NSObject

@property NSString *name;
@property NSString *textDescription;

- (instancetype)initWithDictionary: (NSDictionary *)dictionary;

+ (void)retrieveSuperheroesWithCompletion:(void (^)(NSArray*))complete;

@end
