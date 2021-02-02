//
//  UserDefaultForSize.swift
//  Diplom(BlackStar)
//
//  Created by Юлия Чужинова on 25.10.2020.
//  Copyright © 2020 Юлия Чужинова. All rights reserved.
//

import Foundation

class Size{
    static let shared = Size()

    private let userSizeKey = "Size.SizeKey"
      var userSize: String? {
          set { UserDefaults.standard.set(newValue, forKey: userSizeKey)}
          get { return UserDefaults.standard.string(forKey: userSizeKey)}
      }
}
