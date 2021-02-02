////
////  SubCategoriesJSON.swift
////  Diplom(BlackStar)
////
////  Created by Юлия Чужинова on 20.10.2020.
////  Copyright © 2020 Юлия Чужинова. All rights reserved.
////
//
//import Foundation
//import SVProgressHUD
//
//protocol SubCategoriesLoaderDelegate {
//    func loaded(subCategories: [SubCategory])
//}
//class SubCategoriesLoader {
//
//    var delegate: SubCategoriesLoaderDelegate?
//
//    func loadSubCategories() {
//        let url = URL(string: blackStarURL)
//        let request = URLRequest(url: url!)
//
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            if let data = data,
//                let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
//                let jsonDict = json as? NSDictionary{
////                print(json)
//                var subCategories: [SubCategory] = []
//                for (_, data) in jsonDict where data is NSDictionary{
//                    // не отделяются пустые ячейки
//                    if jsonDict.allValues.count != 0 {
//                    if let subCategory = SubCategory(data: data as! NSDictionary)
//                    { subCategories.append(subCategory) }
//                    }
//                }
////                print(subCategories.count)
//                DispatchQueue.main.async {
//                    SVProgressHUD.dismiss()
//                    self.delegate?.loaded(subCategories: subCategories)
//                }
//            }
//        }
//        task.resume()
//
//    }
//}
