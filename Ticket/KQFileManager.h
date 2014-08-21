//
//  KQFileManager.h
//  Ticket
//
//  Created by Dino Phan on 19/08/2014.
//  Copyright (c) Năm 2014 Khi Quay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KQDBManager.h"

@interface KQFileManager : NSObject {
    NSFileManager *fileManager;
}

+ (KQFileManager *)getSharedInstance;

- (BOOL)fileExistInDocumentsWithName: (NSString *)name;
- (NSString *)getFullPathInDocumentForFile: (NSString *)fileName;
- (void)checkAndCopyFileInDocumentsPath;

@end
