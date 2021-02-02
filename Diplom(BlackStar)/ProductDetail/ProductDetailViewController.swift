
import UIKit

class ProductDetailViewController: UIViewController {
    
    var copyBasketCoreData = BasketCoreData()
    
    @IBOutlet weak var collectionProductDetail: UICollectionView!
    
    @IBOutlet weak var bacgroundForSizeTable: UIView!
    
    var product: Collections!
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var pageCollections: UIPageControl!
    
    @IBOutlet weak var tableSize: UITableView!
    @IBAction func addBasket(_ sender: Any) {
        
        if product.offers.count != 1 {
            tableSize.isHidden = false
            self.view.bringSubviewToFront(bacgroundForSizeTable)
            self.view.bringSubviewToFront(tableSize)
            bacgroundForSizeTable.isHidden = false
            self.tabBarController?.tabBar.isHidden = false
            tableSize.reloadData()
            
        } else{
            let size = product.offers[0].size
            Size.shared.userSize = size
            
            copyBasketCoreData.addToCoreDate (color: product.colorName ?? "", image: product.mainImage, name: product.name, price: product.price, size: size, count: "1")
        }
        
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
    @IBOutlet weak var addBasket: UIButton!
    @IBOutlet weak var descriptionDetailProductLabel: UILabel!
    @IBOutlet weak var basketOutlet: UIBarButtonItem!
    @IBOutlet weak var scrollViewProduct: UIScrollView!
    
    private var currentImageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        basketOutlet.isEnabled = false
        tableSize.isHidden = true
        
        collectionProductDetail.dataSource = self
        collectionProductDetail.delegate = self
        scrollViewProduct.delegate = self
        
        self.view.addSubview(collectionProductDetail)
        
        tableSize.delegate = self
        tableSize.dataSource = self
        
        // MARK: - у таблицы убирает незаполненные ячейки в таблице
        
        tableSize.tableFooterView = UIView()
        
        productNameLabel.text = product.name
        
        let priceInt = (product.price as NSString).integerValue
        priceLabel.text = "\(priceInt)₽"
        descriptionDetailProductLabel.text = product.description
        
        addBasket.layer.cornerRadius = 10 // закругляет кроя у кнопки
        
        //MARK: - Настройка навигатора
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.barTintColor = UIColor.clear
        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
        
        //MARK: - Настройка page
        pageCollections.numberOfPages = product.productImages.count
        self.view.bringSubviewToFront(pageCollections)
        
        //MARK: - Регистрация ячейки
        collectionProductDetail.register(UINib(nibName: "ProductDetailCollectionViewCell", bundle: nil) , forCellWithReuseIdentifier: "productCell")
        
        bacgroundForSizeTable.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    //MARK: - Передача данных в другой контроллер (BasketViewController)
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showBasket", let dvc = segue.destination as? BasketViewController, let product = sender as? Collections {
            dvc.product = product
        }
    }
}
// MARK: - UIScrollViewDelegate

extension ProductDetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if tableSize.isHidden == true{
            let velocityY = scrollView.panGestureRecognizer.velocity(in: scrollView).y
            if velocityY < 0 {
                self.tabBarController?.tabBar.isHidden = true
                self.tabBarController?.tabBarController?.isEditing = true
            } else if velocityY > 0 {
                self.tabBarController?.tabBar.isHidden = false
            }
        }
    }
}
//MARK: - Создание коллекции

extension ProductDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return product.productImages.count 
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        currentImageIndex = Int(collectionView.contentOffset.x / collectionProductDetail.bounds.width)
        pageCollections.currentPage = currentImageIndex
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //MARK: - Заполнение ячейки
        
        let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! ProductDetailCollectionViewCell
        
        itemCell.initCell(item: product.productImages[indexPath.row].imageURL)
        itemCell.bounds.size = collectionProductDetail.bounds.size
        return itemCell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let frameCell = collectionView.frame
        let widthCell = frameCell.width
        let hightCell = CGFloat(340)
        return CGSize(width: widthCell, height: hightCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0,left: 0,bottom: 0, right: 0)
    }
}
//MARK: - Создание таблицы

extension ProductDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return product.offers.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //MARK: - Заполнение ячейки
        
        let itemCell = tableView.dequeueReusableCell(withIdentifier: "cellSize", for: indexPath) as! SizeTableViewCell
        
        itemCell.initCell(item: product.offers[indexPath.row].size)
        return itemCell
        
    }
    
    //MARK: - Нажатие на ячейку
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)  // анимация при нажатии на кнопку
        
        let itemCell = tableView.dequeueReusableCell(withIdentifier: "cellSize", for: indexPath) as! SizeTableViewCell
        itemCell.done.isHidden = false
        let size = product.offers[indexPath.row].size
        
        Size.shared.userSize = size
        
        copyBasketCoreData.addToCoreDate (color: product.colorName ?? "", image: product.mainImage, name: product.name, price: product.price, size: size, count: "1")
        
        tableSize.isHidden = true
        bacgroundForSizeTable.isHidden = true
        
        BasketCoreData.shared.appToCoreDate()
        if BasketCoreData.shared.basketCoreData.count != 0{
            var countProduct = 0
            for item in BasketCoreData.shared.basketCoreData{
                let productCount = Int(item.value(forKey: "count") as! String)!
                countProduct += productCount
            }
            self.tabBarController?.tabBar.items?[1].badgeValue = String(countProduct)
        }
        
        //MARK: -  переход в корзину и передача продукта
        performSegue(withIdentifier: "showBasket", sender: product)
    }
}
