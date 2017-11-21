//
//  EmergencyViewController.m
//  Southern University
//
//  Created by admin on 27/06/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "EmergencyViewController.h"

@interface EmergencyViewController ()

@end

@implementation EmergencyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _policeView.layer.cornerRadius=10.00;
    _crimeView.layer.cornerRadius=10.00;
    _healthView.layer.cornerRadius=10.00;
}
-(IBAction)call1
{

[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:+1(225)771-2770"]];
 
}
-(IBAction)call2
{

[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:+1(225) 771-3784"]];

}
-(IBAction)call3
{

[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:+1(225) 771-4770"]];

}
-(IBAction)web1
{
    
    NSUserDefaults *pref=[NSUserDefaults standardUserDefaults];
    [pref setValue:@"30.525788" forKey:@"DepLat"];
    [pref setValue:@"-91.190959" forKey:@"DepLang"];
    
    float lat=[pref floatForKey:@"lat"];
    float lang= [pref floatForKey:@"long"];
    
    
    NSString  *url = [NSString stringWithFormat:@"http://maps.google.com/?saddr=%f,%f&daddr=%f,%f&z=20&t=k&hl=en_US",lat,lang,[[pref valueForKey:@"DepLat"] floatValue] ,[[pref valueForKey:@"DepLang"] floatValue]];
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}
-(IBAction)web2
{
    
    NSUserDefaults *pref=[NSUserDefaults standardUserDefaults];
    [pref setValue:@"30.525788" forKey:@"DepLat"];
    [pref setValue:@"-91.190959" forKey:@"DepLang"];
    
    float lat=[pref floatForKey:@"lat"];
    float lang= [pref floatForKey:@"long"];
    
    NSString  *url = [NSString stringWithFormat:@"http://maps.google.com/?saddr=%f,%f&daddr=%f,%f&z=20&t=k&hl=en_US",lat,lang,[[pref valueForKey:@"DepLat"] floatValue] ,[[pref valueForKey:@"DepLang"] floatValue]];
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    
}
-(IBAction)web3
{
    
    NSUserDefaults *pref=[NSUserDefaults standardUserDefaults];
    [pref setValue:@"30.525688" forKey:@"DepLat"];
    [pref setValue:@"-91.1968" forKey:@"DepLang"];
    
    float lat=[pref floatForKey:@"lat"];
    float lang= [pref floatForKey:@"long"];
    
    NSString  *url = [NSString stringWithFormat:@"http://maps.google.com/?saddr=%f,%f&daddr=%f,%f&z=20&t=k&hl=en_US",lat,lang,[[pref valueForKey:@"DepLat"] floatValue] ,[[pref valueForKey:@"DepLang"] floatValue]];
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}


- (void)didReceiveMemoryWarning

{
    
    [super didReceiveMemoryWarning];
}

@end
