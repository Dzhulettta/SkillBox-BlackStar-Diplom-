
import Foundation

//MARK: - Links

let blackStarURL = "https://blackstarshop.ru/index.php?route=api/v1/categories"

let categoriesBlackStarURL = "https://blackstarwear.ru/"
//let collectionsManBlackStarURL = "https://blackstarshop.ru/catalog/muzhkaya-odezhda/"

//MARK: - Описание ошибок

enum ErrorTypeLoad: String {
    case ok = "Ok"
    case errorData = "Не возможно обработать данные"
}
