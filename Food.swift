//
//  Food.swift
//  codableScratch
//
//  Created by Christian Wilkerson on 7/16/17.
//  Copyright © 2017 Christian Wilkerson. All rights reserved.
//

import Foundation

struct ServingType: Codable {
  let name: String
  let grams: Float
}

struct Food: Codable {
  let name: String
  let calories: Int
  let carbs: Float
  let servingTypes: [ServingType]
}
