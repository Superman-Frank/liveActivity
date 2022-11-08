//
//  ViewController.m
//  TestLiveActivity
//
//  Created by mac on 2022/11/3.
//

#import "ViewController.h"
#import "TestLiveActivity-Swift.h"
@interface ViewController ()
@property (nonatomic, strong) NSDate *startDate;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"hello";
    // Do any additional setup after loading the view.
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [button setTitle:@"开始1" forState:0];
    button.backgroundColor = UIColor.systemBlueColor;
    [button addTarget:self action:@selector(starts) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button4 = [[UIButton alloc]initWithFrame:CGRectMake(300, 100, 100, 100)];
    [button4 setTitle:@"开始2" forState:0];
    button4.backgroundColor = UIColor.systemBlueColor;
    [button4 addTarget:self action:@selector(startsTwo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
    

    UIButton *button2 = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, 100, 100)];
    button2.backgroundColor = UIColor.systemRedColor;
    [button2 setTitle:@"结束1" forState:0];
    [button2 addTarget:self action:@selector(ends) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    UIButton *button5 = [[UIButton alloc]initWithFrame:CGRectMake(300, 300, 100, 100)];
    [button5 setTitle:@"结束2" forState:0];
    button5.backgroundColor = UIColor.systemBlueColor;
    [button5 addTarget:self action:@selector(endsTwo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button5];
    
    
    UIButton *button3 = [[UIButton alloc]initWithFrame:CGRectMake(100, 500, 100, 100)];
    button3.backgroundColor = UIColor.systemOrangeColor;
    [button3 setTitle:@"更新1" forState:0];
    [button3 addTarget:self action:@selector(updates) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    UIButton *button6 = [[UIButton alloc]initWithFrame:CGRectMake(300, 300, 100, 100)];
    [button6 setTitle:@"更新2" forState:0];
    button6.backgroundColor = UIColor.systemBlueColor;
    [button6 addTarget:self action:@selector(updatesTwo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button5];
    
    self.startDate = [NSDate date];

}


-(void)starts{
    
    NSLog(@"asdssdds");
    
    ZkActivityManager *manager = [[ZkActivityManager alloc]init];
    [manager startActivityWithSleepGoal:480 currentDate:self.startDate type:YES];

}

-(void)startsTwo{
    
    NSLog(@"asdssdds");
    
    ZkActivityManager *manager = [[ZkActivityManager alloc]init];
    [manager startActivityWithSleepGoal:480 currentDate:self.startDate type:NO];

}

-(void)ends{
    ZkActivityManager *manager = [[ZkActivityManager alloc]init];
    [manager stopActivity];
}

-(void)endsTwo{
    ZkActivityManager *manager = [[ZkActivityManager alloc]init];
    [manager stopActivity];
}

-(void)updates{
    
    ZkActivityManager *manager = [[ZkActivityManager alloc]init];
    [manager updateActivityWithCurrentDate:self.startDate type:YES];
}

-(void)updatesTwo{
    ZkActivityManager *manager = [[ZkActivityManager alloc]init];
    [manager updateActivityWithCurrentDate:self.startDate type:NO];
}
@end
