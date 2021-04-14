//
//  ViewController.m
//  XcodeBefore13
//
//  Created by ruixinyi on 2020/6/30.
//  Copyright © 2020 ruixinyi. All rights reserved.
//

#import "ViewController.h"
#import "SRSqliteTool.h"
#define TEST_DB_NAME @"SRPersonInfo"
#define TEST_DB_HEADER_STMT @"CREATE TABLE IF NOT EXISTS PersonInfo (personid text PRIMARY KEY, name text, age text, gender text, job text)"
@interface ViewController () {
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    
    UIButton *button_1 = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 100, 40)];
    button_1.backgroundColor = [UIColor purpleColor];
    [button_1 setTitle:@"写入数据" forState:UIControlStateNormal];
    [button_1 addTarget:self action:@selector(action_1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_1];
    
    UIButton *button_2 = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 100, 40)];
    button_2.backgroundColor = [UIColor purpleColor];
    [button_2 setTitle:@"更新数据" forState:UIControlStateNormal];
    [button_2 addTarget:self action:@selector(action_2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_2];
    
    UIButton *button_3 = [[UIButton alloc] initWithFrame:CGRectMake(50, 150, 100, 40)];
    button_3.backgroundColor = [UIColor purpleColor];
    [button_3 setTitle:@"删除数据" forState:UIControlStateNormal];
    [button_3 addTarget:self action:@selector(action_3) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_3];
    
    UIButton *button_4 = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, 100, 40)];
    button_4.backgroundColor = [UIColor purpleColor];
    [button_4 setTitle:@"读取数据" forState:UIControlStateNormal];
    [button_4 addTarget:self action:@selector(action_4) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_4];
    
}
/*
 customid |
 */
- (void)action_1 {
    // 往数据库里写入数据
    SRSqliteTool *tool = [[SRSqliteTool alloc] initWithDBName:TEST_DB_NAME headerStmt:TEST_DB_HEADER_STMT];
    NSString *sql_1 = @"INSERT INTO PersonInfo (personid,name,age,gender,job) VALUES('0001','Tom','13','male','student')";
    NSString *sql_2 = @"INSERT INTO PersonInfo (personid,name,age,gender,job) VALUES('0002','Bob','27','male','worker')";
    NSString *sql_3 = @"INSERT INTO PersonInfo (personid,name,age,gender,job) VALUES('0003','Tina','25','female','nurse')";
    NSString *sql_4 = @"INSERT INTO PersonInfo (personid,name,age,gender,job) VALUES('0004','Emma','13','female','student')";
    NSString *sql_5 = @"INSERT INTO PersonInfo (personid,name,age,gender,job) VALUES('0005','Alice','15','female','student')";
    [tool writeWithSql:sql_1];
    [tool writeWithSql:sql_2];
    [tool writeWithSql:sql_3];
    [tool writeWithSql:sql_4];
    [tool writeWithSql:sql_5];
    
    
    
}

- (void)action_2 {
    // 更新数据库的数据
    SRSqliteTool *tool = [[SRSqliteTool alloc] initWithDBName:TEST_DB_NAME headerStmt:TEST_DB_HEADER_STMT];
    NSString *sql = @"update PersonInfo set age = '3' where personid = '0001'";
    [tool writeWithSql:sql];
}

- (void)action_3 {
    
    // 删除数据库的数据
    SRSqliteTool *tool = [[SRSqliteTool alloc] initWithDBName:TEST_DB_NAME headerStmt:TEST_DB_HEADER_STMT];
    NSString *sql = @"delete from PersonInfo where job != 'student'";
    [tool writeWithSql:sql];
}

- (void)action_4 {
    // 从数据库里读取数据
    SRSqliteTool *tool = [[SRSqliteTool alloc] initWithDBName:TEST_DB_NAME headerStmt:TEST_DB_HEADER_STMT];
    NSString *sql = @"select personid,name,age,gender,job from PersonInfo where gender = 'female' order by personid asc";
    NSArray *resultArray = [tool readWithSql:sql columns:5];
    NSLog(@"resultArray is %@", resultArray);
}


@end

