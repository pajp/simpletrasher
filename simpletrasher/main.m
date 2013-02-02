//
//  main.m
//  simpletrasher
//
//  Created by Rasmus Sten on 2013-01-28.
//  Copyright (c) 2013 Rasmus Sten. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSFileManager *fm = [NSFileManager defaultManager];
        if (argc == 1) {
            fprintf(stderr, "Please supply one or more file names.\n");
            return 1;            
        }
        for (int i=1; i < argc; i++) {
            const char* file_to_trash = argv[i];
            NSURL *url = [NSURL fileURLWithPath:[NSString stringWithUTF8String:file_to_trash]];
            NSURL *trashed;
            NSError *error;
            if ([fm trashItemAtURL:url resultingItemURL:&trashed error:&error]) {
                fprintf(stdout, "Trashed %s to %s\n", [[url path] UTF8String], [[trashed path] UTF8String]);
            } else {
                fprintf(stderr, "Failed to trash %s: %s\n", [[url path] UTF8String], [[error localizedDescription] UTF8String]);
                return 1;
            }
        }
    }
    return 0;
}

