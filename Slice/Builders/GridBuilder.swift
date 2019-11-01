//
//  GridBuilder.swift
//  Slice
//
//  Created by Matt Roberts on 27/10/2019.
//  Copyright © 2019 Matt Roberts. All rights reserved.
//

import Foundation

class GridBuilder {
  
  /*
   
   - Takes the input string and delimits it until the Grid size is found
   - If the Grid isn't specified correctly, it will return an empty grid
   - Can probably do this better
   
   */
  func stringToGrid(withInputString inputString: String) -> Grid {
    var transformedInputString = inputString.components(separatedBy: CharacterSet(charactersIn: " x"))
    
    guard let width = Int(transformedInputString[0]) else { return Grid(x: 0, y: 0) }
    guard let height = Int(transformedInputString[1]) else { return Grid(x: 0, y: 0) }
    
    
    let gridSize = Grid(x: width, y: height)
    
    validateGridSize(withGrid: gridSize)
    
    print("Beep, boop.  Calculating Grid Size..\n\nThe Grid size is: \(gridSize.x)x\(gridSize.y)\n\n")
    
    return gridSize
  }
  
  func validateGridSize(withGrid grid: Grid) {
    guard grid.x < 6 else {
      print("Grid's X value is out of bounds!")
      return
    }
    
    guard grid.y < 6 else {
      print("Grid's Y value is out of bounds!")
      return
    }
  }
}
