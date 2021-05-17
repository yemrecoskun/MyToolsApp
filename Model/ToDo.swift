//
//  ToDo.swift
//  MyToolsApp
//
//  Created by Yunus Emre Coşkun on 13.05.2021.
//

import Foundation

class ToDo{
    var id : UUID?
    var todo : String?
    var available : Bool?
    var dictionary: [String: Any]{
        return ["id":self.id,"todo":self.todo,"available":self.available]
    }
    init(id : UUID?, todo: String?, available: Bool?) {
        self.id  = id
        self.todo = todo
        self.available = available
    }
}
