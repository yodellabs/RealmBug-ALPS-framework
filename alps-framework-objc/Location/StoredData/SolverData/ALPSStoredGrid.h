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

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Realm/Realm.h>
//#import "ALPSStoredZone.h"
#import "ALPSStoredBeacon.h"
#import "ALPSStoredContour.h"

RLM_ARRAY_TYPE(ALPSStoredBeacon)
//RLM_ARRAY_TYPE(ALPSStoredZone)
RLM_ARRAY_TYPE(ALPSStoredContour)


@interface ALPSStoredGrid : RLMObject

@property NSString *_Nullable identifier;
@property NSNumber<RLMDouble> *_Nullable latitude;
@property NSNumber<RLMDouble> *_Nullable longitude;
@property NSNumber<RLMInt> *_Nullable floor;

@property NSNumber<RLMDouble> *_Nullable rotation;
@property NSNumber<RLMDouble> *_Nullable scale;

@property NSData *_Nullable gridData;
@property NSNumber<RLMDouble> *_Nullable gridWidth;

@property RLMArray<ALPSStoredContour*><ALPSStoredContour> *_Nullable contours;

@property NSData *_Nullable floorPlanImagePNGData;


//@property RLMArray<ALPSStoredZone*><ALPSStoredZone> *_Nonnull zones;
@property RLMArray<ALPSStoredBeacon*><ALPSStoredBeacon> *_Nonnull beacons;

/* calculated properties */
-(UIImage *_Nonnull)gridImage;
-(NSArray<NSArray<NSValue*>*>*_Nonnull)contourArrays;
-(UIImage *_Nonnull)floorPlanImage;
-(NSArray <ALPSStoredBeacon*>*_Nonnull)allBeacons;
//-(NSArray <ALPSStoredZone*>*_Nonnull)allZones;


@end
