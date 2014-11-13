//
//  MVLoadingBoard.h
//  JWZTPlayer
//
//  Created by mjc on 14/10/24.
//  Copyright (c) 2014年 mjc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVLoading.h"
@interface MVLoadingBoard : UIView{
    MVLoading *_mvLoading;
    UIImageView *_imgvwLoadingBg;
    UILabel *_lbInfo;
}
-(instancetype)initWithFrame:(CGRect)frame;
-(void)startWithInfo:(NSString*)info;
-(void)end;
@end
