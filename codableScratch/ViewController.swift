//
//  ViewController.swift
//  codableScratch
//
//  Created by Christian Wilkerson on 7/16/17.
//  Copyright © 2017 Christian Wilkerson. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

  @IBOutlet var txtTestLog: NSTextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
  }

  override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
  }

  @IBAction func runTests(_ sender: Any) {
    let servingTypes = [ServingType(name: "can", grams: 100), ServingType(name: "bottle", grams: 300)]
    
    let food = Food(name: "Coke", calories: 150, carbs: 30.0, servingTypes: servingTypes)
    
    txtTestLog.string.append("food - \(food)")
    
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    let data = try! encoder.encode(food)
    txtTestLog.string.append("\n")
    txtTestLog.string.append(String(data: data, encoding: .utf8)!)
    
    let decoder = JSONDecoder()
    let decodedFood = try! decoder.decode(Food.self, from: data)
    txtTestLog.string.append("\n")
    txtTestLog.string.append("decoded food \(decodedFood)")
  }
  
}

