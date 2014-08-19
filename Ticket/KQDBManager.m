//
//  KQDBManager.m
//  Ticket
//
//  Created by Dino Phan on 19/08/2014.
//  Copyright (c) Năm 2014 Khi Quay. All rights reserved.
//

#import "KQDBManager.h"
static KQDBManager *sharedInstance = nil;

@implementation KQDBManager

+ (KQDBManager *)getSharedInstance {
    if (!sharedInstance) {
        sharedInstance = [[super allocWithZone:NULL] init];
    }
    return sharedInstance;
}

// Set connection to database
- (BOOL)connectDatabaseWithName:(NSString *)databaseFileName {
    if (sqlite3_open([databaseFileName UTF8String], &_database) == SQLITE_OK) {
        NSLog(@"[Class KQDBManager] Database connected!");
        return YES;
    }
    NSLog(@"[Class KQDBManager] Database connection failed!");
    return NO;
}

// Close connection to database
- (BOOL)disconnectDatabase {
    NSLog(@"[Class KQDBManager] Closing connection to database.");
    if (sqlite3_close(_database) == SQLITE_OK) {
        NSLog(@"[Class KQDBManager] DB Disconnected");
        return YES;
    }
    return NO;
}

// Get data as array type from table and column name ty NSString
- (NSArray *)getDataFromTable:(NSString *)table withColumn:(NSString *)column {
    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
    NSString *query = [[NSString alloc] initWithFormat:@"SELECT %@ FROM %@", column, table];
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &_statement, NULL) == SQLITE_OK) {
        NSLog(@"[Class KQDBManager] Successfully query database statement!");
        while (sqlite3_step(_statement) == SQLITE_ROW) {
            const char *data = (char *) sqlite3_column_text(_statement, 0);
            NSString *strData = [[NSString alloc] initWithUTF8String:data];
            [resultArray addObject:strData];
        }
        return resultArray;
    }
    NSLog(@"[Class KQDBManager] Failed! Cannot query database.");
    return nil;
}

@end
