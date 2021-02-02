
import UIKit
import CoreData

class BasketViewControllerViewCell: UITableViewCell {
    
    var copyBasketCoreData = BasketCoreData()
    
    @IBOutlet weak var basketImage: UIImageView!
    @IBOutlet weak var nameProductLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var number: UILabel!
    
    var delegate: AlertControllerDelegate?
    var delegateC: ControllerReload?
    
    var idCell = 0
    
    @IBAction func minusAction(_ sender: Any) {
        copyBasketCoreData.appToCoreDate()
        
        let item = copyBasketCoreData.basketCoreData[idCell]
        var countMinus = Int(item.value(forKey: "count") as! String)!
        if countMinus > 1{
            countMinus -= 1
            item.setValue("\(countMinus)", forKey: "count")
            
            copyBasketCoreData.changeToCoreDate(color: item.value(forKey: "color") as! String, image: item.value(forKey: "image") as! String, name: item.value(forKey: "name") as! String, price: item.value(forKey: "price") as! String, size: item.value(forKey: "size") as! String, count: "\(countMinus)")
            number.text = "\(countMinus)"
            delegateC?.reloadCount()
            
        }
    }
    @IBAction func plusAction(_ sender: Any) {
        copyBasketCoreData.appToCoreDate()
        let item = copyBasketCoreData.basketCoreData[idCell]
        
        var countMinus = Int(item.value(forKey: "count") as! String)!
        countMinus += 1
        item.setValue("\(countMinus)", forKey: "count")
        
        copyBasketCoreData.changeToCoreDate(color: item.value(forKey: "color") as! String, image: item.value(forKey: "image") as! String, name: item.value(forKey: "name") as! String, price: item.value(forKey: "price") as! String, size: item.value(forKey: "size") as! String, count: "\(countMinus)")
        number.text = "\(countMinus)"
        delegateC?.reloadCount()
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        delegate?.loaded(answerId: idCell)
        //при нажатии на ячейку возвращает номер ячейки, которую удаляем
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.copyBasketCoreData.appToCoreDate()
        // загружает новые данные
    }
    
    func initCellCD(item: NSManagedObject){
        
        colorLabel.text = item.value(forKey: "color") as? String
        let string = categoriesBlackStarURL + (item.value(forKey: "image") as! String)
        
        if let image = getImage(from: string) {
            basketImage.image = image
        }
        nameProductLabel.text = item.value(forKey: "name") as? String
        
        let priceInt = item.value(forKey: "price") as! String
        let price = (priceInt as NSString).integerValue
        priceLabel.text = "\(price)₽"
        sizeLabel.text = item.value(forKey: "size") as? String
        number.text = item.value(forKey: "count") as? String
        
    }
    func getImage(from string: String) -> UIImage? {
        guard let url = URL(string: string)
        else {
            print("Unable to create URL")
            return nil
        }
        var image: UIImage? = nil
        do {
            let data = try Data(contentsOf: url, options: [])
            image = UIImage(data: data)
        }
        catch {
            print(error.localizedDescription)
        }
        return image
    }
}
