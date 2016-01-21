//
//  MyUIViewController.m
//  ToDoManager
//
//  Created by Omar Faruqe on 2016-01-17.
//  Copyright © 2016 Omar Faruqe. All rights reserved.
//

#import "MyUIViewController.h"

@interface MyUIViewController ()
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) ToDoEntity *localToDoEntity;

@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextView *detailsField;
@property (weak, nonatomic) IBOutlet UIDatePicker *dueDateFiled;
@property (weak, nonatomic) IBOutlet UITextField *contextField;
@property (weak, nonatomic) IBOutlet UITextField *priorityField;

@property (nonatomic, assign) BOOL wasDeleted;

@end

@implementation MyUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) receiveMOC: (NSManagedObjectContext *)incomingMOC{
        self.managedObjectContext = incomingMOC;
}

- (void) receiveToDoEntity:(ToDoEntity *)incomingToDoEntity{
    self.localToDoEntity = incomingToDoEntity;
    
}

- (void) textViewDidEndEditing:(NSNotification *) notification {
    if ([notification object] == self) {
        self.localToDoEntity.toDoDetails = self.detailsField.text;
        [self saveMyToDoEntity];
    }
}


- (void) viewDidAppear:(BOOL)animated {
    self.wasDeleted = NO;
    self.titleField.text = self.localToDoEntity.toDoTitle;
    self.detailsField.text = self.localToDoEntity.toDoDetails;
    
    self.priorityField.text = self.localToDoEntity.toDoPriority;
    self.contextField.text = self.localToDoEntity.toDoContext;
    
    NSDate *dueDate = self.localToDoEntity.toDoDate;
    if (dueDate != nil) {
        [self.dueDateFiled setDate:dueDate];
    }
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textViewDidEndEditing:) name:UITextViewTextDidEndEditingNotification object:self];
}

- (IBAction)titleFieldEditing:(id)sender {
    self.localToDoEntity.toDoTitle = self.titleField.text;
    [self saveMyToDoEntity];
}
- (IBAction)contextFieldEditing:(id)sender {
    self.localToDoEntity.toDoContext = self.contextField.text;
    [self saveMyToDoEntity];
    
}
- (IBAction)priorityFieldEditing:(id)sender {
    self.localToDoEntity.toDoPriority = self.priorityField.text;
    [self saveMyToDoEntity];
}



- (void) saveMyToDoEntity {
    NSError *err;
    BOOL saveSuccess = [self.managedObjectContext save:&err];
    if (!saveSuccess) {
        @throw [NSException exceptionWithName:NSGenericException reason:@"Couldn't save" userInfo:@{NSUnderlyingErrorKey: err}];
    }
}
- (IBAction)dueDateEditing:(id)sender {
    self.localToDoEntity.toDoDate = self.dueDateFiled.date;
    [self saveMyToDoEntity];
}


- (void) viewDidDisappear:(BOOL)animated {
    // set up delete state
    if (self.wasDeleted == NO) {
        self.localToDoEntity.toDoTitle = self.titleField.text;
        self.localToDoEntity.toDoDetails = self.detailsField.text;
        self.localToDoEntity.toDoDate = self.dueDateFiled.date;
        self.localToDoEntity.toDoContext = self.contextField.text;
        self.localToDoEntity.toDoPriority = self.priorityField.text;
        [self saveMyToDoEntity];
    }
    

    
    //Remove detection notification
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UITextViewTextDidEndEditingNotification object:self];
}


- (IBAction)deleteToDo:(id)sender {
    self.wasDeleted = YES;
    [self.managedObjectContext deleteObject:self.localToDoEntity];
    [self saveMyToDoEntity];
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    
}

@end
