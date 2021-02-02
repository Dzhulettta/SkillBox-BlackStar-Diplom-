//
//  ProductDetailViewControllerCell.swift
//  Diplom(BlackStar)
//
//  Created by Юлия Чужинова on 18.06.2020.
//  Copyright © 2020 Юлия Чужинова. All rights reserved.
//

import Foundation
import UIKit

class ProductDetailViewControllerCell2: UICollectionViewCell {
    
    @IBOutlet weak var imageProductDetail: UIImageView!
    
 override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    //MARK: - Запись data в детальный просмотр
    
    func initCell(item: String){

        let stringImgURL = blackStarCollectionsURL2 + "\(item)"
        let imgURL: URL = URL(string: stringImgURL)!
        if let data = NSData(contentsOf: imgURL) {
            self.imageProductDetail.image = UIImage(data: data as Data)
        }

    }
  
}
