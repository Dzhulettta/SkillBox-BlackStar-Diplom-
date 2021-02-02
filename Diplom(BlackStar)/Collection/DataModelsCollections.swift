
import Foundation

struct Collections {
    var name: String
    var description: String?
    var colorName: String?
    var mainImage: String
    var productImages: [ProductImages]
    var offers: [Offers]
    var price: String
    
    init?(data: NSDictionary) {
        guard let name = data["name"] as? String,
              let description = data["description"] as? String,
              let colorName = data["colorName"] as? String,
              let mainImage = data["mainImage"] as? String,
              let productImagesData = data["productImages"] as? NSArray,
              let offersData = data["offers"] as? NSArray,
              let price = data["price"] as? String else {
            return nil
        }
        self.name = name
        self.description = description
        self.colorName = colorName
        self.mainImage = mainImage
        self.productImages = []
        for collData in productImagesData{
            if let data = collData as? NSDictionary,
               let productImage = ProductImages(data: data)
            { productImages.append(productImage) }
        }
        self.offers = []
        for collData in offersData{
            if let data = collData as? NSDictionary,
            let offer = Offers(data: data)
            { offers.append(offer) }
        }
        self.price = price
    }
}

struct ProductImages {
    
    var imageURL: String
    var sortOrder: String
    init?(data: NSDictionary) {
        guard let imageURL = data["imageURL"] as? String,
        let sortOrder = data["sortOrder"] as? String  else {
        
            return nil
        }
        self.imageURL = imageURL
        self.sortOrder = sortOrder
    }
}
struct Offers {
    
    var size: String
    var productOfferID: String
    init?(data: NSDictionary) {
        guard let size = data["size"] as? String,
              let productOfferID = data["productOfferID"] as? String else {
            return nil
        }
        self.size = size
        self.productOfferID = productOfferID
    }
}


//{
//    "7195_219": {
//        "name": "Костюм спортивный LUX",
//        "englishName": "Sports suit LUX",
//        "sortOrder": "0",
//        "article": "MA0120-006",
//        "collection": null,
//        "description": "Роскошно, дорого, изящно! Это все про спортивный костюм LUX от Black Star Wear! Сочетание насыщенного черного цвета и блестящего золота будет притягивать взгляды окружающих и поднимать вашу самооценку. В таком костюме можно смело отправиться на красную дорожку!&nbsp;Герб Black Star в новом исполнении украшает брюки. Ажурный золотой орнамент разливается по всему худи. Такого костюма вы точно больше не увидите!",
//        "colorName": "Черный",
//        "colorImageURL": "image/catalog/style/color/black_000000.jpg",
//        "mainImage": "image/cache/catalog/p/7195/9t0a7234-h_1_630x840.jpg",
//        "productImages": [
//            {
//                "imageURL": "image/cache/catalog/p/7195/9t0a7233-h_1_630x840.jpg",
//                "sortOrder": "1"
//            },
//            {
//                "imageURL": "image/cache/catalog/p/7195/9t0a7236-h_1_630x840.jpg",
//                "sortOrder": "2"
//            },
//            {
//                "imageURL": "image/cache/catalog/p/7195/9t0a7239-h_1_630x840.jpg",
//                "sortOrder": "3"
//            },
//            {
//                "imageURL": "image/cache/catalog/p/7195/9t0a7240-h_1_630x840.jpg",
//                "sortOrder": "4"
//            },
//            {
//                "imageURL": "image/cache/catalog/p/7195/9t0a7241-h_1_630x840.jpg",
//                "sortOrder": "5"
//            },
//            {
//                "imageURL": "image/cache/catalog/p/7195/9t0a7242-h_1_630x840.jpg",
//                "sortOrder": "6"
//            }
//        ],
//        "offers": [
//            {
//                "size": "XS",
//                "productOfferID": "38086",
//                "quantity": 1
//            },
//            {
//                "size": "S",
//                "productOfferID": "38084",
//                "quantity": 1
//            },
//            {
//                "size": "M",
//                "productOfferID": "38083",
//                "quantity": 1
//            },
//            {
//                "size": "L",
//                "productOfferID": "38082",
//                "quantity": 1
//            },
//            {
//                "size": "XL",
//                "productOfferID": "38085",
//                "quantity": 1
//            }
//        ],
//        "recommendedProductIDs": [
//            "6903_250",
//            "7084_219",
//            "6769_314",
//            "6887_219",
//            "6915_219",
//            "6917_219"
//        ],
//        "instagramPhotos": [],
//        "price": "10900.0000",
//        "preorder": "Предзаказ",
//        "tag": "Предзаказ",
//        "attributes": [
//            {
//                "Декоративный элемент": "принт"
//            },
//            {
//                "Рисунок": " другое"
//            },
//            {
//                "Сезон": "круглогодичный"
//            },
//            {
//                "Состав": "100% хлопок"
//            },
//            {
//                "Страна производителя": "Россия"
//            },
//            {
//                "Уход за вещами": "бережная стирка при 30 градусах"
//            }
//        ]
//    },
//    "7210_330": {
//        "name": "Платье COLOR BSW",
//        "englishName": "Платье COLOR BSW",
//        "sortOrder": "0",
//        "article": "LA1820-027",
//        "collection": null,
//        "description": "Ориентировочная дата поступления на склад - 25.05.2020 г.",
//        "colorName": "Лаймовый",
//        "colorImageURL": "image/catalog/style/color/lime_00ff00.png",
//        "mainImage": "image/cache/catalog/p/7210/9t0a7353-h_1_630x840.jpg",
//        "productImages": [
//            {
//                "imageURL": "image/cache/catalog/p/7210/9t0a7351-h_1_630x840.jpg",
//                "sortOrder": "9"
//            },
//            {
//                "imageURL": "image/cache/catalog/p/7210/e9t0a7353-h_1_630x840.jpg",
//                "sortOrder": "10"
//            },
//            {
//                "imageURL": "image/cache/catalog/p/7210/9t0a7354-h_1_630x840.jpg",
//                "sortOrder": "11"
//            },
//            {
//                "imageURL": "image/cache/catalog/p/7210/9t0a7356-h_1_630x840.jpg",
//                "sortOrder": "12"
//            }
//        ],
//        "offers": [
//            {
//                "size": "XS",
//                "productOfferID": "38138",
//                "quantity": 1
//            },
//            {
//                "size": "S",
//                "productOfferID": "38137",
//                "quantity": 1
//            },
//            {
//                "size": "M",
//                "productOfferID": "38136",
//                "quantity": 1
//            },
//            {
//                "size": "L",
//                "productOfferID": "38135",
//                "quantity": 1
//            }
//        ],
//        "recommendedProductIDs": [
//            "7195_219"
//        ],
//        "instagramPhotos": [],
//        "price": "2000.0000",
//        "preorder": "Предзаказ",
//        "tag": "Предзаказ",
//        "attributes": [
//            {
//                "Декоративный элемент": "нашивка"
//            },
//            {
//                "Рисунок": " надпись"
//            },
//            {
//                "Сезон": "круглогодичный"
//            },
//            {
//                "Состав": "95% хлопок; 5% эластан"
//            },
//            {
//                "Страна производителя": "Россия"
//            },
//            {
//                "Уход за вещами": "бережная стирка при 30 градусах"
//            }
//        ]
//    },
//    "7210_250": {
//        "name": "Платье COLOR BSW",
//        "englishName": "Платье COLOR BSW",
//        "sortOrder": "0",
//        "article": "LA1820-027",
//        "collection": null,
//        "description": "Ориентировочная дата поступления на склад - 25.05.2020 г.",
//        "colorName": "Серый",
//        "colorImageURL": "image/catalog/style/color/grey_838383.jpg",
//        "mainImage": "image/cache/catalog/p/7210/9t0a7348-h_1_630x840.jpg",
//        "productImages": [
//            {
//                "imageURL": "image/cache/catalog/p/7210/9t0a7342-h_1_630x840.jpg",
//                "sortOrder": "5"
//            },
//            {
//                "imageURL": "image/cache/catalog/p/7210/9t0a7345-h_1_630x840.jpg",
//                "sortOrder": "6"
//            },
//            {
//                "imageURL": "image/cache/catalog/p/7210/9t0a7349-h_1_630x840.jpg",
//                "sortOrder": "7"
//            }
//        ],
//        "offers": [
//            {
//                "size": "XS",
//                "productOfferID": "38131",
//                "quantity": 1
//            },
//            {
//                "size": "S",
//                "productOfferID": "38132",
//                "quantity": 1
//            },
//            {
//                "size": "M",
//                "productOfferID": "38133",
//                "quantity": 1
//            },
//            {
//                "size": "L",
//                "productOfferID": "38134",
//                "quantity": 1
//            }
//        ],
//        "recommendedProductIDs": [
//            "7195_219"
//        ],
//        "instagramPhotos": [],
//        "price": "2000.0000",
//        "preorder": "Предзаказ",
//        "tag": "Предзаказ",
//        "attributes": [
//            {
//                "Декоративный элемент": "нашивка"
//            },
//            {
//                "Рисунок": " надпись"
//            },
//            {
//                "Сезон": "круглогодичный"
//            },
//            {
//                "Состав": "95% хлопок; 5% эластан"
//            },
//            {
//                "Страна производителя": "Россия"
//            },
//            {
//                "Уход за вещами": "бережная стирка при 30 градусах"
//            }
//        ]
//    },
//    "7210_331": {
//        "name": "Платье COLOR BSW",
//        "englishName": "Платье COLOR BSW",
//        "sortOrder": "0",
//        "article": "LA1820-027",
//        "collection": null,
//        "description": "Ориентировочная дата поступления на склад - 25.05.2020 г.",
//        "colorName": "Хаки",
//        "colorImageURL": "image/catalog/style/color/khaki_c3b091.jpg",
//        "mainImage": "image/cache/catalog/p/7210/9t0a7333-h_1_630x840.jpg",
//        "productImages": [
//            {
//                "imageURL": "image/cache/catalog/p/7210/9t0a7334-h_1_630x840.jpg",
//                "sortOrder": "1"
//            },
//            {
//                "imageURL": "image/cache/catalog/p/7210/9t0a7338-h_1_630x840.jpg",
//                "sortOrder": "2"
//            },
//            {
//                "imageURL": "image/cache/catalog/p/7210/9t0a7340-h_1_630x840.jpg",
//                "sortOrder": "3"
//            }
//        ],
//        "offers": [
//            {
//                "size": "XS",
//                "productOfferID": "38128",
//                "quantity": 1
//            },
//            {
//                "size": "S",
//                "productOfferID": "38129",
//                "quantity": 1
//            },
//            {
//                "size": "M",
//                "productOfferID": "38130",
//                "quantity": 1
//            },
//            {
//                "size": "L",
//                "productOfferID": "38143",
//                "quantity": 1
//            }
//        ],
//        "recommendedProductIDs": [
//            "7195_219"
//        ],
//        "instagramPhotos": [],
//        "price": "2000.0000",
//        "preorder": "Предзаказ",
//        "tag": "Предзаказ",
//        "attributes": [
//            {
//                "Декоративный элемент": "нашивка"
//            },
//            {
//                "Рисунок": " надпись"
//            },
//            {
//                "Сезон": "круглогодичный"
//            },
//            {
//                "Состав": "95% хлопок; 5% эластан"
//            },
//            {
//                "Страна производителя": "Россия"
//            },
//            {
//                "Уход за вещами": "бережная стирка при 30 градусах"
//            }
//        ]
//    },
//    "7210_219": {
//        "name": "Платье COLOR BSW",
//        "englishName": "Платье COLOR BSW",
//        "sortOrder": "0",
//        "article": "LA1820-027",
//        "collection": null,
//        "description": "Ориентировочная дата поступления на склад - 25.05.2020 г.",
//        "colorName": "Черный",
//        "colorImageURL": "image/catalog/style/color/black_000000.jpg",
//        "mainImage": "image/cache/catalog/p/7210/9t0a7357-h_1_630x840.jpg",
//        "productImages": [
//            {
//                "imageURL": "image/cache/catalog/p/7210/9t0a7361-h_1_630x840.jpg",
//                "sortOrder": "14"
//            },
//            {
//                "imageURL": "image/cache/catalog/p/7210/9t0a7363-h_1_630x840.jpg",
//                "sortOrder": "15"
//            },
//            {
//                "imageURL": "image/cache/catalog/p/7210/9t0a7364-h_1_630x840.jpg",
//                "sortOrder": "16"
//            }
//        ],
//        "offers": [
//            {
//                "size": "XS",
//                "productOfferID": "38139",
//                "quantity": 1
//            },
//            {
//                "size": "S",
//                "productOfferID": "38140",
//                "quantity": 1
//            },
//            {
//                "size": "M",
//                "productOfferID": "38141",
//                "quantity": 1
//            },
//            {
//                "size": "L",
//                "productOfferID": "38142",
//                "quantity": 1
//            }
//        ],
//        "recommendedProductIDs": [
//            "7195_219"
//        ],
//        "instagramPhotos": [],
//        "price": "2000.0000",
//        "preorder": "Предзаказ",
//        "tag": "Предзаказ",
//        "attributes": [
//            {
//                "Декоративный элемент": "нашивка"
//            },
//            {
//                "Рисунок": " надпись"
//            },
//            {
//                "Сезон": "круглогодичный"
//            },
//            {
//                "Состав": "95% хлопок; 5% эластан"
//            },
//            {
//                "Страна производителя": "Россия"
//            },
//            {
//                "Уход за вещами": "бережная стирка при 30 градусах"
//            }
//        ]
//    }
//}
