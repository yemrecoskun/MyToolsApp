//
//  ToDoViewModel.swift
//  MyToolsApp
//
//  Created by Yunus Emre Coşkun on 13.05.2021.
//

import Foundation
import UIKit
import CoreData

struct ToDoViewModel{
    var toDoList : [ToDo] = []
    var entityName = "ETodo"
    func numberOfRowsInSection() -> Int {
        return self.toDoList.count
    }
    func newsAtIndexPath(_ index: Int)-> ToDoModel {
        let toDo = self.toDoList[index]
        return ToDoModel(toDo: toDo)
    }
    init(){
        Read(toDo: nil)
    }
    
}
extension ToDoViewModel{
    mutating func Create(newTodo: ToDo) ->String{
        let result = Entity.Create(entityName: self.entityName, setValues: newTodo.dictionary)
        if result == "save" {
            self.toDoList.append(newTodo)
            return "save"
        }
        else{
            return "error"
        }
    }
    mutating func Read(toDo: ToDo?){
        let result = Entity.Read(entityName: self.entityName, setValues: toDo==nil ? nil : toDo?.dictionary)
        for data in result {
            let todo = ToDo(id: data.value(forKey: "id") as? UUID, todo: data.value(forKey: "todo") as? String, available: data.value(forKey: "available") as? Bool)
            self.toDoList.append(todo)
        }
    }
    mutating func Update(index: Int)-> String{
        toDoList[index].available = !toDoList[index].available!
        let result = Entity.Update(entityName: self.entityName, setValues: toDoList[index].dictionary)
        if result == "save"{
            return "save"
        }
        else{
            toDoList[index].available = !toDoList[index].available!
            return "error"
        }
    }
    mutating func Delete(index: Int) -> String{
        let result = Entity.Delete(entityName: self.entityName, id: self.toDoList[index].id!)
        if result == "save"{
                self.toDoList.remove(at: index)
                return "save"
            }
        else{
                return "error"
        }
    }
}
struct ToDoModel{
    let toDo : ToDo
    var id : UUID?{
        return self.toDo.id
    }
    var todo : String?{
        return self.toDo.todo
    }
    var available : Bool?{
        return self.toDo.available
    }
}
