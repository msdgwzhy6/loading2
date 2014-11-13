//
//  MVLoading.m
//  Loading
//
//  Created by ma on 14-9-26.
//  Copyright (c) 2014年 ma. All rights reserved.
//

#import "MVLoading.h"
#define TIME_TICK .14
@implementation MVLoading

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        _imgvwLoading = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:_imgvwLoading];
        _loadingImgsArr = @[@"mv_loading1.png",@"mv_loading2.png",@"mv_loading3.png",@"mv_loading4.png",@"mv_loading5.png",@"mv_loading6.png"];
        
        self.hidden = YES;
    }
    
    return self;
}

-(void)start{
    _isStart = true;
    self.hidden = NO;
    _timerTick = [NSTimer scheduledTimerWithTimeInterval:TIME_TICK target:self selector:@selector(changeLoaingImg:) userInfo:nil repeats:YES];
}

-(void)end{
    _isStart = false;
    [_timerTick invalidate];
    self.hidden = YES;
}

-(void)changeLoaingImg:(id)sender{
    if(_currentIndex>=[_loadingImgsArr count]){
        _currentIndex = 0;
    }
    
    _imgvwLoading.image =[UIImage imageNamed:_loadingImgsArr[_currentIndex]];
    _currentIndex++;
}

@end
