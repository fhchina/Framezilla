//
//  NUIMakerWidthHeightTests.swift
//  Framezilla
//
//  Created by Nikita on 06/09/16.
//  Copyright © 2016 Nikita. All rights reserved.
//

import XCTest
@testable import Framezilla

class NUIMakerWidthHeightTests: XCTestCase {
    
    var mainView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
    var nestedView1: UIView = UIView(frame: CGRect(x: 100, y: 100, width: 300, height: 300))
    var nestedView2: UIView = UIView(frame: CGRect(x: 50, y: 50, width: 200, height: 150))
    
    var testingView: UIView = UIView()

    override func setUp() {
        super.setUp()
        
        mainView.addSubview(nestedView1)
        mainView.addSubview(testingView)
        nestedView1.addSubview(nestedView2)

        testingView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
    }
    
    override func tearDown() {
        super.tearDown()
        
        nestedView1.removeFromSuperview()
        nestedView2.removeFromSuperview()
        testingView.removeFromSuperview()
    }
    
    func testThanJustSetting_width_configureCorrectly() {
        
        testingView.configureFrames { maker in
            maker.width(400)
        }
        XCTAssertEqual(testingView.frame, CGRect(x: 0, y: 0, width: 400, height: 50))
    }
    
    func testThanJustSetting_height_configureCorrectly() {
        
        testingView.configureFrames { maker in
            maker.height(400)
        }
        XCTAssertEqual(testingView.frame, CGRect(x: 0, y: 0, width: 50, height: 400))
    }
    
    /* with_to */
    
    func testThan_width_to_toAnotherView_width_configureCorrectly() {
        
        testingView.configureFrames { maker in
            maker.width(to: self.nestedView2.nui_width, multiplier: 0.5)
        }
        XCTAssertEqual(testingView.frame, CGRect(x: 0, y: 0, width: 100, height: 50))
    }
    
    func testThan_width_to_toAnotherView_height_configureCorrectly() {
        
        testingView.configureFrames { maker in
            maker.width(to: self.nestedView2.nui_height, multiplier: 1)
        }
        XCTAssertEqual(testingView.frame, CGRect(x: 0, y: 0, width: 150, height: 50))
    }
    
    func testThan_width_to_toSelfView_height_configureCorrectlyWithTopAndBottomSuperViewRelations() {
        
        testingView.configureFrames { maker in
            maker.top(inset: 10)
            maker.bottom(inset: 10)
            maker.width(to: self.testingView.nui_height, multiplier: 0.5)
        }
        XCTAssertEqual(testingView.frame, CGRect(x: 0, y: 10, width: 240, height: 480))
    }
    
    func testThan_width_to_toSelfView_height_configureCorrectlyWithTopAndBottomAnotherViewsRelations() {
        
        testingView.configureFrames { maker in
            maker.top(to: self.nestedView2.nui_top, inset: 10)
            maker.bottom(to: self.nestedView1.nui_bottom, inset: 10)
            maker.width(to: self.testingView.nui_height, multiplier: 0.5)
        }
        XCTAssertEqual(testingView.frame, CGRect(x: 0, y: 160, width: 115, height: 230))
    }
    
    /* height_to */
    
    func testThan_height_to_toAnotherView_width_configureCorrectly() {
        
        testingView.configureFrames { maker in
            maker.height(to: self.nestedView2.nui_width, multiplier: 0.5)
        }
        XCTAssertEqual(testingView.frame, CGRect(x: 0, y: 0, width: 50, height: 100))
    }
    
    func testThan_height_to_toAnotherView_height_configureCorrectly() {
        
        testingView.configureFrames { maker in
            maker.height(to: self.nestedView2.nui_height, multiplier: 1)
        }
        XCTAssertEqual(testingView.frame, CGRect(x: 0, y: 0, width: 50, height: 150))
    }
    
    func testThan_height_to_toSelfView_width_configureCorrectlyWithLeftAndRightSuperViewRelations() {
        
        testingView.configureFrames { maker in
            maker.right(inset: 10)
            maker.left(inset: 10)
            maker.height(to: self.testingView.nui_width, multiplier: 0.5)
        }
        XCTAssertEqual(testingView.frame, CGRect(x: 10, y: 0, width: 480, height: 240))
    }
    
    func testThan_height_to_toSelfView_width_configureCorrectlyWithLeftAndRightAnotherViewsRelations() {
        
        testingView.configureFrames { maker in
            maker.right(to: self.nestedView1.nui_right, inset: 10)
            maker.left(to: self.nestedView1.nui_left, inset: 10)
            maker.height(to: self.testingView.nui_width, multiplier: 0.5)
        }
        XCTAssertEqual(testingView.frame, CGRect(x: 110, y: 0, width: 280, height: 140))
    }
    
    /* height_to with width_to */
    
    func testThan_height_to_correctlyConfigureWithAnotherViewWidthAnd_width_to_toMyselfHeightRelation() {
        
        testingView.configureFrames { maker in
            maker.centerX()
            maker.centerY()
            maker.height(to: self.mainView.nui_width, multiplier: 0.5)
            maker.width(to: self.testingView.nui_height, multiplier: 0.5)
        }
        XCTAssertEqual(testingView.frame, CGRect(x: 187.5, y: 125, width: 125, height: 250))
    }
    
    func testThan_width_to_correctlyConfigureWithAnotherViewHeightAnd_height_to_toMyselfWidthRelation() {
        
        testingView.configureFrames { maker in
            maker.centerX()
            maker.centerY()
            maker.width(to: self.mainView.nui_height, multiplier: 0.5)
            maker.height(to: self.testingView.nui_width, multiplier: 0.5)
        }
        XCTAssertEqual(testingView.frame, CGRect(x: 125, y: 187.5, width: 250, height: 125))
    }
}