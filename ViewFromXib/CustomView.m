//
//  MyView.m
//  test
//
//  Created by Iustin on 09/11/15.
//  Copyright (c) 2015 Iustin. All rights reserved.
//

#import "CustomView.h"

static NSString * const CustomViewNibName = @"CustomView";

@interface CustomView ()

@property (strong, nonatomic) UIView *xibView;
@property (strong, nonatomic) IBOutlet UIView *myView;
@property (strong, nonatomic) IBOutlet UILabel *myLabel;
@property (strong, nonatomic) IBInspectable UIColor *textColor;

@end

@implementation CustomView

- (void)setTextColor:(UIColor *)textColor {
    self.myLabel.textColor = textColor;
}

- (UIView *)loadViewFromNib {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    UINib *nib = [UINib nibWithNibName:CustomViewNibName bundle:bundle];
    UIView *xibView = (UIView *)[nib instantiateWithOwner:self options:nil][0];
    return xibView;
}

- (void)xibSetup {
    self.xibView = [self loadViewFromNib];
    self.xibView.frame = self.bounds;
    self.xibView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self addSubview:self.xibView];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (!self) return nil;
    
    [self xibSetup];
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) return nil;
    
    [self xibSetup];
    
    return self;
}



@end
