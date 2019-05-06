//
//  XPHighlightSegmentControlUITests.m
//  XPHighlightSegmentControlUITests
//
//  Created by iOS Dev on 2019/5/5.
//  Copyright © 2019年 Panyijie. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface XPHighlightSegmentControlUITests : XCTestCase

@end

@implementation XPHighlightSegmentControlUITests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;

    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    
    XCUIElement *element = [[[[[[XCUIApplication alloc] init] childrenMatchingType:XCUIElementTypeWindow] elementBoundByIndex:0] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element;
    XCUIElement *button = [[element childrenMatchingType:XCUIElementTypeButton] elementBoundByIndex:1];
    [button tap];
    
    XCUIElement *button2 = [[element childrenMatchingType:XCUIElementTypeButton] elementBoundByIndex:3];
    [button2 tap];
    
    XCUIElement *button3 = [[element childrenMatchingType:XCUIElementTypeButton] elementBoundByIndex:0];
    [button3 tap];
    
    XCUIElement *button4 = [[element childrenMatchingType:XCUIElementTypeButton] elementBoundByIndex:2];
    [button4 tap];
    [button2 tap];
    [button3 tap];
    [button4 tap];
    [button2 tap];
    [button3 tap];
    [button tap];
    [button2 tap];
    [button tap];
    [button2 tap];
    [button3 tap];
    [button tap];
    [button2 tap];
    [button tap];
    [button3 tap];
    [button2 tap];
    [button4 tap];
    
        
}

@end
