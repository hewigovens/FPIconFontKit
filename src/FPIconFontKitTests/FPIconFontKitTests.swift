//
//  FPIconFontKitTests.swift
//  FPIconFontKitTests
//
//  Created by hewig on 10/16/14.
//  Copyright (c) 2014 hewig. All rights reserved.
//

import Cocoa
import XCTest

class FPIconFontKitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLoad() {
        
        let path = "/Users/hewig/Desktop/octicons.ttf"
        
        let provider = CGDataProviderCreateWithFilename(path)
        let cgFont = CGFontCreateWithDataProvider(provider)
        
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
