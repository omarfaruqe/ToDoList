//
//  DPHandlesToDoEntity.h
//  ToDoManager
//
//  Created by Omar Faruqe on 2016-01-17.
//  Copyright © 2016 Omar Faruqe. All rights reserved.
//
#import "ToDoEntity.h"
#import <Foundation/Foundation.h>

@protocol DPHandlesToDoEntity <NSObject>

- (void) receiveToDoEntity:(ToDoEntity *)incomingToDoEntity;

@end
