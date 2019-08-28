//
//  ViewController.m
//  lesson20-1-IBOutlets
//
//  Created by Anatoly Ryavkin on 18/03/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bConstraintWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bConstraintHeigth;
@property (weak, nonatomic) IBOutlet UIView *b;
@property (strong, nonatomic) IBOutlet UIView *v;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *array;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *arrayCell;
-(UIColor*)randomColor;
-(CGFloat)randomCGFloatAt256;
-(void)delFigursAtCountRotation;
-(void)drawingFigursAtNewPosition;
@end



@implementation ViewController

//------------------   CREATIVE CONSTRAINTS IN CODE!!!
 

  /*  NSLayoutConstraint* temp = [NSLayoutConstraint constraintWithItem:(id)view1 attribute:(NSLayoutAttribute)attr1 relatedBy:(NSLayoutRelation)relation toItem:(nullable id)view2 attribute:(NSLayoutAttribute)attr2 multiplier:(CGFloat)multiplier constant:(CGFloat)c];
    NSLog(@"count=%lu", figura.constraints.count);
    @property BOOL shouldBeArchived;
    @property (getter=isActive) BOOL active NS_AVAILABLE(10_10, 8_0);}
 
    @property UILayoutPriority priority;
 
 @interface UIView (UIConstraintBasedLayoutCoreMethods)
 - (void)updateConstraintsIfNeeded NS_AVAILABLE_IOS(6_0); // Updates the constraints from the bottom up for the view hierarchy rooted at the receiver. UIWindow's implementation creates a layout engine if necessary first.
 - (void)updateConstraints NS_AVAILABLE_IOS(6_0) NS_REQUIRES_SUPER; // Override this to adjust your special constraints during a constraints update pass
 - (BOOL)needsUpdateConstraints NS_AVAILABLE_IOS(6_0);
 - (void)setNeedsUpdateConstraints NS_AVAILABLE_IOS(6_0);
 @end
}
   //figuraCopy.backgroundColor =figuraReal.backgroundColor;
   //@property (getter=isActive) BOOL active
   //figuraReal.frame=figuraCopy.frame;
   //[figuraReal removeConstraints:figuraReal.constraints];
   
   
   
   very ipmotain ------
                                figuraReal.translatesAutoresizingMaskIntoConstraints=YES;     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   
   
   
   */



-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if(self.view.bounds.size.height+self.view.bounds.size.width>1792){
        NSInteger size =  self.view.bounds.size.height+self.view.bounds.size.width;
        switch(size){
            case 1946 : self.bConstraintWidth.constant=834;
                          self.bConstraintHeigth.constant=834;
            break;
            case 2028 : self.bConstraintWidth.constant=834;
                          self.bConstraintHeigth.constant=834;
            break;
            case 2390 : self.bConstraintWidth.constant=1024;
                          self.bConstraintHeigth.constant=1024;
            break;
            default:break;
        }
    }
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
}

-(CGFloat)randomCGFloatAt256{
    return (CGFloat)(((arc4random()*1000)%256) /255.f);
}

-(UIColor*)randomColor{
    CGFloat r = [self randomCGFloatAt256];
    CGFloat g = [self randomCGFloatAt256];
    CGFloat b = [self randomCGFloatAt256];
    return [UIColor colorWithRed:r green:g blue:b alpha:0.8];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    static int i =0;
    i++;
    self.v.backgroundColor=[self randomColor];
    self.b.backgroundColor=[self randomColor];
    NSLog(@"4 - heigth= %f, width= %f", self.b.frame.size.height,self.b.frame.size.width);
    if(i>0) [self drawingFigursAtNewPosition];
    //if(i>3&&i<6) [self delFigursAtCountRotation];
}

-(void)drawingFigursAtNewPosition{
    NSMutableSet*set=[[NSMutableSet alloc]init];
    for(int i=0;i<16;i++){
        //NSLog(@"***********************************************************");
        UIView*figuraReal=[self.array objectAtIndex:i];
        //NSLog(@"boolBeg=%i",figuraReal.translatesAutoresizingMaskIntoConstraints);
        figuraReal.translatesAutoresizingMaskIntoConstraints=YES;
        BOOL b = YES;
        while (b) {
            int i = arc4random()%32;
            if(![set containsObject:[NSNumber numberWithInt:i]]){
                //NSLog(@"bool1=%i",[figuraReal needsUpdateConstraints]);
                [[self.arrayCell objectAtIndex:i] addSubview:figuraReal];
                //NSLog(@"bool=%i",[figuraReal needsUpdateConstraints]);
                [set addObject:[NSNumber numberWithInt:i]];
                b=NO;
            }
        }
        
    }
}

-(void)delFigursAtCountRotation{
    for(UIView*viewCell in self.arrayCell){
        if(viewCell.subviews.count!=0){
                  [[viewCell.subviews objectAtIndex:0] removeFromSuperview];
        }
    }
}
@end
