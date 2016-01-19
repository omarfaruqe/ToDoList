//
//  MyUITableViewController.h
//  ToDoManager
//
//  Created by Omar Faruqe on 2016-01-17.
//  Copyright © 2016 Omar Faruqe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DPHandlesMOC.h"

@interface MyUITableViewController : UITableViewController <DPHandlesMOC>

- (void) receiveMOC:(NSManagedObjectContext *)incomingMOC;

@end
