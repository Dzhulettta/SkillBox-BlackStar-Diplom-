//
//  DataModelsSub.swift
//  Diplom(BlackStar)
//
//  Created by Юлия Чужинова on 20.10.2020.
//  Copyright © 2020 Юлия Чужинова. All rights reserved.
//

//import Foundation
//
//struct SubCategory {
//    var iconImage: String
//    var id: String?
//    var sortOrder: Int
//    var name: String
//    var type: String
//    init?(data: NSDictionary) {
//        guard let iconImage = data["iconImage"] as? String,
//            let id = data["id"] as? String,
//            let sortOrder = data["sortOrder"] as? String,
//            let name = data["name"] as? String,
//            let type = data["type"] as? String else {
//                return nil
//        }
//
//        self.id = String(id) ?? ""
//        self.iconImage = iconImage
//        self.sortOrder = Int(sortOrder) ?? 0
//        self.name = name
//        self.type = type
//    }
//}
