//
//  UIImage+Blur.h
//  NZAlertView
//
//  Created by Bruno Furtado on 20/12/13.
//  Copyright (c) 2013 No Zebra Network. All rights reserved.
//
//  Most of this image blur code came from a public post on the Indie Ambitions blog: http://goo.gl/NqnB5q
//  The triple-processing of the blur is inspired by code in ios-realtimeblur available on github: http://goo.gl/AUlpKi
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//
//  SALectureTableController.h
//  SweetAngel
//
//  Created by gongcz on 16/8/1.
//  Copyright © 2016年 GCZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accelerate/Accelerate.h>
#import <QuartzCore/QuartzCore.h>

@interface UIImage (Blur)

// 0.0 to 1.0
- (UIImage*)blurredImage:(CGFloat)blurAmount;

@end