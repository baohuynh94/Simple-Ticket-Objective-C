//
//  KQFileManager.m
//  Ticket
//
//  Created by Dino Phan on 19/08/2014.
//  Copyright (c) Năm 2014 Khi Quay. All rights reserved.
//

#import "KQFileManager.h"

static KQFileManager *sharedInstance = nil;

@implementation KQFileManager

// Check file exist in documents folder
- (BOOL)fileExistInDocumentsWithName:(NSString *)name {
    fileManager = [NSFileManager defaultManager];
    NSString *rootPath = [[NSString alloc] initWithString:NSHomeDirectory()];
    NSString *documentsPath = [[NSString alloc] initWithString:[rootPath stringByAppendingPathComponent:@"Documents"]];
    NSString *fileName = [[NSString alloc] initWithString:[documentsPath stringByAppendingPathComponent:name]];
    
    if ([fileManager fileExistsAtPath:fileName]) {
        NSLog(@"[Class KQFileManager] File %@ exist!", fileName);
        return YES;
    }
    else {
        NSLog(@"[Class KQFileManager] File %@ not found!", fileName);
        return NO;
    }
}

// Set the filename to fullpath file in documents folder
- (NSString *)getFullPathInDocumentForFile:(NSString *)fileName {
    NSString *rootPath = [[NSString alloc] initWithString:NSHomeDirectory()];
    NSString *documentsPath = [[NSString alloc] initWithString:[rootPath stringByAppendingPathComponent:@"Documents"]];
    NSString *filePath = [[NSString alloc] initWithString:[documentsPath stringByAppendingPathComponent:fileName]];
    NSLog(@"[Class KQFileManager] Set %@ to %@ successfully!", fileName, filePath);
    return filePath;
}

+ (KQFileManager *)getSharedInstance {
    if (!sharedInstance) {
        sharedInstance = [[super allocWithZone:NULL] init];
    }
    return sharedInstance;
}

@end
