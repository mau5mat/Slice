//
//  PizzaBot.swift
//  Slice
//
//  Created by Matt Roberts on 27/10/2019.
//  Copyright © 2019 Matt Roberts. All rights reserved.
//

import Foundation

class PizzaBot {
  
  var startingCoordinates = Coordinates(x: 0, y: 0)
  var emptyCharacterArray = [String]()
  
  /*
   
   Coordinates has an x and y value
   
   from(x: 5, y: 5) -> to(x: 7, y: 7)
   
   - If the from.X value is lower than the to.X value, bot is travelling East
   - If the from.X value is higher than the to.X value, bot is travelling West
   - If the from.Y value is lower than the to.Y value, bot is travelling North
   - If the from.Y value is higher than the to.Y value, bot is travelling South
   
   */
  func findDistance(fromCoordinates from: Coordinates, toCoordinates to: Coordinates) {
    
    let distanceFromX = to.x - from.x
    let distanceFromY = to.y - from.y
    
    if distanceFromX > 0 {
      moveEast(repeatedWith: distanceFromX)
    } else {
      moveWest(repeatedWith: distanceFromX)
    }
    
    if distanceFromY > 0 {
      moveNorth(repeatedWith: distanceFromY)
    } else {
      moveSouth(repeatedWith: distanceFromY)
    }
  }
  

  func findDirections(withCoordinatesArray coordinatesArray: [Coordinates]) {
    var firstIndex = 0
    var secondIndex = 1
    
    for coordinates in 0..<coordinatesArray.count-1 {
      findDistance(fromCoordinates: coordinatesArray[firstIndex], toCoordinates: coordinatesArray[secondIndex])
      
      dropDelivery(repeatedWith: 1)
      
      firstIndex = secondIndex
      secondIndex += 1
    }
  }
  
  
  func moveNorth(repeatedWith number: Int) {
    for _ in 0..<number {
      emptyCharacterArray.append("N")
    }
  }
  
  func moveEast(repeatedWith number: Int) {
    for _ in 0..<number {
      emptyCharacterArray.append("E")
    }
  }
  
  func moveSouth(repeatedWith number: Int) {
    if number != 0 {
      for _ in number..<0 {
        emptyCharacterArray.append("S")
      }
    } else {
      emptyCharacterArray.append(" ")
    }
  }
  
  func moveWest(repeatedWith number: Int) {
    if number != 0 {
      for _ in number..<0 {
        emptyCharacterArray.append("W")
      }
    } else {
      emptyCharacterArray.append(" ")
    }
  }
  
  func dropDelivery(repeatedWith number: Int) {
      emptyCharacterArray.append("D")
  }
}
