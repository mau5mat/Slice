//
//  ViewController.swift
//  Slice
//
//  Created by Matt Roberts on 27/10/2019.
//  Copyright © 2019 Matt Roberts. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  

  let sliceInputString = "5x5 (0, 0) (1, 3) (4, 4) (4, 2) (4, 2) (0, 1) (3, 2) (2, 3) (4, 1)"
  
  let pizzaBot = PizzaBot()
  let coordinatesBuilder = CoordinatesBuilder()
  let gridBuilder = GridBuilder()

  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    gridBuilder.stringToGrid(withInputString: sliceInputString)
    
    let intArray = coordinatesBuilder.buildIntArray(fromInputString: sliceInputString)
    let coordinateArray = coordinatesBuilder.buildCoordinates(fromIntArray: intArray)
    
    pizzaBot.findDirections(withCoordinatesArray: coordinateArray)
    
    let pizzaBotOutput = pizzaBot.emptyCharacterArray.filter( { $0 != " " } ).joined()
    print("Beep, boop.  Delivery complete sir, my route was.. \n\n \(pizzaBotOutput)")
  }
}

