//
//  TableViewController.m
//  ImageAppearTest
//
//  Created by tangtianshi on 16/12/6.
//  Copyright © 2016年 YH. All rights reserved.
//

#import "TableViewController.h"
#import <Accelerate/Accelerate.h>
#import "UIImage+Blur.h"
#define IMAGE(name) [UIImage imageNamed:name]
@interface TableViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageViewLayout;

// 模糊背景图
@property (weak, nonatomic) IBOutlet UIImageView *imageBackgroundView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *backgroundViewLayout;

@property (weak, nonatomic) IBOutlet UIImageView *iconImg;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLab;
@property (weak, nonatomic) IBOutlet UILabel *angelNumLab;
@end

@implementation TableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBlurryImage:IMAGE(@"mine_bg.jpg")];
    CGFloat statusHeight = -[[UIApplication sharedApplication] statusBarFrame].size.height;
    self.imageViewLayout.constant = statusHeight;
    self.backgroundViewLayout.constant = statusHeight;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  高斯图片
 *
 *  @param originalImage 需要高斯的图片
 */
- (void)setBlurryImage:(UIImage *)originalImage {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIImage *blurredImage = [originalImage blurredImage:0.9];//[self blurryImage:originalImage withBlurLevel:0.9];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.alpha = 0.0;
            self.imageBackgroundView.image = blurredImage;
        });
    });
}

#pragma mark - UITableViewDataSource & delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self updateHeaderView:scrollView.contentOffset];
}


/**
 *  通过scrollview的滑动改变顶部view的大小和高斯效果
 *
 *  @param offset scrollview下滑的距离
 */
-(void)updateHeaderView:(CGPoint) offset {
    if (offset.y <= self.imageViewLayout.constant) {
        CGRect frame = self.tableView.tableHeaderView.frame;
        CGRect rect = CGRectMake(0, 0, frame.size.width, 220);
        CGFloat delta = fabs(MIN(0.0f, offset.y));
        rect.origin.y -= delta;
        rect.size.height += delta;
        self.imageView.frame = rect;
        self.imageBackgroundView.frame = rect;
        CGFloat alpha = fabs((offset.y - self.imageViewLayout.constant) / (2 * CGRectGetHeight(rect) / 3));
        self.imageView.alpha = alpha;
    }
}

@end
