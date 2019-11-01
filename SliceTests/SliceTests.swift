//
//  SliceTests.swift
//  SliceTests
//
//  Created by Matt Roberts on 27/10/2019.
//  Copyright © 2019 Matt Roberts. All rights reserved.
//

import XCTest
@testable import Slice

class SliceTests: XCTestCase {
  
  // I'm unsure why I had to make Grid conform to Equatable in order to test
  func testGridBuilder() {
    let gridBuilder = GridBuilder()
    let testinput = gridBuilder.stringToGrid(withInputString: "5x5 (1, 2) (3, 4)")
    let expectedOutput = Grid(x: 5, y: 5)
    XCTAssertEqual(testinput, expectedOutput)
  }
  
  func testCoordinatesIntArrayBuilder() {
    let coordinatesBuilder = CoordinatesBuilder()
    let testInput = coordinatesBuilder.buildIntArray(fromInputString: "5x5 (1, 2) (3, 4)")
    let expectedOutput = [1, 2, 3, 4]
    XCTAssertEqual(testInput, expectedOutput)
  }
  
  // I'm unsure why I had to make Coordinates conform to Equatable in order to test
  func testCoordinatesBuilder() {
    let coordinatesBuilder = CoordinatesBuilder()
    let testInput = coordinatesBuilder.buildCoordinates(fromIntArray: [1, 2, 3, 4])
    let c1 = Coordinates(x: 1, y: 2)
    let c2 = Coordinates(x: 3, y: 4)
    let expectedOutput = [c1, c2]
    XCTAssertEqual(testInput, expectedOutput)
  }
  
  // I'm honestly unsure how to properly and rigorously test beyond this point
  func testFindDistance() {
    let pizzaBot = PizzaBot()
    let c1 = Coordinates(x: 1, y: 2)
    let c2 = Coordinates(x: 3, y: 4)
    let cArray = [c1, c2]
    let testInput = pizzaBot.findDistance(fromCoordinates: c1, toCoordinates: c2)
    let expectedOutput = ["E", "E", "N", "N"]
    XCTAssertEqual(testInput, expectedOutput)
  }

}
