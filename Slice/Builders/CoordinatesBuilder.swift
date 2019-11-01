//
//  CoordinatesBuilder.swift
//  Slice
//
//  Created by Matt Roberts on 27/10/2019.
//  Copyright © 2019 Matt Roberts. All rights reserved.
//

import Foundation

class CoordinatesBuilder {
  
  var coordinates = [Coordinates]()
  
  
  func buildIntArray(fromInputString inputString: String) -> [Int] {
    
    var transformedInputString = inputString.components(separatedBy: CharacterSet(charactersIn: "(, )"))
    
    transformedInputString.remove(at: 0)
    
    let intArray = transformedInputString.compactMap( { Int($0) } )
    
    return intArray
  }
  
  /*
   
   - Take the [Int] array from the transformed input string
   - Create an empty [Coordinates] array
   - Assign the first two elements of the [Int] array to a Coordinates object's x, y values
   - After assigning, they should be both removed from the [Int] array (?)
   - The newly created Coordinates object gets appended to the [Coordinates] array
   - Process should be repeated until the [Int] array has been fully iterated over
   
   */
  func buildCoordinates(fromIntArray intArray: [Int]) -> [Coordinates] {
    
    // Turns the array from [1, 2, 3, 4] -> [(1, 2), (3, 4)]
    let pairedIntArray = stride(from: 0, to: intArray.count - 1, by: 2).map {
      (intArray[$0], intArray[$0+1])
    }
    for elements in pairedIntArray {
      coordinates.append(.init(x: elements.0, y: elements.1))
    }
    return coordinates
  }
  
  
}
