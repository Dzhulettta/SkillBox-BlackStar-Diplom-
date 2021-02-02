//
//  SubCategoriesTableViewCell.swift
//  Diplom(BlackStar)
//
//  Created by Юлия Чужинова on 20.10.2020.
//  Copyright © 2020 Юлия Чужинова. All rights reserved.
//

import UIKit

class SubCategoriesTableViewCell: UITableViewCell {
    
    //MARK: - Описание ячейки
    
    @IBOutlet weak var subCategoriesLabel: UILabel!
    @IBOutlet weak var subCategoriesImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        subCategoriesImage.layer.cornerRadius = 28
        
    }
    
    //MARK: - Запись data в ячейки для подкатегории
    
    func initCellSub(item: SubCategory){
        let stringImgURL = categoriesBlackStarURL + "\(item.iconImage)"
        let imgURL: URL = URL(string: stringImgURL)!
        if let data = NSData(contentsOf: imgURL) {
            self.subCategoriesImage.image = UIImage(data: data as Data)
        }
        subCategoriesLabel.text = item.name
    }
    
}
