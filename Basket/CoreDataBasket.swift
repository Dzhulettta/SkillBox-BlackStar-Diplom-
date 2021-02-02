////
////  CoreDataBasket.swift
////  Diplom(BlackStar)
////
////  Created by Юлия Чужинова on 27.10.2020.
////  Copyright © 2020 Юлия Чужинова. All rights reserved.
////
//import UIKit
//import Foundation
//import CoreData
//
//var coreDataBasket: [NSManagedObject] = []
//
//
//// вызов базы
//func appToCoreDate (color: String, image: String, name: String, price: String, size: String) {
//guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
//let context = appDelegate.persistentContainer.viewContext
//let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ToDoEntity")
//do {
//    coreDataBasket = try! context.fetch(fetchRequest) as? [NSManagedObject] ?? [NSManagedObject]()
//}
//}
//
////MARK: - сохранение изменений в базе
//
//func changeToCoreDate (color: String, image: String, name: String, price: String, size: String) {
//    
//    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
//    let context = appDelegate.persistentContainer.viewContext
//    
//    guard let entity = NSEntityDescription.entity(forEntityName: "CoreDataList", in: context) else { return }
//    
//    do {
//        try! context.save()
//    }
//    catch let error as NSError {
//        print("Error: \(error)")
//    }
//}
//
////MARK: - добавление новых ячеек в базе
//
//func addToCoreDate (color: String, image: String, name: String, price: String, size: String) {
//    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
//    
//    let context = appDelegate.persistentContainer.viewContext
//    
//    guard let entity = NSEntityDescription.entity(forEntityName: "CoreDataList", in: context) else { return }
//    
//    let productToAdd = NSManagedObject.init(entity: entity, insertInto: context)
//    productToAdd.setValue(color, forKey: "color")
//    productToAdd.setValue(image, forKey: "image")
//    productToAdd.setValue(name, forKey: "name")
//    productToAdd.setValue(price, forKey: "price")
//    productToAdd.setValue(size, forKey: "size")
//    
//    do {
//        try! context.save()
//        coreDataBasket.append(productToAdd)
//        
//    }
//    catch let error as NSError {
//        print("Error: \(error)")
//    }
//}
//
////MARK: - удаление ячейки в базе
//   
//   func deleteData(index: Int) {
//       guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
//       let context = appDelegate.persistentContainer.viewContext
//       let coreDataBasketDel = coreDataBasket[index]
//       
//       do {
//           try! context.delete(coreDataBasketDel)
//       }
//   }
//
// //MARK: - добавление новой ячейки в таблицу (cоздание флерт контроллера для всплывающего окна)
//
//func saveData(color: String, image: String, name: String, price: String, size: String) {
//
//    let color = color
//    let image = image
//    let name = name
//    let price = price
//    let size = size
//    
//    addToCoreDate(color: color, image: image, name: name, price: price, size: size)
//       
//
//}
