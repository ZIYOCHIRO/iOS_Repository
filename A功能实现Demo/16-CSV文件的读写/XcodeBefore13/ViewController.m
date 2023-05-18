//
//  ViewController.m
//  XcodeBefore13
//
//  Created by ruixinyi on 2020/6/30.
//  Copyright © 2020 ruixinyi. All rights reserved.
//

#import "ViewController.h"


@interface ViewController () {
    NSMutableDictionary *resultDic;
    NSMutableString *resultStr;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    
    UIButton *button_1 = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 100, 40)];
    button_1.backgroundColor = [UIColor purpleColor];
    [button_1 setTitle:@"read" forState:UIControlStateNormal];
    [button_1 addTarget:self action:@selector(action_1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_1];
    
    UIButton *button_2 = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 100, 40)];
    button_2.backgroundColor = [UIColor purpleColor];
    [button_2 setTitle:@"write" forState:UIControlStateNormal];
    [button_2 addTarget:self action:@selector(action_2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_2];
    
    UIButton *button_3 = [[UIButton alloc] initWithFrame:CGRectMake(50, 150, 100, 40)];
    button_3.backgroundColor = [UIColor purpleColor];
    [button_3 setTitle:@"Action_3" forState:UIControlStateNormal];
    [button_3 addTarget:self action:@selector(action_3) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_3];
    
    UIButton *button_4 = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, 100, 40)];
    button_4.backgroundColor = [UIColor purpleColor];
    [button_4 setTitle:@"Action_4" forState:UIControlStateNormal];
    [button_4 addTarget:self action:@selector(action_4) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_4];
    
}

- (void)action_1 {
    // 初始化
    resultDic = [NSMutableDictionary dictionary];
    NSString *fileContents = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"puredata" ofType:@"csv"] encoding:NSUTF8StringEncoding error:nil];
    // 将csv里的数据根据每一行进行拆分
    NSArray *dataArray = [fileContents componentsSeparatedByString:@"\r\n"];
    [dataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        // 对每一行数据进行操作
        NSString *lineStr = obj;
        NSArray *lineArray = [lineStr componentsSeparatedByString:@","];
        if (lineArray.count == 3) {
            NSString *com1 = lineArray[0];
            NSString *com2 = lineArray[1];
            int com3 = [lineArray[2] intValue];
            
            NSString *key = [NSString stringWithFormat:@"%@#%@", com1, com2];
            int value = [resultDic[key] intValue];
            int newValue = value + com3;
            resultDic[key] = [NSString stringWithFormat:@"%i", newValue];
        }
    }];
    NSLog(@"resultDic is \n %@", resultDic);
    
}

- (void)action_2 {
   // 将汇总的数据生成新的csv文件
   // 初始化resultStr
    resultStr = [NSMutableString string];
    [resultDic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSArray *twoComponents = [key componentsSeparatedByString:@"#"];
        NSString *com1 = twoComponents[0];
        NSString *com2 = twoComponents[1];
        NSString *com3 = obj;
        NSString *lineStr = [NSString stringWithFormat:@"%@,%@,%@\r\n", com1,com2,com3];
        
        resultStr = [NSString stringWithFormat:@"%@%@", resultStr, lineStr];
    }];
    NSLog(@"resultStr is \n%@", resultStr);
    
    NSData *csvData = [resultStr dataUsingEncoding:NSUTF8StringEncoding];
    NSString *filePath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"result.csv"];
    [csvData writeToFile:filePath atomically:YES];
    
    

}


- (void)action_3 {
   
}

- (void)action_4 {

}


@end

