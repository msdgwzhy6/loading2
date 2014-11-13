//
//  MVLoadingBoard.m
//  JWZTPlayer
//
//  Created by mjc on 14/10/24.
//  Copyright (c) 2014年 mjc. All rights reserved.
//

#import "MVLoadingBoard.h"
#import "SkinCommentHeader.h"
@implementation MVLoadingBoard
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _imgvwLoadingBg = [[UIImageView alloc] initWithFrame:self.bounds];
        _imgvwLoadingBg.layer.backgroundColor = MEDIA_BAR_COLOR.CGColor;
        _imgvwLoadingBg.layer.cornerRadius = 10;
        _imgvwLoadingBg.layer.masksToBounds = YES;
        _imgvwLoadingBg.alpha = MEDIA_BAR_ALPHA;

        float width = frame.size.height * .8;
        float split = frame.size.height * .1;
        
        _mvLoading = [[MVLoading alloc] initWithFrame:CGRectMake(split, split, width, width)];
        
        _lbInfo = [[UILabel alloc] initWithFrame:CGRectMake(split*2+width, split, frame.size.width - split*3 - width, width)];
        _lbInfo.textColor = SKIN_DEFAULT_COLOR;
        _lbInfo.textAlignment = NSTextAlignmentLeft;
        _lbInfo.font = SKIN_DEFAULT_FONT;
        
        _lbInfo.backgroundColor = [UIColor clearColor];
        
        [self addSubview:_imgvwLoadingBg];
        [self addSubview:_mvLoading];
        [self addSubview:_lbInfo];
        
        self.hidden = YES;
    }
    return self;
}

-(void)startWithInfo:(NSString *)info{
    if (![_mvLoading isStart]) {
        [_mvLoading start];
    }
    _lbInfo.text = info;
    self.hidden = NO;
    CGPoint center = self.center;
    float widthbase = _mvLoading.frame.size.width + self.frame.size.height*.3;
    float textwidth = info.length*SKIN_DEFAULT_FONT.xHeight*1.5;
    float width = textwidth + widthbase;
    
    self.frame = CGRectMake(0, 0, width, self.frame.size.height);
    self.center = center;
    
    _imgvwLoadingBg.frame = self.bounds;
    _lbInfo.frame = CGRectMake(widthbase - .1*self.frame.size.height, _lbInfo.frame.origin.y, textwidth, _lbInfo.frame.size.height);
    
    
}

-(void)end{
    if ([_mvLoading isStart]) {
        [_mvLoading end];
    }
    self.hidden = YES;
}

@end
