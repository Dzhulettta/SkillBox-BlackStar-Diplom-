//
//  CoreData.swift
//  Diplom(BlackStar)
//
//  Created by Юлия Чужинова on 24.10.2020.
//  Copyright © 2020 Юлия Чужинова. All rights reserved.
//
//
import UIKit
import Foundation
import CoreData

class BasketCoreData {
    static let shared = BasketCoreData()
    var basketCoreData: [NSManagedObject] = []
    
    //MARK: - работа в базе
    func appToCoreDate () {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "BasketEntity")
        do {
            basketCoreData = try! context.fetch(fetchRequest) as? [NSManagedObject] ?? [NSManagedObject]()
        }
    }
    
    //MARK: - добавление новых ячеек в базе
    
    func addToCoreDate (color: String, image: String, name: String, price: String, size: String, count: String) {
        
        appToCoreDate ()
        
        if basketCoreData.count != 0{
            for item in basketCoreData {
                if let nameTemp = item.value(forKey: "name") as? String, nameTemp == name,
                   let sizeTemp = item.value(forKey: "size") as? String, sizeTemp == size,
                   let count = item.value(forKey: "count") as? String,
                   var countTemp = Int(count) {
                    countTemp += 1
                    
                    item.setValue("\(countTemp)", forKey: "count")
                    
                    changeToCoreDate(color: color, image: image, name: name, price: price, size: size, count: "\(countTemp)")
                    appToCoreDate ()
                    return
                }
            }
        }
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let context = appDelegate.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "BasketEntity", in: context) else { return }
        
        let productToAdd = NSManagedObject.init(entity: entity, insertInto: context)
        
        productToAdd.setValue(color, forKey: "color")
        productToAdd.setValue(image, forKey: "image")
        productToAdd.setValue(name, forKey: "name")
        productToAdd.setValue(price, forKey: "price")
        productToAdd.setValue(size, forKey: "size")
        productToAdd.setValue(count, forKey: "count")
        
        do {
            try! context.save()
            basketCoreData.append(productToAdd)
        }
        catch let error as NSError {
            print("Error: \(error)")
        }
    }
    
    //MARK: - сохранение изменений в базе
    
    func changeToCoreDate (color: String, image: String, name: String, price: String, size: String, count: String) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "BasketEntity", in: context) else { return }
        do {
            try! context.save()
        }
        catch let error as NSError {
            print("Error: \(error)")
        }
    }
    
    //MARK: - удаление ячейки в базе
    
    func deleteData(index: Int) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let coreDataBasketDel = basketCoreData[index]
        do {
            try! context.delete(coreDataBasketDel)
            try! context.save()
        }
    }
}
