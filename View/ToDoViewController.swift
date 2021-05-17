//
//  ToDoViewController.swift
//  MyToolsApp
//
//  Created by Yunus Emre Coşkun on 12.05.2021.
//

import UIKit
import CoreData

class ToDoViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var textValue: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var themeModelType = UserDefaults.standard.integer(forKey: "themeModelType")
    //var toDoTableViewModel : ToDoTableViewModel!
    var toDoViewModel : ToDoViewModel = ToDoViewModel.init()
    var toDoList : [ToDo]!
    override func viewDidLoad() {
        super.viewDidLoad()
        if themeModelType == 1{
            TDViewModel.changeTheme(themeModelType: self.themeModelType, view: view)
            textValue.backgroundColor = .black
            tableView.backgroundColor = .black
        }
        textValue.layer.cornerRadius = 5.0
        textValue.layer.masksToBounds = true
        textValue.layer.borderColor = UIColor.orange.cgColor
        textValue.layer.borderWidth = 1.0
        //toDoList = ReadData()
        //self.toDoViewModel.toDoList = ReadData()!
        tableView.delegate = self
        tableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoViewModel == nil ?  0: self.toDoViewModel.numberOfRowsInSection()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let toDo = toDoViewModel.newsAtIndexPath(indexPath.row)
        cell.textLabel?.textColor = .orange
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: toDo.todo!)
        if !(toDo.available!){
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
            cell.textLabel?.textColor = .red
        }
        cell.textLabel?.attributedText = attributeString
        if themeModelType == 1{
            cell.backgroundColor = .black
        }
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let result = toDoViewModel.Delete(index: indexPath.row)
            if result == "save"{
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
                self.tableView.reloadData()
            }
            else {
                //alert error
            }
        }
    }
    @IBAction func addButtonClick(_ sender: Any) {
        if textValue.text != ""{
            let toDo = ToDo(id: UUID(), todo: textValue.text!, available: true)
            let result = toDoViewModel.Create(newTodo: toDo)
            print(result)
            if result == "save"{
                self.tableView.reloadData()
            }
            else {
                //error alert
            }
            
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let result = toDoViewModel.Update(index: indexPath.row)
        if result=="save"{
            self.tableView.reloadData()
        }
        else {
            //error alert
        }
    }
}
