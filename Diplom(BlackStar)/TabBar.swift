//
//  TabBar.swift
//  Diplom(BlackStar)
//
//  Created by Юлия Чужинова on 03.11.2020.
//  Copyright © 2020 Юлия Чужинова. All rights reserved.
//

import UIKit
import CoreData

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        BasketCoreData.shared.appToCoreDate()
        let badgeValue = BasketCoreData.shared.basketCoreData.count

        if badgeValue != 0{
            tabBar.items?[1].badgeValue = String(badgeValue)
        }
    }
}
