/******************************************************************************
 *  ALPS, The Acoustic Location Processing System.
 *  Copyright (C) 2017, Yodel Labs
 *  All rights reserved.
 *
 *  This software is the property of Yodel Labs. Source may
 *  be modified, but this license does not allow distribution.  Binaries built
 *  for research purposes may be freely distributed, but must acknowledge
 *  Yodel Labs.  No other use or distribution can be made
 *  without the written permission of the authors and Yodel Labs.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 *
 *  Contributing Author(s):
 *  Patrick Lazik
 *  Nick Wilkerson
 *
 *******************************************************************************/

#import "ALPSStoredGrid.h"

@implementation ALPSStoredGrid

+ (NSString *)primaryKey {
    return @"identifier";
}

-(UIImage *)floorPlanImage {
    return [UIImage imageWithData:self.floorPlanImagePNGData];
}

-(NSArray<NSArray<NSValue*>*>*)contourArrays {
    NSMutableArray *contourArrays = [[NSMutableArray alloc] init];
    for (ALPSStoredContour *contour in self.contours) {
        NSMutableArray *contourArray = [[NSMutableArray alloc] init];
        for (ALPSStoredContourPoint *contourPoint in contour.points) {
            [contourArray addObject:[NSValue valueWithCGPoint:CGPointMake(contourPoint.x.doubleValue, contourPoint.y.doubleValue)]];
        }
        [contourArrays addObject:contourArray];
    }
    return contourArrays;
}

-(NSArray *)allBeacons {
    NSMutableArray *beaconsArray = [[NSMutableArray alloc] init];
    for (ALPSStoredBeacon *beacon in self.beacons) {
        [beaconsArray addObject:beacon];
    }
    return beaconsArray;
}
/*
-(NSArray <ALPSStoredZone*>*_Nonnull)allZones {
    NSMutableArray *zonesArray = [[NSMutableArray alloc] init];
    for (ALPSStoredZone *zone in self.zones) {
        [zonesArray addObject:zone];
    }
    return zonesArray;
}
*/

-(UIImage *)gridImage {
    NSLog(@"gridImage");
    
    NSData *gridData = [self gridData];
    long gridWidth = self.gridWidth.doubleValue;
    long gridHeight = gridData.length / self.gridWidth.longValue;
    
    uint8_t *bytes = (uint8_t *)gridData.bytes;
    
    //  let sampleImage = UIImage()
    CGRect imageRect = CGRectMake(0,  0, gridWidth, gridHeight);
    
    UIGraphicsBeginImageContext(imageRect.size);
    CGContextRef context  = UIGraphicsGetCurrentContext();
    
    long occupiedPixelCount = 0;
    for (long row=0; row< gridHeight; row++) {
        for (long column=0; column<gridWidth; column++){
            if (*(bytes + (long)(row * gridWidth + column)) != 0) {
                occupiedPixelCount += 1;
                CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
            } else {
                CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
            }
            CGContextFillRect(context, CGRectMake(column, row, 1, 1));
        }
    }

    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    return img;
}



@end
