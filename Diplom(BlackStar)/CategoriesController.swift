//
//  CategoriesController.swift
//  Diplom(BlackStar)
//
//  Created by Юлия Чужинова on 21.04.2020.
//  Copyright © 2020 Юлия Чужинова. All rights reserved.
//

import UIKit

class CategoriesController: UIViewController {

    @IBOutlet weak var CategoriesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        CategoriesLoader().loadCategories()
    }


}
