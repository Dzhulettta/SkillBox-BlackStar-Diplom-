
import UIKit
import Foundation

class CategoriesTableViewCell: UITableViewCell {
    
    //MARK: - Описание ячейки
    
    @IBOutlet weak var categoriesImage: UIImageView!
    @IBOutlet weak var categoriesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoriesImage.layer.cornerRadius = 28
        
    }
    //MARK: - Запись data в ячейки для категории
    
    func initCell(item: Category){
        
        if let cachedVersion = cache.object(forKey: "\(item.image)" as NSString){
            self.categoriesImage.image = cachedVersion
            
        } else if let cachedVersion = cache.object(forKey: "\(item.iconImage)" as NSString) {
            self.categoriesImage.image = cachedVersion
            
        } else {
            DispatchQueue.main.async {
                let stringImgURL = categoriesBlackStarURL + "\(item.image!)"
                let imgURL: URL = URL(string: stringImgURL)!
                if let data = NSData(contentsOf: imgURL) {
                    self.categoriesImage.image = UIImage(data: data as Data)
                    if let image = self.categoriesImage.image{
                        cache.setObject(image, forKey: "\(item.image)" as NSString)
                        
                    } else{
                        let stringImgURL = categoriesBlackStarURL + "\(item.iconImage)"
                        let imgURL: URL = URL(string: stringImgURL)!
                        if let data = NSData(contentsOf: imgURL) {
                            self.categoriesImage.image = UIImage(data: data as Data)
                            if let image = self.categoriesImage.image{
                                cache.setObject(image, forKey: "\(item.iconImage)" as NSString)
                            }
                        }
                    }
                }
            }
        }
        categoriesLabel.text = item.name
    }
    
    //MARK: - Запись data в ячейки для подкатегории
    
    func initCellSub(item: SubCategory){
        
        if let cachedVersion = cache.object(forKey: "\(item.iconImage)" as NSString){
            self.categoriesImage.image = cachedVersion
        } else {
            
            let stringImgURL = categoriesBlackStarURL + "\(item.iconImage)"
            let imgURL: URL = URL(string: stringImgURL)!
            if let data = NSData(contentsOf: imgURL) {
                self.categoriesImage.image = UIImage(data: data as Data)
                if let image = self.categoriesImage.image{
                    cache.setObject(image, forKey: "\(item.iconImage)" as NSString)
                } else{
                    let stringImgURL = categoriesBlackStarURL + "image/catalog/style/modile/sale_cat.png"
                    let imgURL: URL = URL(string: stringImgURL)!
                    if let data = NSData(contentsOf: imgURL) {
                        self.categoriesImage.image = UIImage(data: data as Data)
                        if let image = self.categoriesImage.image{
                            cache.setObject(image, forKey: "\(item.iconImage)" as NSString)
                        }
                    }
                }
            }
        }
        categoriesLabel.text = item.name
    }
}


