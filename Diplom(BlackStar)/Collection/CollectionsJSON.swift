
import Foundation

protocol CollectionsLoaderDelegate {
    func loaded(collections: [Collections])
}

class CollectionsLoader {
    
    var delegate: CollectionsLoaderDelegate?
    
    func loadCollections(categoriesID: String) {
        
        let url = URL(string: blackStarCollectionsURL + "\(categoriesID)")
        
        let request = URLRequest(url: url!)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data,
               let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
               let jsonDict = json as? NSDictionary{
                var collections: [Collections] = []
                for (_, data) in jsonDict where data is NSDictionary{
                    if jsonDict.allValues.count != 0 {
                        if let collection = Collections(data: data as! NSDictionary)
                        { collections.append(collection) }
                    }
                }
                DispatchQueue.main.async {
                    self.delegate?.loaded(collections: collections)
                }
            }
        }
        task.resume()
    }
}
