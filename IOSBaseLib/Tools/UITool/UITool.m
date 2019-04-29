//
//  UITool.m
//  IOSBaseLib
//
//  Created by scc on 2019/4/19.
//  Copyright © 2019 scc. All rights reserved.
//

#import "UITool.h"

@implementation UITool

+ (UIColor *)colorFromRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue
{
    return [UITool colorFromRed:red green:green blue:blue withAlpha:1.0];
}

+ (UIColor *)colorFromRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue withAlpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}

+ (UIColor *)colorFromHexString:(NSString *)hexString
{
    if (StringIsNull(hexString)) {
        return nil;
    }
    
    unsigned hexNum;
    if ( ![[NSScanner scannerWithString:hexString] scanHexInt:&hexNum] ) {
        return nil;
    }
    
    return [UIColor colorWithRed:((float)((hexNum & 0xFF0000) >> 16))/255.0 green:((float)((hexNum & 0xFF00) >> 8))/255.0 blue:((float)(hexNum & 0xFF))/255.0 alpha:1.0];
}
+ (UIColor *)colorFromHexString:(NSString *)hexString alpha:(CGFloat)alpha;
{
    if (StringIsNull(hexString)) {
        return nil;
    }
    
    unsigned hexNum;
    if ( ![[NSScanner scannerWithString:hexString] scanHexInt:&hexNum] ) {
        return nil;
    }
    
    return [UIColor colorWithRed:((float)((hexNum & 0xFF0000) >> 16))/255.0 green:((float)((hexNum & 0xFF00) >> 8))/255.0 blue:((float)(hexNum & 0xFF))/255.0 alpha:alpha];
    
}

+ (CGContextRef)getTextCTMContextRefFromView:(UIView *)aView
{
    if (CheckObjectNull(aView)) {
        return nil;
    }
    
    /* 获取图形上下文 */
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    /* 变换矩阵 */
    CGContextTranslateCTM(context, 0, aView.bounds.size.height);
    CGContextScaleCTM(context, 1, -1.0);
    
    /* 设置文字绘制矩阵 */
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    
    return context;
}

+ (UIImage *)viewScreenShot:(UIView *)aView
{
    return [UITool layerScreenShot:aView.layer];
}

+ (UIImage *)layerScreenShot:(CALayer *)layer
{
    if (CheckObjectNull(layer)) {
        return nil;
    }
    
    UIGraphicsBeginImageContextWithOptions(layer.bounds.size, layer.opaque, 0.0f);
    [layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)imageWithName:(NSString *)imageName
{
    if (StringIsNull(imageName)) {
        return nil;
    }
    return [UIImage imageNamed:imageName];
}

+ (UIImage *)createRoundCornerImage:(UIImage *)aImage withCornerSize:(NSInteger)cornerSize withBoardSize:(NSInteger)boardSize
{
    if (!aImage) {
        return nil;
    }
    return [UITool roundedCornerImage:aImage cornerSize:cornerSize borderSize:boardSize];
}

+ (UIImage *)roundedCornerImage:(UIImage *)aImage cornerSize:(NSInteger)cornerSize borderSize:(NSInteger)borderSize {

    UIImage *image = [UITool imageWithAlpha:aImage];
    
    CGFloat scale = MAX(aImage.scale,1.0f);
    NSUInteger scaledBorderSize = borderSize * scale;
    
    CGContextRef context = CGBitmapContextCreate(NULL,
                                                 image.size.width*scale,
                                                 image.size.height*scale,
                                                 CGImageGetBitsPerComponent(image.CGImage),
                                                 0,
                                                 CGImageGetColorSpace(image.CGImage),
                                                 CGImageGetBitmapInfo(image.CGImage));
    
    // Create a clipping path with rounded corners
    
    CGContextBeginPath(context);
    [UITool addRoundedRectToPath:CGRectMake(scaledBorderSize, scaledBorderSize, image.size.width*scale - borderSize * 2, image.size.height*scale - borderSize * 2)
                                   context:context
                                 ovalWidth:cornerSize*scale
                                ovalHeight:cornerSize*scale];
    CGContextClosePath(context);
    CGContextClip(context);

    CGContextDrawImage(context, CGRectMake(0, 0, image.size.width*scale, image.size.height*scale), image.CGImage);
    
    CGImageRef clippedImage = CGBitmapContextCreateImage(context);
    CGContextRelease(context);

    UIImage *roundedImage = [UIImage imageWithCGImage:clippedImage scale:aImage.scale orientation:UIImageOrientationUp];
    
    CGImageRelease(clippedImage);
    
    return roundedImage;
}

+ (BOOL)hasAlpha:(UIImage *)aImage {
    CGImageAlphaInfo alpha = CGImageGetAlphaInfo(aImage.CGImage);
    return (alpha == kCGImageAlphaFirst ||
            alpha == kCGImageAlphaLast ||
            alpha == kCGImageAlphaPremultipliedFirst ||
            alpha == kCGImageAlphaPremultipliedLast);
}

+ (UIImage *)imageWithAlpha:(UIImage *)aImage {
    if ([UITool hasAlpha:aImage]) {
        return aImage;
    }
    
    CGFloat scale = MAX(aImage.scale, 1.0f);
    CGImageRef imageRef = aImage.CGImage;
    size_t width = CGImageGetWidth(imageRef)*scale;
    size_t height = CGImageGetHeight(imageRef)*scale;
    
    CGContextRef offscreenContext = CGBitmapContextCreate(NULL,
                                                          width,
                                                          height,
                                                          8,
                                                          0,
                                                          CGImageGetColorSpace(imageRef),
                                                          kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedFirst);
    
    CGContextDrawImage(offscreenContext, CGRectMake(0, 0, width, height), imageRef);
    CGImageRef imageRefWithAlpha = CGBitmapContextCreateImage(offscreenContext);
    UIImage *imageWithAlpha = [UIImage imageWithCGImage:imageRefWithAlpha scale:aImage.scale orientation:UIImageOrientationUp];
    
    CGContextRelease(offscreenContext);
    CGImageRelease(imageRefWithAlpha);
    
    return imageWithAlpha;
}

+ (void)addRoundedRectToPath:(CGRect)rect context:(CGContextRef)context ovalWidth:(CGFloat)ovalWidth ovalHeight:(CGFloat)ovalHeight {
    if (ovalWidth == 0 || ovalHeight == 0) {
        CGContextAddRect(context, rect);
        return;
    }
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGContextScaleCTM(context, ovalWidth, ovalHeight);
    CGFloat fw = CGRectGetWidth(rect) / ovalWidth;
    CGFloat fh = CGRectGetHeight(rect) / ovalHeight;
    CGContextMoveToPoint(context, fw, fh/2);
    CGContextAddArcToPoint(context, fw, fh, fw/2, fh, 1);
    CGContextAddArcToPoint(context, 0, fh, 0, fh/2, 1);
    CGContextAddArcToPoint(context, 0, 0, fw/2, 0, 1);
    CGContextAddArcToPoint(context, fw, 0, fw, fh/2, 1);
    CGContextClosePath(context);
    CGContextRestoreGState(context);
}

+ (UIImage *)imageForColor:(UIColor*)aColor withSize:(CGSize)aSize
{
    if (CheckObjectNull(aColor)) {
        return nil;
    }
    CGRect rect = CGRectMake(0, 0, aSize.width, aSize.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, aColor.CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

+ (UIImage *)gradientLinearImageFromColor:(UIColor *)fromColor withToColor:(UIColor *)toColor withImageSize:(CGSize)size
{
    return [UITool gradientLinearImageFromColors:@[fromColor,toColor,fromColor] withImageSize:size];
}

+ (UIImage *)gradientLinearImageFromColors:(NSArray *)colors withImageSize:(CGSize)size;
{
    if (CheckObjectNull(colors)) {
        return nil;
    }
    
    UIGraphicsBeginImageContext(size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGFloat _locations[] = {0.f,0.5f,1.f};
    
    NSMutableArray *_colors = [NSMutableArray array];
    
    id fromColor = nil;
    if (colors.count >= 1) {
        fromColor = (__bridge id)[(UIColor *)[colors objectAtIndex:0] CGColor];
    }
    
    id toColor = nil;
    if (colors.count >= 2) {
        toColor = (__bridge id)[(UIColor *)[colors objectAtIndex:1] CGColor];
    }
    
    id endColor = nil;
    if (colors.count == 3) {
        endColor  = (__bridge id)[(UIColor *)[colors objectAtIndex:2] CGColor];
    }
    
    if (fromColor) {
        [_colors addObject:fromColor];
    }
    if (toColor) {
        [_colors addObject:toColor];
    }
    if (endColor) {
        [_colors addObject:endColor];
    }
    
    CGGradientRef gradient =  CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)_colors, _locations);
    
    CGPoint startPoint = CGPointMake(0, floorf(size.height));
    
    CGPoint endPoint = CGPointMake(floorf(size.width), size.height);
    
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    
    CFRelease(gradient);
    
    CFRelease(colorSpace);
    
    UIImage *gradientImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return gradientImage;
    
}

+ (UIImage *)gradientRadialImageFromColor:(UIColor *)fromColor withToColor:(UIColor *)toColor withImageSize:(CGSize)size
{
    return [UITool gradientRadialImageFromColors:@[fromColor,toColor] withImageSize:size];
}

+ (UIImage *)gradientRadialImageFromColors:(NSArray *)colors withImageSize:(CGSize)size
{
    if (CheckObjectNull(colors)) {
        return nil;
    }
    
    UIGraphicsBeginImageContext(size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGFloat _locations[] = {0.f,0.5,1.f};
    
    NSMutableArray *_colors = [NSMutableArray array];
    
    id fromColor = nil;
    if (colors.count >= 1) {
        fromColor = (__bridge id)[(UIColor *)[colors objectAtIndex:0] CGColor];
    }
    
    id toColor = nil;
    if (colors.count >= 2) {
        toColor = (__bridge id)[(UIColor *)[colors objectAtIndex:1] CGColor];
    }
    
    id endColor = nil;
    if (colors.count == 3) {
        endColor  = (__bridge id)[(UIColor *)[colors objectAtIndex:2] CGColor];
    }
    
    if (fromColor) {
        [_colors addObject:fromColor];
    }
    if (toColor) {
        [_colors addObject:toColor];
    }
    if (endColor) {
        [_colors addObject:endColor];
    }
    
    CGGradientRef gradient =  CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)_colors, _locations);
    
    CGPoint startPoint = CGPointMake(floorf(size.width/2), size.height/2);
    
    CGFloat radius = MIN(size.width/2, size.height/2);
    CGContextDrawRadialGradient(context, gradient, startPoint, 0, startPoint,radius, kCGGradientDrawsBeforeStartLocation|kCGGradientDrawsAfterEndLocation);
    
    CFRelease(gradient);
    
    CFRelease(colorSpace);
    
    UIImage *gradientImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return gradientImage;
}

+ (UIImage *)gridImageHorizonByLineGap:(CGFloat)lineGap withLineColor:(UIColor *)lineColor withImageSize:(CGSize)size
{
    return [UITool gridImageByHoriLineGap:lineGap withVerticalLineGap:0.f withLineColor:lineColor withImageSize:size];
}

+ (UIImage *)gridImageVerticalByLineGap:(CGFloat)lineGap withLineColor:(UIColor *)lineColor withImageSize:(CGSize)size
{
    return [UITool gridImageByHoriLineGap:0.f withVerticalLineGap:lineGap withLineColor:lineColor withImageSize:size];
}

+ (UIImage *)gridImageByHoriLineGap:(CGFloat)hLineGap withVerticalLineGap:(CGFloat)vLineGap withLineColor:(UIColor *)lineColor withImageSize:(CGSize)size
{
    CGFloat width = size.width;
    CGFloat height = size.height;
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, lineColor.CGColor);
    if (hLineGap > 0.f) {
        for (int y=0; y < height; y=y+hLineGap) {
            CGContextBeginPath(context);
            CGContextMoveToPoint(context, 0, y);
            CGContextAddLineToPoint(context, width, y);
            CGContextStrokePath(context);
        }
    }
    if (vLineGap > 0.f) {
        for (int x=0; x<width; x=x+vLineGap) {
            CGContextBeginPath(context);
            CGContextMoveToPoint(context, x, 0);
            CGContextAddLineToPoint(context, x, height);
            CGContextStrokePath(context);
        }
    }
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (void)toViewController:(UIViewController *)viewController{
    UIViewController *topVC = [self topViewController];
    if (topVC) {
        [topVC.navigationController pushViewController:viewController animated:YES];
    }
}

+ (UIViewController *)topViewController {
    UIViewController *resultVC;
    resultVC = [self _topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self _topViewController:resultVC.presentedViewController];
    }
    return resultVC;
}

+ (UIViewController *)_topViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self _topViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self _topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    return nil;
}

+ (CGRect)getFontSize:(NSString *)string withFont:(UIFont *)font{
    CGRect rect = [string boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil] context:nil];
    return rect;
}

+ (CGRect)getFontSize:(NSString *)string withFont:(UIFont *)font withMaxWidth:(CGFloat )maxWidth withMaxHeight:(CGFloat )maxHeight{
    CGRect rect = [string boundingRectWithSize:CGSizeMake(maxWidth, maxHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil] context:nil];
    return rect;
}

+ (CGRect)getFontSizeWithAtt:(NSString *)string withFont:(UIFont *)font lineSpacing:(CGFloat )lineSpacingSize{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = ScreenScaleValue(lineSpacingSize);// 字体的行间距
    NSDictionary *attributes = @{NSFontAttributeName:font,
                                 NSParagraphStyleAttributeName:paragraphStyle};
    CGRect rect = [string boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    return rect;
}

+ (CGRect)getFontSizeWithAtt:(NSString *)string withFont:(UIFont *)font withMaxWidth:(CGFloat )maxWidth withMaxHeight:(CGFloat )maxHeight lineSpacing:(CGFloat )lineSpacingSize{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = ScreenScaleValue(lineSpacingSize);// 字体的行间距
    NSDictionary *attributes = @{NSFontAttributeName:font,
                                 NSParagraphStyleAttributeName:paragraphStyle};
    CGRect rect = [string boundingRectWithSize:CGSizeMake(maxWidth, maxHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    return rect;
}

+ (UIFont *)getFontWitSize:(CGFloat)size{
    return [UIFont systemFontOfSize:size];
}

+ (UIFont *)getBoldFontWitSize:(CGFloat)size{
    return [UIFont boldSystemFontOfSize:size];
}

+ (UIFont *)getFontWitNameSize:(NSString *)name fontSize:(CGFloat)size{
    return [UIFont fontWithName:name size:size];
}

@end
