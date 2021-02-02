
import Foundation
import SVProgressHUD
import UIKit

protocol CategoriesLoaderDelegate {
    func loaded(categories: [Category])
    func keysCategoriesAndCategoriesLoaded(keysCategoriesAndCategories: [String: Category])
}

class CategoriesLoader {
    
    var delegate: CategoriesLoaderDelegate?
    
    func loadCategories() {
        
        let url = URL(string: blackStarURL)
        let request = URLRequest(url: url!)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data,
               let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
               let jsonDict = json as? NSDictionary{
                var categories: [Category] = []
                var keysCategoriesAndCategories: [String: Category] = [:]
                for (_, data) in jsonDict where data is NSDictionary{
                    
                    // не отделяются пустые ячейки
                    if jsonDict.allValues.count != 0 {
                        if let category = Category(data: data as! NSDictionary){
                            let key = "\(jsonDict.allKeys(for: data)[0])"
                            categories.append(category)
                            keysCategoriesAndCategories.updateValue(category, forKey: (key))
                        }
                    }
                }
                DispatchQueue.main.async {
                    SVProgressHUD.dismiss()
                    self.delegate?.loaded(categories: categories)
                    self.delegate?.keysCategoriesAndCategoriesLoaded(keysCategoriesAndCategories: keysCategoriesAndCategories)
                }
            }
        }
        task.resume()
    }
}

