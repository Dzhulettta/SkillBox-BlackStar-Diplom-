
import UIKit
import CoreData

protocol AlertControllerDelegate {
    func loaded(answerId: Int)
}
protocol ControllerReload {
    func reloadCount()
}

class BasketViewController: UIViewController {
    var copyBasketCoreData = BasketCoreData()
    
    var product: Collections!
    
    @IBOutlet weak var tableBasket: UITableView!
    @IBOutlet weak var checkOutButton: UIButton!
    @IBOutlet weak var offers: UIButton!
    @IBOutlet weak var priceAll: UILabel!
    
    @IBOutlet weak var closeBasket: UIButton!
    @IBAction func closeBasket(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = false
        
        tableBasket.delegate = self
        tableBasket.dataSource = self
        
        tableBasket.tableFooterView = UIView() //у таблицы убирает незаполненные ячейки в таблице
        checkOutButton.layer.cornerRadius = 24
        
        reload()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        reload ()
    }
    
    func countPrise(){
        if copyBasketCoreData.basketCoreData.count != 0{
            var allPrice = 0
            var countProduct = 0
            for item in (0 ...  (copyBasketCoreData.basketCoreData.count - 1))
            {
                let priceA = (copyBasketCoreData.basketCoreData[item].value(forKey: "price") as! NSString).integerValue
                let countA = (copyBasketCoreData.basketCoreData[item].value(forKey: "count") as! NSString).integerValue
                
                allPrice += priceA * countA
                countProduct += countA
            }
            priceAll.text = "\(allPrice)₽"
            self.tabBarController?.tabBar.items?[1].badgeValue = String(countProduct)
            offers.isEnabled = true
            offers.backgroundColor = .systemBlue
            
        } else {
            priceAll.text = "0₽"
            offers.isEnabled = false
            offers.backgroundColor = .systemGray
        }
    }
    
    func makeAlertControllet(id: Int){ // создание алерт контроллера
        let alertController = UIAlertController(title: "Удалить товары из корзины?", message: "", preferredStyle: .alert) // создание алерт контроллера
        // создание кнопни1
        let alertAction1 = UIAlertAction(title: "ДА", style: .default) { (alert) in
            
            self.copyBasketCoreData.deleteData(index: id) // удаляет выбранную ячейку
            self.reload () // загружает новые данные и обновляет таблицу
            
        }
        // создание кнопки2
        let alertAction2 = UIAlertAction(title: "НЕТ", style: .cancel) { (alert) in
        }
        // добавление кнопок в алерт контроллер
        alertController.addAction(alertAction1)
        alertController.addAction(alertAction2)
        
        present(alertController, animated: true, completion:  nil) // вызов алерт контроллера
    }
    func reload () {
        self.copyBasketCoreData.appToCoreDate() // загружает новые данные
        self.tableBasket.reloadData() //проверка наличия товара в корзине
        
        countPrise()
        
        BasketCoreData.shared.appToCoreDate()
        if BasketCoreData.shared.basketCoreData.count != 0{
            var countProduct = 0
            for item in BasketCoreData.shared.basketCoreData{
                let productCount = Int(item.value(forKey: "count") as! String)!
                countProduct += productCount
            }
            
            self.tabBarController?.tabBar.items?[1].badgeValue = String(countProduct)
        }
    }
}

//MARK: - Создание таблицы

extension BasketViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = copyBasketCoreData.basketCoreData.count
        
        return count ?? 0
    }
    
    //MARK: - Заполнение ячейки
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let productCD =  copyBasketCoreData.basketCoreData[indexPath.row]
        
        let cell = tableBasket.dequeueReusableCell(withIdentifier: "myCellBasket", for: indexPath) as! BasketViewControllerViewCell
        cell.initCellCD(item: productCD)
        cell.idCell = indexPath.row
        cell.delegate = self
        cell.delegateC = self
        cell.selectionStyle = .none
        
        return cell
    }
}
extension BasketViewController: AlertControllerDelegate {
    func loaded(answerId: Int) {
        makeAlertControllet(id: answerId) //получаем Id и вызываем алерт и передаем через него номер ячейки, которую нужно удалить
        self.tableBasket.reloadData()
    }
}
extension BasketViewController: ControllerReload {
    func reloadCount(){
        reload()
    }
}

