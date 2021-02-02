
import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var priceView: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameView: UILabel!
    @IBOutlet weak var payButton: UIButton!
    @IBAction func buy(_ sender: Any) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        payButton.layer.cornerRadius = 5
    }
    //MARK: - Запись data в ячейки для категории
    
    func initCell(item: Collections){
        
        if let cachedVersion = cache.object(forKey: "\(item.mainImage)" as NSString){
            self.imageView.image = cachedVersion
            
        } else {
            DispatchQueue.main.async {
                let stringImgURL = blackStarCollectionsURL2 + "\(item.mainImage)"
                let imgURL: URL = URL(string: stringImgURL)!
                if let data = NSData(contentsOf: imgURL) {
                    self.imageView.image = UIImage(data: data as Data)
                    if let image = self.imageView.image{
                        cache.setObject(image, forKey: "\(item.mainImage)" as NSString)
                    }
                }
            }
        }
            nameView.text = item.name
            let priceInt = (item.price as NSString).integerValue
            priceView.text = "\(priceInt)₽"
        }
    }
