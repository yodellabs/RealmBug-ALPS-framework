//
//  ALPSGridSolverTest.m
//  alps-framework-objcTests
//
//  Created by Nick Wilkerson on 10/31/17.
//  Copyright © 2017 Yodel Labs. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ALPSGridSolver.h"

@interface ALPSGridSolverTest : XCTestCase

@end

@implementation ALPSGridSolverTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGridSolver {
    NSLog(@"running test");
    XCTestExpectation *expectation = [self expectationWithDescription:@"Solve For Location"];
    
    double gridWidth = 500;
    double gridHeight = 500;
    uint8_t *occupancyGrid = (uint8_t *)malloc(gridWidth*gridHeight*sizeof(uint8_t));
    for (int i=0; i<gridWidth*gridHeight; i++) {
        occupancyGrid[i] = 1;
    }
    NSData *occupancyGridData = [NSData dataWithBytesNoCopy:occupancyGrid length:gridWidth*gridHeight];
    
    ALPSBeaconInfo *beacon1 = [[ALPSBeaconInfo alloc] initWithBeaconId:1 x:0 y:0];
    ALPSBeaconInfo *beacon2 = [[ALPSBeaconInfo alloc] initWithBeaconId:2 x:95 y:5];
    ALPSBeaconInfo *beacon3 = [[ALPSBeaconInfo alloc] initWithBeaconId:3 x:5 y:92];
    ALPSBeaconInfo *beacon4 = [[ALPSBeaconInfo alloc] initWithBeaconId:4 x:96.5 y:87];
    NSArray *beacons = @[beacon1, beacon2, beacon3, beacon4];
    
    ALPSGridSolver *gridSolver = [[ALPSGridSolver alloc] initWithOccupancyGridData:occupancyGridData rowWidth:gridWidth gridPointDistance:0.2 beacons:beacons];
    ALPSAudioBeaconFlightData *flightData = [[ALPSAudioBeaconFlightData alloc] initWithTimeStamp:[NSDate date] highestRSSIBeaconId:1];
    [flightData.flightDataPoints addObject:[[ALPSAudioBeaconFlightDataPoint alloc] initWithBeaconId:1 timeOfFlight:0.14577 highestRSSISectorId:1 rssi:1 noise:1]];
    [flightData.flightDataPoints addObject:[[ALPSAudioBeaconFlightDataPoint alloc] initWithBeaconId:2 timeOfFlight:0.140 highestRSSISectorId:1 rssi:1 noise:1]];
    [flightData.flightDataPoints addObject:[[ALPSAudioBeaconFlightDataPoint alloc] initWithBeaconId:3 timeOfFlight:0.146 highestRSSISectorId:1 rssi:1 noise:1]];
    [flightData.flightDataPoints addObject:[[ALPSAudioBeaconFlightDataPoint alloc] initWithBeaconId:4 timeOfFlight:0.13 highestRSSISectorId:1 rssi:1 noise:1]];

    [gridSolver solveForDistances:flightData withCallback:^(float x, float y, float residue, NSError *error){
        NSLog(@"x: %f, y: %f", x, y);
       XCTAssertTrue(x>45 && x<55 && y>45 && y<55);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
