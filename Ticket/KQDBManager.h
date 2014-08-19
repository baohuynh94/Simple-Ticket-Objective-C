//
//  KQDBManager.h
//  Ticket
//
//  Created by Dino Phan on 19/08/2014.
//  Copyright (c) Năm 2014 Khi Quay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface KQDBManager : NSObject {
    sqlite3 *_database;
    sqlite3_stmt *_statement;
}

+ (KQDBManager *)getSharedInstance;
- (BOOL)connectDatabaseWithName: (NSString *)databaseFileName;
- (BOOL)disconnectDatabase;
- (NSArray *)getDataFromTable: (NSString *)table withColumn: (NSString *)column;

@end
