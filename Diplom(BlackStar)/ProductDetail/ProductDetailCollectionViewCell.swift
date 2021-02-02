//
//  ProductDetailCollectionViewCell.swift
//  Diplom(BlackStar)
//
//  Created by Юлия Чужинова on 21.10.2020.
//  Copyright © 2020 Юлия Чужинова. All rights reserved.
//

import UIKit

class ProductDetailCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageProductDetail: UIImageView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    //MARK: - Запись data в детальный просмотр
    
    func initCell(item: String){
        
        if let cachedVersion = cache.object(forKey: "\(item)" as NSString){
            self.imageProductDetail.image = cachedVersion
            
        } else {
            DispatchQueue.main.async {
                
                let stringImgURL = blackStarCollectionsURL2 + "\(item)"
                let imgURL: URL = URL(string: stringImgURL)!
                if let data = NSData(contentsOf: imgURL) {
                    self.imageProductDetail.image = UIImage(data: data as Data)
                    if let image = self.imageProductDetail.image{
                        cache.setObject(image, forKey: "\(item)" as NSString)
                    }
                }
            }
        }
    }
}
