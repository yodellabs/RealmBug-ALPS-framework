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

#import <Realm/Realm.h>

@class ALPSStoredGrid;
//@class ALPSStoredZone;

@interface ALPSStoredBeacon : RLMObject

@property NSString *identifier;
@property NSNumber<RLMInt> *slotNumber;
@property NSNumber<RLMDouble> *x;
@property NSNumber<RLMDouble> *y;

@property ALPSStoredGrid *grid;
//@property ALPSStoredZone *zone;

@end
