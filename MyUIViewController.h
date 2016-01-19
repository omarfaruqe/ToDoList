//
//  MyUIViewController.h
//  ToDoManager
//
//  Created by Omar Faruqe on 2016-01-17.
//  Copyright © 2016 Omar Faruqe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DPHandlesMOC.h"
#import "DPHandlesToDoEntity.h"

@interface MyUIViewController : UIViewController <DPHandlesMOC, DPHandlesToDoEntity>

- (void) receiveMOC: (NSManagedObjectContext *)incomingMOC;
- (void) receiveToDoEntity:(ToDoEntity *)incomingToDoEntity;


@end
