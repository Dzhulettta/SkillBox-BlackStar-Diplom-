
import UIKit

class CollectionsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var collections: [Collections] = []
    var id = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        let loader = CollectionsLoader()
        
        let categoriesID = id
        loader.delegate = self
        loader.loadCollections(categoriesID: categoriesID)
        
        //MARK: - Настройка навигатора
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.barTintColor = UIColor.clear
        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    //MARK: - Передача данных в другой контроллер (ProductDetailViewController)
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showProductDetail", let dvc = segue.destination as? ProductDetailViewController, let product = sender as? Collections{
            dvc.product = product
        }
    }
}

//MARK: - Передача данных в коллекцию

extension CollectionsViewController: CollectionsLoaderDelegate{
    func loaded(collections: [Collections]) {
        
        self.collections = collections // заполнили коллекцию данными из json
        collectionView.reloadData() // обновляет коллекцию новым массивом
    }
}

//MARK: - Создание коллекции

extension CollectionsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //MARK: - Заполнение ячейки
        
        let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! MenuCollectionViewCell
        
        itemCell.initCell(item: collections[indexPath.row])
        
        return itemCell
    }
    
    //MARK: - Нажатие на ячейку
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        //MARK: -  переход на товар(скролл) и передача массива коллекций
        
        performSegue(withIdentifier: "showProductDetail", sender: collections[indexPath.row])
    }
}
