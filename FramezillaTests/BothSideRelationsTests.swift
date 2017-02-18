//
//  BothSideRelationsTests.swift
//  Framezilla
//
//  Created by Nikita on 06/09/16.
//  Copyright © 2016 Nikita. All rights reserved.
//

import XCTest

class BothSideRelationsTests: BaseTest {
    
    /* rigth-left */
    
    func testThatRightAndLeftForSuperviewConfiguresCorrectly() {
        
        testingView.configureFrames { maker in
            maker.centerY()
            maker.height(100)
            maker.left(inset: 10).and.right(inset: 10)
        }
        XCTAssertEqual(testingView.frame, CGRect(x: 10, y: 200, width: 480, height: 100))
    }
    
    func testThatRightAndLeftForAnotherViewConfiguresCorrectly() {
        
        testingView.configureFrames { maker in
            maker.centerY()
            maker.height(100)
            maker.left(to: nestedView1.nui_left, inset: 10)
            maker.right(to: nestedView1.nui_right, inset: 10)
        }
        XCTAssertEqual(testingView.frame, CGRect(x: 110, y: 200, width: 280, height: 100))
    }
    
    /* top-bottom */
    
    func testThatBottomtAndTopForSuperviewConfiguresCorrectly() {
        
        testingView.configureFrames { maker in
            maker.centerX()
            maker.width(100)
            maker.top(inset: 10).and.bottom(inset: 10)
        }
        XCTAssertEqual(testingView.frame, CGRect(x: 200, y: 10, width: 100, height: 480))
    }
    
    func testThatBottomtAndTopForAnotherViewConfiguresCorrectly() {
        
        testingView.configureFrames { maker in
            maker.centerX()
            maker.width(100)
            maker.top(to: nestedView1.nui_top, inset: 10)
            maker.bottom(to: nestedView1.nui_bottom, inset: 10)
        }
        XCTAssertEqual(testingView.frame, CGRect(x: 200, y: 110, width: 100, height: 280))
    }
}
