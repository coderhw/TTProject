//
//  UIImage+Additions.m
//  ZKFramework
//
//  Created by kyori.hu on 12-10-10.
//  Copyright (c) 2012 Vanke.com All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "UIImage+Additions.h"

#define _FOUR_CC(c1,c2,c3,c4) ((uint32_t)(((c4) << 24) | ((c3) << 16) | ((c2) << 8) | (c1)))
#define _TWO_CC(c1,c2) ((uint16_t)(((c2) << 8) | (c1)))


@implementation UIImage (ZK)

+ (UIImage *)imageWithZKNamed:(NSString *)path
{
    return [UIImage imageNamed:[@"ZKImage" stringByAppendingPathComponent:path]];
}

+ (UIImage *)imageWithBase64:(NSString *)base64Str {
    if(!base64Str.length) return nil;
    
    NSMutableString *imageBase64 = [[NSMutableString alloc] initWithString:base64Str];
    NSString *base64String = [imageBase64 substringFromIndex:21];
    NSData *imageData = [[NSData alloc] initWithBase64EncodedString:base64String options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [UIImage imageWithData:imageData];
}


ImageType ImageDetectType(CFDataRef data) {
    if (!data) return ImageTypeUnknow;
    uint64_t length = CFDataGetLength(data);
    if (length < 16) return ImageTypeUnknow;
    
    const char *bytes = (char *)CFDataGetBytePtr(data);
    
    uint32_t magic4 = *((uint32_t *)bytes);
    switch (magic4) {
        case _FOUR_CC(0x4D, 0x4D, 0x00, 0x2A): { // big endian TIFF
            return ImageTypeTIFF;
        } break;
            
        case _FOUR_CC(0x49, 0x49, 0x2A, 0x00): { // little endian TIFF
            return ImageTypeTIFF;
        } break;
            
        case _FOUR_CC(0x00, 0x00, 0x01, 0x00): { // ICO
            return ImageTypeICO;
        } break;
            
        case _FOUR_CC('i', 'c', 'n', 's'): { // ICNS
            return ImageTypeICNS;
        } break;
            
        case _FOUR_CC('G', 'I', 'F', '8'): { // GIF
            return ImageTypeGIF;
        } break;
            
        case _FOUR_CC(0x89, 'P', 'N', 'G'): {  // PNG
            uint32_t tmp = *((uint32_t *)(bytes + 4));
            if (tmp == _FOUR_CC('\r', '\n', 0x1A, '\n')) {
                return ImageTypePNG;
            }
        } break;
            
        case _FOUR_CC('R', 'I', 'F', 'F'): { // WebP
            uint32_t tmp = *((uint32_t *)(bytes + 8));
            if (tmp == _FOUR_CC('W', 'E', 'B', 'P')) {
                return ImageTypeWebP;
            }
        } break;
    }
    
    uint16_t magic2 = *((uint16_t *)bytes);
    switch (magic2) {
        case _TWO_CC('B', 'A'):
        case _TWO_CC('B', 'M'):
        case _TWO_CC('I', 'C'):
        case _TWO_CC('P', 'I'):
        case _TWO_CC('C', 'I'):
        case _TWO_CC('C', 'P'): { // BMP
            return ImageTypeBMP;
        }
        case _TWO_CC(0xFF, 0x4F): { // JPEG2000
            return ImageTypeJPEG2000;
        }
    }
    if (memcmp(bytes,"\377\330\377",3) == 0) return ImageTypeJPEG;
    if (memcmp(bytes + 4, "\152\120\040\040\015", 5) == 0) return ImageTypeJPEG2000;
    return ImageTypeUnknow;
}




@end
