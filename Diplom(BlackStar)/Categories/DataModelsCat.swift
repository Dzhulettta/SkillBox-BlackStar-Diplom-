
import Foundation
import UIKit

struct Category: Decodable {
    var name: String
    var sortOrder: Int
    var image: String?
    var iconImage: String
    var iconImageActive: String
    var subCategories: [SubCategory]
    init?(data: NSDictionary) {
        guard let name = data["name"] as? String,
              let sortOrder = data["sortOrder"] as? String,
              let image = data["image"] as? String,
              let iconImage = data["iconImage"] as? String,
              let iconImageActive = data["iconImageActive"] as? String,
              let subcategoriesData = data["subcategories"] as? [NSDictionary] else {
            return nil
        }
        self.name = name
        self.sortOrder = Int(sortOrder) ?? 0
        self.image = image
        self.iconImage = iconImage
        self.iconImageActive = iconImageActive
        self.subCategories = []
        for subData in subcategoriesData{
            if let subCategory = SubCategory(data: subData) {
                subCategories.append(subCategory)
            }
        }
    }
}

struct SubCategory: Decodable {
    var iconImage: String
    var id: String?
    var sortOrder: Int
    var name: String
    var type: String
    init?(data: NSDictionary) {
        guard let iconImage = data["iconImage"] as? String,
              let id = data["id"] as? String,
              let sortOrder = data["sortOrder"] as? String,
              let name = data["name"] as? String,
              let type = data["type"] as? String else {
            return nil
        }
        
        self.id = String(id) ?? ""
        self.iconImage = iconImage
        self.sortOrder = Int(sortOrder) ?? 0
        self.name = name
        self.type = type
    }
}

//{
//    "308": {
//        "name": "Обувь",
//        "sortOrder": "29",
//        "image": "",
//        "iconImage": "image/catalog/style/modile/acc_cat.png",
//        "iconImageActive": "image/catalog/style/modile/acc_cat_active_s.png",
//        "subcategories": []
//    },
//    "67": {
//        "name": "Аксессуары",
//        "sortOrder": "29",
//        "image": "image/catalog/im2017/4.png",
//        "iconImage": "image/catalog/style/modile/acc_cat.png",
//        "iconImageActive": "image/catalog/style/modile/acc_cat_active_s.png",
//        "subcategories": [
//            {
//                "id": "311",
//                "iconImage": "",
//                "sortOrder": "2",
//                "name": "Маски, повязки на лицо",
//                "type": "Category"
//            },
//            {
//                "id": "60",
//                "iconImage": "image/catalog/style/modile/icons-12.png",
//                "sortOrder": "3",
//                "name": "Шапки",
//                "type": "Category"
//            },
//            {
//                "id": "61",
//                "iconImage": "image/catalog/style/modile/icons-09.png",
//                "sortOrder": "1",
//                "name": "Чехлы на телефоны",
//                "type": "Category"
//            },
//            {
//                "id": "62",
//                "iconImage": "image/catalog/style/modile/icons-23.png",
//                "sortOrder": "5",
//                "name": "Носки",
//                "type": "Category"
//            },
//            {
//                "id": "64",
//                "iconImage": "image/catalog/style/modile/icons-02.png",
//                "sortOrder": "2",
//                "name": "Рюкзаки и сумки",
//                "type": "Category"
//            },
//            {
//                "id": "65",
//                "iconImage": "image/catalog/style/modile/icons-15.png",
//                "sortOrder": "2",
//                "name": "Бейсболки и кепки",
//                "type": "Category"
//            },
//            {
//                "id": "138",
//                "iconImage": "image/catalog/style/modile/mobicon-paket.png",
//                "sortOrder": "99",
//                "name": "Другое",
//                "type": "Category"
//            },
//            {
//                "id": "183",
//                "iconImage": "image/catalog/style/modile/icons-18.png",
//                "sortOrder": "98",
//                "name": "Кружки",
//                "type": "Category"
//            },
//            {
//                "id": "187",
//                "iconImage": "image/catalog/style/modile/mobicon-braslet.png",
//                "sortOrder": "9",
//                "name": "Браслеты",
//                "type": "Category"
//            },
//            {
//                "id": "217",
//                "iconImage": "",
//                "sortOrder": "10",
//                "name": "Очки",
//                "type": "Category"
//            },
//            {
//                "id": "248",
//                "iconImage": "",
//                "sortOrder": "0",
//                "name": "Ремни",
//                "type": "Category"
//            },
//            {
//                "id": 67,
//                "iconImage": "image/catalog/style/modile/icons-03.png",
//                "sortOrder": 900,
//                "name": "Все товары категории",
//                "type": "Category"
//            }
//        ]
//    },
//    "68": {
//        "name": "Женская",
//        "sortOrder": "11",
//        "image": "image/catalog/im2017/1.png",
//        "iconImage": "image/catalog/style/modile/girl_cat.png",
//        "iconImageActive": "image/catalog/style/modile/girl_cat_active_s.png",
//        "subcategories": [
//            {
//                "id": "44",
//                "iconImage": "image/catalog/style/modile/icons-11.png",
//                "sortOrder": "8",
//                "name": "Шорты",
//                "type": "Category"
//            },
//            {
//                "id": "45",
//                "iconImage": "image/catalog/style/modile/icons-13.png",
//                "sortOrder": "9",
//                "name": "Юбки",
//                "type": "Category"
//            },
//            {
//                "id": "46",
//                "iconImage": "image/catalog/style/modile/icons-10.png",
//                "sortOrder": "8",
//                "name": "Брюки и леггинсы",
//                "type": "Category"
//            },
//            {
//                "id": "48",
//                "iconImage": "image/catalog/style/modile/icons-20.png",
//                "sortOrder": "7",
//                "name": "Куртки и бомберы",
//                "type": "Category"
//            },
//            {
//                "id": "53",
//                "iconImage": "image/catalog/style/modile/icons-08.png",
//                "sortOrder": "2",
//                "name": "Футболки и майки",
//                "type": "Category"
//            },
//            {
//                "id": "54",
//                "iconImage": "image/catalog/style/modile/icons-25.png",
//                "sortOrder": "5",
//                "name": "Платья",
//                "type": "Category"
//            },
//            {
//                "id": "55",
//                "iconImage": "image/catalog/style/modile/icons-01.png",
//                "sortOrder": "6",
//                "name": "Рубашки",
//                "type": "Category"
//            },
//            {
//                "id": "57",
//                "iconImage": "image/catalog/style/modile/icons-05.png",
//                "sortOrder": "1",
//                "name": "Спортивные костюмы",
//                "type": "Category"
//            },
//            {
//                "id": "58",
//                "iconImage": "image/catalog/style/modile/icons-07.png",
//                "sortOrder": "3",
//                "name": "Толстовки и худи",
//                "type": "Category"
//            },
//            {
//                "id": "134",
//                "iconImage": "image/catalog/style/modile/icons-28.png",
//                "sortOrder": "10",
//                "name": "Нижнее белье",
//                "type": "Category"
//            },
//            {
//                "id": "305",
//                "iconImage": "",
//                "sortOrder": "0",
//                "name": "Art Spray",
//                "type": "Collection"
//            },
//            {
//                "id": "299",
//                "iconImage": "",
//                "sortOrder": "0",
//                "name": "BLACKBLACK",
//                "type": "Collection"
//            },
//            {
//                "id": "301",
//                "iconImage": "",
//                "sortOrder": "0",
//                "name": "Generation 13",
//                "type": "Collection"
//            },
//            {
//                "id": "302",
//                "iconImage": "",
//                "sortOrder": "0",
//                "name": "Gold Lion",
//                "type": "Collection"
//            },
//            {
//                "id": "294",
//                "iconImage": "",
//                "sortOrder": "0",
//                "name": "Gothic Words",
//                "type": "Collection"
//            },
//            {
//                "id": "304",
//                "iconImage": "",
//                "sortOrder": "0",
//                "name": "KIDS ID",
//                "type": "Collection"
//            },
//            {
//                "id": "306",
//                "iconImage": "",
//                "sortOrder": "0",
//                "name": "RUS",
//                "type": "Collection"
//            },
//            {
//                "id": "303",
//                "iconImage": "",
//                "sortOrder": "0",
//                "name": "Terminal 13",
//                "type": "Collection"
//            },
//            {
//                "id": "131",
//                "iconImage": "",
//                "sortOrder": "0",
//                "name": "Коллекция Black Star Mafia",
//                "type": "Collection"
//            },
//            {
//                "id": "275",
//                "iconImage": "",
//                "sortOrder": "0",
//                "name": "Летняя коллекция",
//                "type": "Collection"
//            },
//            {
//                "id": "291",
//                "iconImage": "",
//                "sortOrder": "1",
//                "name": "BLACKWOOD",
//                "type": "Collection"
//            },
//            {
//                "id": "288",
//                "iconImage": "",
//                "sortOrder": "1",
//                "name": "BS Collection",
//                "type": "Collection"
//            },
//            {
//                "id": "300",
//                "iconImage": "",
//                "sortOrder": "1",
//                "name": "Wings",
//                "type": "Collection"
//            },
//            {
//                "id": "286",
//                "iconImage": "",
//                "sortOrder": "1",
//                "name": "Союзмультфильм",
//                "type": "Collection"
//            },
//            {
//                "id": "272",
//                "iconImage": "",
//                "sortOrder": "3",
//                "name": "MULTICOLOR",
//                "type": "Collection"
//            },
//            {
//                "id": "274",
//                "iconImage": "",
//                "sortOrder": "3",
//                "name": "Армия России",
//                "type": "Collection"
//            },
//            {
//                "id": "268",
//                "iconImage": "",
//                "sortOrder": "5",
//                "name": "TOFFEE",
//                "type": "Collection"
//            },
//            {
//                "id": "258",
//                "iconImage": "",
//                "sortOrder": "5",
//                "name": "Коллекция R.U.S.",
//                "type": "Collection"
//            },
//            {
//                "id": "189",
//                "iconImage": "",
//                "sortOrder": "9",
//                "name": "UNIT",
//                "type": "Collection"
//            },
//            {
//                "id": "79",
//                "iconImage": "",
//                "sortOrder": "35",
//                "name": "Коллекция Мота",
//                "type": "Collection"
//            },
//            {
//                "id": "209",
//                "iconImage": "",
//                "sortOrder": "40",
//                "name": "TMT",
//                "type": "Collection"
//            },
//            {
//                "id": "198",
//                "iconImage": "",
//                "sortOrder": "100",
//                "name": "Black Star Sport Wear",
//                "type": "Collection"
//            },
//            {
//                "id": "251",
//                "iconImage": "",
//                "sortOrder": "999",
//                "name": "CALLIGRAPHY",
//                "type": "Collection"
//            },
//            {
//                "id": "246",
//                "iconImage": "",
//                "sortOrder": "999",
//                "name": "LION INK",
//                "type": "Collection"
//            },
//            {
//                "id": "201",
//                "iconImage": "",
//                "sortOrder": "999",
//                "name": "Коллекция VIP77",
//                "type": "Collection"
//            },
//            {
//                "id": "285",
//                "iconImage": "",
//                "sortOrder": "9999",
//                "name": "Флисовые костюмы",
//                "type": "Collection"
//            },
//            {
//                "id": "151",
//                "iconImage": "",
//                "sortOrder": "0",
//                "name": "MOT Merch",
//                "type": "Collection"
//            },
//            {
//                "id": "287",
//                "iconImage": "",
//                "sortOrder": "0",
//                "name": "PABL.A PICNIC",
//                "type": "Collection"
//            },
//            {
//                "id": "295",
//                "iconImage": "",
//                "sortOrder": "0",
//                "name": "Дана Соколова",
//                "type": "Collection"
//            },
//            {
//                "id": "298",
//                "iconImage": "",
//                "sortOrder": "0",
//                "name": "Пашу",
//                "type": "Collection"
//            },
//            {
//                "id": "241",
//                "iconImage": "",
//                "sortOrder": "5",
//                "name": "Natan",
//                "type": "Collection"
//            },
//            {
//                "id": "68",
//                "iconImage": "image/catalog/style/modile/icons-women-3.png",
//                "sortOrder": 900,
//                "name": "Все товары категории",
//                "type": "Category"
//            }
//        ]
//    },
//    "69": {
//        "name": "Мужская",
//        "sortOrder": "0",
//        "image": "image/catalog/im2017/3.png",
//        "iconImage": "image/catalog/style/modile/man_cat.png",
//        "iconImageActive": "image/catalog/style/modile/man_cat_active_s.png",
//        "subcategories": [
//            {
//                "id": "36",
//                "iconImage": "image/catalog/style/modile/icons-10.png",
//                "sortOrder": "6",
//                "name": "Брюки",
//                "type": "Category"
//            },
//            {
//                "id": "38",
//                "iconImage": "image/catalog/style/modile/icons-20.png",
//                "sortOrder": "5",
//                "name": "Куртки и бомберы",
//                "type": "Category"
//            },
//            {
//                "id": "40",
//                "iconImage": "image/catalog/style/modile/icons-08.png",
//                "sortOrder": "2",
//                "name": "Футболки и майки",
//                "type": "Category"
//            },
//            {
//                "id": "41",
//                "iconImage": "image/catalog/style/modile/icons-01.png",
//                "sortOrder": "4",
//                "name": "Рубашки",
//                "type": "Category"
//            },
//            {
//                "id": "42",
//                "iconImage": "image/catalog/style/modile/icons-05.png",
//                "sortOrder": "1",
//                "name": "Спортивные костюмы",
//                "type": "Category"
//            },
//            {
//                "id": "43",
//                "iconImage": "image/catalog/style/modile/icons-07.png",
//                "sortOrder": "3",
//                "name": "Толстовки и худи",
//                "type": "Category"
//            },
//            {
//                "id": "305",
//                "iconImage": "",
//                "sortOrder": "0",
//                "name": "Art Spray",
//                "type": "Collection"
//            },
//            {
//                "id": "299",
//                "iconImage": "",
//                "sortOrder": "0",
//                "name": "BLACKBLACK",
//                "type": "Collection"
//            },
//            {
//                "id": "301",
//                "iconImage": "",
//                "sortOrder": "0",
//                "name": "Generation 13",
//                "type": "Collection"
//            },
//            {
//                "id": "302",
//                "iconImage": "",
//                "sortOrder": "0",
//                "name": "Gold Lion",
//                "type": "Collection"
//            },
//            {
//                "id": "294",
//                "iconImage": "",
//                "sortOrder": "0",
//                "name": "Gothic Words",
//                "type": "Collection"
//            },
//            {
//                "id": "304",
//                "iconImage": "",
//                "sortOrder": "0",
//                "name": "KIDS ID",
//                "type": "Collection"
//            },
//            {
//                "id": "306",
//                "iconImage": "",
//                "sortOrder": "0",
//                "name": "RUS",
//                "type": "Collection"
//            },
//            {
//                "id": "303",
//                "iconImage": "",
//                "sortOrder": "0",
//                "name": "Terminal 13",
//                "type": "Collection"
//            },
//            {
//                "id": "131",
//                "iconImage": "",
//                "sortOrder": "0",
//                "name": "Коллекция Black Star Mafia",
//                "type": "Collection"
//            },
//            {
//                "id": "275",
//                "iconImage": "",
//                "sortOrder": "0",
//                "name": "Летняя коллекция",
//                "type": "Collection"
//            },
//            {
//                "id": "291",
//                "iconImage": "",
//                "sortOrder": "1",
//                "name": "BLACKWOOD",
//                "type": "Collection"
//            },
//            {
//                "id": "288",
//                "iconImage": "",
//                "sortOrder": "1",
//                "name": "BS Collection",
//                "type": "Collection"
//            },
//            {
//                "id": "300",
//                "iconImage": "",
//                "sortOrder": "1",
//                "name": "Wings",
//                "type": "Collection"
//            },
//            {
//                "id": "286",
//                "iconImage": "",
//                "sortOrder": "1",
//                "name": "Союзмультфильм",
//                "type": "Collection"
//            },
//            {
//                "id": "272",
//                "iconImage": "",
//                "sortOrder": "3",
//                "name": "MULTICOLOR",
//                "type": "Collection"
//            },
//            {
//                "id": "274",
//                "iconImage": "",
//                "sortOrder": "3",
//                "name": "Армия России",
//                "type": "Collection"
//            },
//            {
//                "id": "268",
//                "iconImage": "",
//                "sortOrder": "5",
//                "name": "TOFFEE",
//                "type": "Collection"
//            },
//            {
//                "id": "258",
//                "iconImage": "",
//                "sortOrder": "5",
//                "name": "Коллекция R.U.S.",
//                "type": "Collection"
//            },
//            {
//                "id": "189",
//                "iconImage": "",
//                "sortOrder": "9",
//                "name": "UNIT",
//                "type": "Collection"
//            },
//            {
//                "id": "79",
//                "iconImage": "",
//                "sortOrder": "35",
//                "name": "Коллекция Мота",
//                "type": "Collection"
//            },
//            {
//                "id": "209",
//                "iconImage": "",
//                "sortOrder": "40",
//                "name": "TMT",
//                "type": "Collection"
//            },
//            {
//                "id": "198",
//                "iconImage": "",
//                "sortOrder": "100",
//                "name": "Black Star Sport Wear",
//                "type": "Collection"
//            },
//            {
//                "id": "251",
//                "iconImage": "",
//                "sortOrder": "999",
//                "name": "CALLIGRAPHY",
//                "type": "Collection"
//            },
//            {
//                "id": "246",
//                "iconImage": "",
//                "sortOrder": "999",
//                "name": "LION INK",
//                "type": "Collection"
//            },
//            {
//                "id": "201",
//                "iconImage": "",
//                "sortOrder": "999",
//                "name": "Коллекция VIP77",
//                "type": "Collection"
//            },
//            {
//                "id": "285",
//                "iconImage": "",
//                "sortOrder": "9999",
//                "name": "Флисовые костюмы",
//                "type": "Collection"
//            },
//            {
//                "id": "151",
//                "iconImage": "",
//                "sortOrder": "0",
//                "name": "MOT Merch",
//                "type": "Collection"
//            },
//            {
//                "id": "287",
//                "iconImage": "",
//                "sortOrder": "0",
//                "name": "PABL.A PICNIC",
//                "type": "Collection"
//            },
//            {
//                "id": "295",
//                "iconImage": "",
//                "sortOrder": "0",
//                "name": "Дана Соколова",
//                "type": "Collection"
//            },
//            {
//                "id": "298",
//                "iconImage": "",
//                "sortOrder": "0",
//                "name": "Пашу",
//                "type": "Collection"
//            },
//            {
//                "id": "241",
//                "iconImage": "",
//                "sortOrder": "5",
//                "name": "Natan",
//                "type": "Collection"
//            },
//            {
//                "id": "69",
//                "iconImage": "image/catalog/style/modile/icons-man-3.png",
//                "sortOrder": 900,
//                "name": "Все товары категории",
//                "type": "Category"
//            }
//        ]
//    },
//    "73": {
//        "name": "Детская",
//        "sortOrder": "28",
//        "image": "image/catalog/im2017/2.png",
//        "iconImage": "image/catalog/style/modile/child_cat.png",
//        "iconImageActive": "image/catalog/style/modile/child_cat_active_s.png",
//        "subcategories": [
//            {
//                "id": "177",
//                "iconImage": "image/catalog/style/modile/icons-20.png",
//                "sortOrder": "4",
//                "name": "Куртки и бомберы",
//                "type": "Category"
//            },
//            {
//                "id": "178",
//                "iconImage": "image/catalog/style/modile/icons-10.png",
//                "sortOrder": "5",
//                "name": "Брюки и леггинсы",
//                "type": "Category"
//            },
//            {
//                "id": "179",
//                "iconImage": "image/catalog/style/modile/icons-05.png",
//                "sortOrder": "3",
//                "name": "Толстовки",
//                "type": "Category"
//            },
//            {
//                "id": "180",
//                "iconImage": "image/catalog/style/modile/icons-08.png",
//                "sortOrder": "2",
//                "name": "Футболки и платья",
//                "type": "Category"
//            },
//            {
//                "id": "181",
//                "iconImage": "image/catalog/style/modile/icons-07.png",
//                "sortOrder": "1",
//                "name": "Спортивные костюмы",
//                "type": "Category"
//            },
//            {
//                "id": "185",
//                "iconImage": "image/catalog/style/modile/icons-11.png",
//                "sortOrder": "6",
//                "name": "Шорты",
//                "type": "Category"
//            }
//        ]
//    },
//    "74": {
//        "name": "Коллекции",
//        "sortOrder": "38",
//        "image": "",
//        "iconImage": "image/catalog/style/modile/acc_cat.png",
//        "iconImageActive": "image/catalog/style/modile/acc_cat_active_s.png",
//        "subcategories": []
//    },
//    "123": {
//        "name": "Предзаказ",
//        "sortOrder": "87",
//        "image": "",
//        "iconImage": "image/catalog/style/modile/acc_cat.png",
//        "iconImageActive": "image/catalog/style/modile/acc_cat_active_s.png",
//        "subcategories": []
//    },
//    "156": {
//        "name": "Скидки",
//        "sortOrder": "99",
//        "image": "image/catalog/im2017/5.png",
//        "iconImage": "image/catalog/style/modile/sale_cat.png",
//        "iconImageActive": "image/catalog/style/modile/sale_cat_active_s.png",
//        "subcategories": [
//            {
//                "id": "157",
//                "iconImage": "",
//                "sortOrder": "0",
//                "name": "Для мужчин",
//                "type": "Category"
//            },
//            {
//                "id": "158",
//                "iconImage": "",
//                "sortOrder": "1",
//                "name": "Для женщин",
//                "type": "Category"
//            },
//            {
//                "id": "159",
//                "iconImage": "",
//                "sortOrder": "2",
//                "name": "Для детей",
//                "type": "Category"
//            },
//            {
//                "id": "160",
//                "iconImage": "",
//                "sortOrder": "3",
//                "name": "Аксессуары",
//                "type": "Category"
//            }
//        ]
//    },
//    "165": {
//        "name": "Новинки",
//        "sortOrder": "100",
//        "image": "image/catalog/mob/bannermobhome170810.jpg",
//        "iconImage": "image/170829newmob.png",
//        "iconImageActive": "image/170829newmob_act.png",
//        "subcategories": [
//            {
//                "id": "166",
//                "iconImage": "",
//                "sortOrder": "1",
//                "name": "Для мужчин",
//                "type": "Category"
//            },
//            {
//                "id": "167",
//                "iconImage": "",
//                "sortOrder": "2",
//                "name": "Для женщин",
//                "type": "Category"
//            },
//            {
//                "id": "168",
//                "iconImage": "",
//                "sortOrder": "3",
//                "name": "Для детей",
//                "type": "Category"
//            },
//            {
//                "id": "169",
//                "iconImage": "",
//                "sortOrder": "4",
//                "name": "Аксессуары",
//                "type": "Category"
//            }
//        ]
//    }
//}
