//
//  CoreDataModel.swift
//  asd
//
//  Created by 马演喆 on 2019/2/28.
//  Copyright © 2019年 马演喆. All rights reserved.
//

import UIKit
import CoreData

class  CoreDataModel {
    
    private let context = CoreDataStorage.sharedInstance.mainQueueContext
    
    private func saveContext() {
        CoreDataStorage.sharedInstance.saveContext(context)
    }
    
    func getNumbers() -> [Int] {
        var nums = [Int]()
        
        do {
            let request = NSFetchRequest<Data>(entityName: "Data")
            let data = try context.fetch(request)
            nums = data.map { Int($0.num)}
        } catch {
            print("can't get numbers")
        }
        
        return nums
    }
    
    func addNew(number: Int) {
        let entity = NSEntityDescription.entity(forEntityName: "Data", in: context)
        let newData = Data(entity: entity!, insertInto: context)
        newData.num = Int32(number)
        saveContext()
    }
}
