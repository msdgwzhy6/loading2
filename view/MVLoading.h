//
//  MVLoading.h
//  Loading
//
//  Created by ma on 14-9-26.
//  Copyright (c) 2014年 ma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MVLoading : UIView{
    UIImageView *_imgvwLoading;
    NSArray *_loadingImgsArr;
    NSTimer *_timerTick;
    int _currentIndex;
    bool _isStart;
}

-(id)initWithFrame:(CGRect)frame;
-(void)start;
-(void)end;
@property (nonatomic,assign) bool isStart;

@end
