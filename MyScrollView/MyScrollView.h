//
//  MyScrollView.h
//  MyScrollView
//
//  Created by Cay Cornelius on 19/09/16.
//  Copyright © 2016 Cornelius.Media. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyScrollView : UIView

@property (assign) CGSize contentSize;

@property (nonatomic, strong) UIPanGestureRecognizer *panGestureRecognizer;

@end
