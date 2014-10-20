//
//  FPIconFontKitTests.swift
//  FPIconFontKitTests
//
//  Created by hewig on 10/16/14.
//  Copyright (c) 2014 hewig. All rights reserved.
//

import Cocoa
import XCTest
import FPIconFontKit

class FPIconFontKitTests: XCTestCase {
    
    var testFontPath = ""
    override func setUp() {
        super.setUp()
        self.testFontPath = "../octicons/octicons/octicons.ttf"
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLoadIconFont() {
        let iconFont = FPIconFont(path:self.testFontPath)
        XCTAssert(iconFont.glyphCount != 174, "Pass")
    }
    
    func testGetImage() {
        let iconFont = FPIconFont(path: self.testFontPath)
        let image = iconFont.getImage("heart", size: 24, color: NSColor.purpleColor())
        XCTAssert(image != nil, "Pass")
    }
    
}
