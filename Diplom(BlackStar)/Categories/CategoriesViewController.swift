
import UIKit
import SVProgressHUD
import CoreData

class CategoriesViewController: UIViewController {
    
    @IBOutlet weak var categoriesTableView: UITableView!
    var countTouch = 0
    
    var variantData = 1
    var categories: [Category] = []
    var subCategories: [SubCategory] = []
    var keysCategoriesAndCategories: [String: Category] = [:]
    
    @IBOutlet weak var backCatigoriesButtonOutlet: UIButton!
    @IBAction func backCatigoriesButton(_ sender: Any) {
        variantData = 1
        categoriesTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backCatigoriesButtonOutlet.tintColor = .systemBlue
        backCatigoriesButtonOutlet.isHidden = true
        
        // MARK: - у таблицы убирает незаполненные ячейки в таблице
        
        categoriesTableView.tableFooterView = UIView()
        
        // MARK: - SVProgressHUD ставит на центр экрана
        
        SVProgressHUD.setOffsetFromCenter(UIOffset(horizontal: CGFloat(UIScreen.main.bounds.width / 2), vertical: CGFloat(UIScreen.main.bounds.height / 2)))
        
        SVProgressHUD.show() // запускает ярлык загрузки
        
        categoriesTableView.dataSource = self
        categoriesTableView.delegate = self
        let loader = CategoriesLoader()
        loader.delegate = self
        loader.loadCategories()
        
        //MARK: - Настройка навигатора
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.barTintColor = UIColor.clear
        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
        
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        
        categoriesTableView.reloadData()
        
    }
    //MARK: - Передача данных в другой контроллер (CollectionsViewController)
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showProduct", let dvc = segue.destination as? CollectionsViewController, let id = sender as? String {
            dvc.id = "\(id)"
        }
    }
}
//MARK: - Передача данных в таблицу

extension CategoriesViewController: CategoriesLoaderDelegate{
    
    func loaded(categories: [Category]) {
        self.categories = categories
        categoriesTableView.reloadData() // обновляет таблицу новым массивом
    }
    func keysCategoriesAndCategoriesLoaded(keysCategoriesAndCategories: [String: Category]){
        self.keysCategoriesAndCategories = keysCategoriesAndCategories
    }
}

//MARK: - Создание таблицы

extension CategoriesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if variantData == 2 {
            return subCategories.count
        } else {
            return categories.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //MARK: - Заполнение ячейки
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CategoriesTableViewCell
        if variantData == 1 {
            cell.initCell(item: categories[indexPath.row])
            backCatigoriesButtonOutlet.isHidden = true
            return cell
        } else {
            cell.initCellSub(item: subCategories[indexPath.row])
            backCatigoriesButtonOutlet.isHidden = false
            return cell
        }
    }
    
    //MARK: - Нажатие на ячейку
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        countTouch += 1
        if variantData == 1 {
            subCategories = categories[indexPath.row].subCategories // создание массива с подкатегориями
            
            if subCategories.isEmpty == false{
                
                if subCategories[0].iconImage.isEmpty {
                    
                    for item in 0 ... subCategories.count - 1 {
                        if subCategories[item].iconImage.isEmpty { // выбирает подкатегории с отсутствием картинок и присваивает им типовую
                            subCategories[item].iconImage = "image/catalog/style/modile/sale_cat.png"
                        }
                    }
                    
                } else {
                    subCategories = categories[indexPath.row].subCategories // создание массива с подкатегориями
                }
                variantData = 2
                categoriesTableView.reloadData()
                countTouch = 0
                
            } else{
                var keysArray: [Any] = []
                for (key, _) in keysCategoriesAndCategories{
                    let key2 = key
                    keysArray.append(key2)
                }
                let myKey = keysArray[indexPath.row]
                performSegue(withIdentifier: "showProduct", sender: "\(myKey)" )
            }
        }  else {
            //MARK: -  переход на перечень товаров(коллекция) и передача id
            performSegue(withIdentifier: "showProduct", sender: subCategories[indexPath.row].id)
        }
    }
}

