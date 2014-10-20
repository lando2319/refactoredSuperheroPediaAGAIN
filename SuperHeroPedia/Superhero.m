//
//  Superhero.m
//  SuperHeroPedia
//
//  Created by MM Driver on 10/20/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "Superhero.h"

@implementation Superhero

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];

    if (self)
    {
        self.name = dictionary[@"name"];
        self.textDescription = [dictionary objectForKey:@"description"];
    }

    return self;
}

+ (void)retrieveSuperheroesWithCompletion:(void (^)(NSArray *))complete
{
    NSURL *url = [NSURL URLWithString:@"https://s3.amazonaws.com/mobile-makers-lib/superheroes.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        NSArray *results = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&connectionError];
        NSMutableArray *superheroes = [NSMutableArray arrayWithCapacity:results.count];

        for (NSDictionary *dict in results)
        {
            Superhero *superhero = [[Superhero alloc] initWithDictionary:dict];
            [superheroes addObject:superhero];
        }
        complete(superheroes);
    }];
}

@end
