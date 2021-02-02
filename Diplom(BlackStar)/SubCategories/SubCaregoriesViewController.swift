////
////  SubCaregoriesViewController.swift
////  Diplom(BlackStar)
////
////  Created by Юлия Чужинова on 20.10.2020.
////  Copyright © 2020 Юлия Чужинова. All rights reserved.
////
//
//import UIKit
//
//class SubCaregoriesViewController: UIViewController {
//    
//    @IBOutlet weak var subCategoriesTableView: UITableView!
//    
//    var subCategories: [SubCategory] = []
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // MARK: - у таблицы убирает незаполненные ячейки в таблице
//        
//        subCategoriesTableView.tableFooterView = UIView()
//        
//        //MARK: - Настройка навигатора
//        
//        subCategoriesTableView.dataSource = self
//        subCategoriesTableView.delegate = self
//        
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.isTranslucent = true
//        self.navigationController?.navigationBar.barTintColor = UIColor.clear
//        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
//
//          }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        
//        subCategoriesTableView.reloadData()
//    }
//}
//
////MARK: - Создание таблицы
//
//extension SubCaregoriesViewController: UITableViewDataSource, UITableViewDelegate {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return subCategories.count
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 80
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        //MARK: - Заполнение ячейки
//        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "myCellS", for: indexPath) as! SubCategoriesTableViewCell
//        
//        cell.initCellSub(item: subCategories[indexPath.row])
//        return cell
//    }
//    
//    //MARK: - Нажатие на ячейку
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        
//        //MARK: -  переход на перечень товаров(коллекция) и передача id
//        
//        performSegue(withIdentifier: "showProduct", sender: subCategories[indexPath.row].id)
//        
//        
//    }
//    //MARK: - Передача данных в другой контроллер (SubCaregoriesViewController)(CollectionsViewController)
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showProduct", let dvc = segue.destination as? CollectionsViewController, let id = sender as? String {
//            
//            dvc.id = "\(id)"
//        }
//    }
//}
