//
//  DPHandlesMOC.h
//  ToDoManager
//
//  Created by Omar Faruqe on 2016-01-17.
//  Copyright © 2016 Omar Faruqe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DPHandlesMOC.h"

@protocol DPHandlesMOC <NSObject>

- (void) receiveMOC: (NSManagedObjectContext *) incomingMOC;

@end
