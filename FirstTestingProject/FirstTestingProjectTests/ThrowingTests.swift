//
//  ThrowingTests.swift
//  FirstTestingProjectTests
//
//  Created by alexis on 01/03/21.
//

import Foundation
import XCTest

extension LocalizedError {
   var errorDescription: String? {
      return "\(self)"
   }
}

enum GameError: LocalizedError {
   case notPurchased
   case notInstalled
   case parentalControlsDisallowed
}

struct Game {
   let name: String
    func play() throws {
          if name == "BioBlitz" {
             throw GameError.notPurchased
          } else if name == "Blastazap" {
             throw GameError.notInstalled
          } else if name == "Dead Storm Rising" {
             throw GameError.parentalControlsDisallowed
          } else {
             print("\(name) is OK to play!")
    } }
    }

class ThrowingTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testPlayingBioBlitzThrows() {
        let game = Game(name: "BioBlitz")
        do {
            try game.play()
            XCTFail()
        } catch GameError.notPurchased {
            // success!
        } catch {
            XCTFail()
        }
    }
    
    func testPlayingBlastazapThrows() {
        let game = Game(name: "Blastazap")
        XCTAssertThrowsError(try game.play()) { error in
            XCTAssertEqual(error as? GameError,
                           GameError.notInstalled)
        }
    }
    
    func testDeadStormRisingThrows() throws {
       let game = Game(name: "Dead Storm Rising")
       try game.play()
    }
    
    func testCrashyPlaneDoesntThrow() throws {
       let game = Game(name: "CrashyPlane")
       try game.play()
    }
    
}
