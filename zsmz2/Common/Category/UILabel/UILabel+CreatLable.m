//
//  UILabel+CreatLable.m
//  sinonetwork
//
//  Created by sinonetwork mac on 14-7-30.
//  Copyright (c) 2014年 sinonetwork. All rights reserved.
//

#import "UILabel+CreatLable.h"

@implementation UILabel (CreatLable)
+ (UILabel *)creatLabelWithFrame:(CGRect)frame title:(NSString *)title font:(UIFont *)font andTextColor:(UIColor *)textColor bgColor:(UIColor *)bgColor;
{
    UILabel*label=[[UILabel alloc]initWithFrame:frame];
    label.text=title;
    label.font=font;
    label.textColor=textColor;
    label.backgroundColor=bgColor;
    
    return label;
    
}
+(UILabel *)getLabel:(CGRect )rect bgColor:(UIColor* )bgColor txt:(NSString* )aTxt txtColor:(UIColor* )txtColor txtFont:(UIFont* )font
{
    UILabel* getLabel = [[UILabel alloc] initWithFrame:rect];
    getLabel.backgroundColor = bgColor;
    getLabel.text = aTxt;
    getLabel.textColor = txtColor;
    getLabel.font = font;
    return getLabel;
}
+ (float)getLabelHight:(NSString* )aTxt font:(UIFont* )afont width:(float )aWidth {
    if ([aTxt isEqualToString:@""]) {
        return 0;
    }
    CGSize size;
    CGSize constraint = CGSizeMake(aWidth, MAXFLOAT);
    size = [aTxt sizeWithFont:afont constrainedToSize:constraint lineBreakMode:NSLineBreakByWordWrapping];
    
    return size.height;
}
- (void)setText:(NSString*)text lineSpacing:(CGFloat)lineSpacing {
    if (lineSpacing < 0.01 || !text) {
        self.text = text;
        return;
    }
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedString addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, [text length])];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    [paragraphStyle setLineBreakMode:self.lineBreakMode];
    [paragraphStyle setAlignment:self.textAlignment];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    
    self.attributedText = attributedString;
}
- (void)setText:(NSString*)text text1:(NSString*)text1 color:(UIColor *)color fontN:(CGFloat)fontN
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@",text]];
    NSRange range = NSMakeRange(0, str.string.length);
    [str addAttribute:NSFontAttributeName value:SysFont(fontN) range:range];
    NSMutableAttributedString *str1 = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@",text1]];
    NSRange range1 = NSMakeRange(0, str1.string.length);
    [str1 addAttribute:NSForegroundColorAttributeName value:color range:range1];
    [str appendAttributedString:str1];
    
    self.attributedText = str;
}
- (void)setHText:(NSString*)text text1:(NSString*)text1 color:(UIColor *)color fontN:(CGFloat)fontN
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@",text]];
    NSMutableAttributedString *str1 = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@",text1]];
    NSRange range1 = NSMakeRange(0, str1.string.length);
    [str1 addAttribute:NSForegroundColorAttributeName value:color range:range1];
    NSRange range = NSMakeRange(0, str1.string.length);
    [str1 addAttribute:NSFontAttributeName value:SysFont(fontN) range:range];
    [str appendAttributedString:str1];
    self.attributedText = str;
}
- (void)setH2Text:(NSString*)text text1:(NSString*)text1 color:(UIColor *)color fontN:(CGFloat)fontN
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@",text]];
    NSRange range = NSMakeRange(0, str.string.length);
    [str addAttribute:NSFontAttributeName value:SysFont(fontN) range:range];
    NSMutableAttributedString *str1 = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@",text1]];
    NSRange range1 = NSMakeRange(0, str1.string.length);
    [str1 addAttribute:NSForegroundColorAttributeName value:color range:range1];
    [str appendAttributedString:str1];
    
    self.attributedText = str;
}
@end
