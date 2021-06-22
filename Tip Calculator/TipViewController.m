//
//  TipViewController.m
//  Tip Calculator
//
//  Created by Josey Zhang on 6/22/21.
//

#import "TipViewController.h"

@interface TipViewController ()
// adding ID for each element
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UITextField *splitLabel;
@property (weak, nonatomic) IBOutlet UISlider *splitControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentageControl;
@property (weak, nonatomic) IBOutlet UIView *tipContainerView;
@property (weak, nonatomic) IBOutlet UIView *totalContainerView;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)onTap:(id)sender {
    // NSLog(@"hello");
    [self.view endEditing:true];
}

- (IBAction)updateBill:(id)sender {
    if(self.billField.text.length != 0){
        [self showLabels];
    }
    else if(self.billField.text.length == 0){
        [self hideLabels];
    }
    double tipPercentages[] = {0.15, 0.18, 0.20};
    double tipPercentage = tipPercentages[self.tipPercentageControl.selectedSegmentIndex];
    double bill = [self.billField.text doubleValue];
    int split = (int) self.splitControl.value;
    double tip = (tipPercentage * bill) / split;
    double total = (bill + tipPercentage * bill)/split;
    
    self.splitLabel.text = [NSString stringWithFormat:@"%i",split];
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f",tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f",total];
}

- (void)hideLabels {
    [UIView animateWithDuration:0.2 animations:^{
        CGRect tipFrame = self.tipContainerView.frame;
        tipFrame.origin.y += 200;
        self.tipContainerView.frame = tipFrame;
        self.tipContainerView.alpha = 0;
        CGRect totalFrame = self.totalContainerView.frame;
        totalFrame.origin.y += 200;
        self.totalContainerView.alpha = 0;
        self.totalContainerView.frame = totalFrame;
    }];
}

-(void)showLabels {
    [UIView animateWithDuration:0.2 animations:^{
        CGRect tipFrame = self.tipContainerView.frame;
        tipFrame.origin.y = 466;
        self.tipContainerView.frame = tipFrame;
        self.tipContainerView.alpha = 1;
        CGRect totalFrame = self.totalContainerView.frame;
        totalFrame.origin.y = 554;
        self.totalContainerView.alpha = 1;
        self.totalContainerView.frame = totalFrame;
    }];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
