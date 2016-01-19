//
//  MyUITableViewCell.h
//  ToDoManager
//
//  Created by Omar Faruqe on 2016-01-17.
//  Copyright © 2016 Omar Faruqe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoEntity.h"

@interface MyUITableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *toDoTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *toDoDueDateLabel;
@property (strong, nonatomic) ToDoEntity  *localToDoEntity;

- (void) setInternalFields:(ToDoEntity *)incomingToDoEntity;

@end
