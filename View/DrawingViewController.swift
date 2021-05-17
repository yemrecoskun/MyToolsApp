//
//  DrawingViewController.swift
//  MyToolsApp
//
//  Created by Yunus Emre Coşkun on 16.05.2021.
//

import UIKit

class DrawingViewController: UIViewController {
    /*@IBOutlet var collectionView: UICollectionView!
     
     
    var items: [UIColor] = [.red,.blue,.black,.darkGray,.brown,.clear,.cyan,.green,.lightGray,.orange,.purple,.white,.yellow]*/
    let items = ["red","blue","white","black","yellow"]
    let itemsColor = [UIColor.red,UIColor.blue,UIColor.white,UIColor.black,UIColor.yellow]
    var pickerView = UIPickerView()
    @IBOutlet var textField: UITextField!
    @IBOutlet var canvasView: CanvasView!
    var themeModelType = UserDefaults.standard.integer(forKey: "themeModelType")
    override func viewDidLoad() {
        super.viewDidLoad()
        /*collectionView.delegate = self
        collectionView.dataSource = self*/
        if themeModelType == 1{
            TDViewModel.changeTheme(themeModelType: self.themeModelType, view: view)
            textField.backgroundColor = .black
            canvasView.backgroundColor = .black
            
        }
        textField.layer.cornerRadius = 1
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.orange.cgColor
        pickerView.delegate = self
        pickerView.dataSource = self
        textField.inputView = pickerView
        textField.textAlignment = .center
        textField.placeholder = "Select Color"
    }

    @IBAction func onClickClear(_ sender: Any) {
        canvasView.clearCanvasView()
    }
    @IBAction func onClickUndo(_ sender: Any) {
        canvasView.undo()
    }
    @IBAction func onClickWidth(_ sender: UISlider) {
        canvasView.strokeWidth = CGFloat(sender.value*2)
    }
}

extension DrawingViewController: UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.items.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.items[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = items[row]
        canvasView.strokeColor = itemsColor[row]
        textField.resignFirstResponder()
    }
}
/*
extension DrawingViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        if let view = cell.viewWithTag(111) as? UIView{
            view.backgroundColor = items[indexPath.row]
            view.layer.cornerRadius = 3
        }
        return cell
    }
    
}
*/
