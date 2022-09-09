//
//  Bulls_EyeTests.swift
//  Bulls EyeTests
//
//  Created by Celil Çağatay Gedik on 9.09.2022.
//

import XCTest
@testable import Bulls_Eye

class Bulls_EyeTests: XCTestCase {
    
    var game: Game!

    override func setUpWithError() throws {
        game = Game()
    }

    override func tearDownWithError() throws {
        game = nil
        
    }

    func testScorePositive() {
        let guess = game.target + 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    
    func testScoreNegative() {
        let guess = game.target - 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }

    }


