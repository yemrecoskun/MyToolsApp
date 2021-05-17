//
//  Entity.swift
//  MyToolsApp
//
//  Created by Yunus Emre Coşkun on 14.05.2021.
//

import Foundation
import UIKit
import CoreData

class Entity{
    //CRUD
    
    static func Create(entityName: String!, setValues: Dictionary<String,Any>) -> String{
        let appDelegate = UIApplication
                .shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: managedContext)!
        let examp = NSManagedObject(entity: entity, insertInto: managedContext)
        for (key,value) in setValues {
            examp.setValue(value, forKey: key)
        }
        do{
            try managedContext.save()
            return "save"
        }catch{
            return "error"
        }
    }
    
    static func Read(entityName: String, setValues: Dictionary<String,Any>?)-> [NSManagedObject]{
        let appDelegate = UIApplication
                .shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        var result = [NSManagedObject]()
        if !(setValues == nil){
            for(key,value) in setValues!{
                if case Optional<Any>.none = value{
                    let formatKey = key + " = %@"
                    fetchRequest.predicate = NSPredicate(format: formatKey, value as! CVarArg)
                }
            }
        }
        do{
            result = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
        } catch{
            print(error)
        }
        return result
    }
    
    static func Update(entityName: String, setValues: Dictionary<String,Any>!) -> String{
        let appDelegate = UIApplication
                    .shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: entityName)
        let id = setValues["id"] as! UUID
        fetchRequest.predicate = NSPredicate(format: "id = %@", id as CVarArg)
            /*for(key,value) in setValues!{
                if case Optional<Any>.none = value{
                    let formatKey = key + " = %@"
                    fetchRequest.predicate = NSPredicate(format: formatKey, value as! CVarArg)
                }
            }*/
        do{
            let test = try managedContext.fetch(fetchRequest)
            let objectUpdate = test[0] as! NSManagedObject
            for(key,value) in setValues!{
                if value != nil{
                    if key != "id"{
                        objectUpdate.setValue(value, forKey: key)
                    }
                }
            }
            do{
                try managedContext.save()
                return "save"
            }
            catch{
                return "error"
            }
        }
        catch{
            return "error"
        }
    }
    static func Delete(entityName: String,id: UUID) -> String{
        let appDelegate = UIApplication
                    .shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        fetchRequest.predicate = NSPredicate(format:"id = %@", id as CVarArg)
        do{
            let test = try managedContext.fetch(fetchRequest)
            let objectToDelete = test[0] as! NSManagedObject
            managedContext.delete(objectToDelete)
            do{
                try managedContext.save()
                return "save"
            }
            catch{
                return "error"
            }
        }
        catch{
            return "error"
        }
    }
    
}
