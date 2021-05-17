//
//  ViewController.swift
//  MyToolsApp
//
//  Created by Yunus Emre Coşkun on 24.04.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var calculatorButton: UIButton!
    @IBOutlet weak var toDoButton: UIButton!
    @IBOutlet weak var theNewsButton: UIButton!
    @IBOutlet weak var themeSegmented: UISegmentedControl!
    @IBOutlet var tictactoeButton: UIButton!
    @IBOutlet var drawingButton: UIButton!
    var themeModelType = UserDefaults.standard.integer(forKey: "themeModelType")
    override func viewDidLoad() {
        if let themeModelType = UserDefaults.standard.array(forKey: "themeModelType"){
            if themeModelType.isEmpty{
                self.themeModelType = 0
                UserDefaults.standard.set(0, forKey: "themeModelType")
            }
        }
        TDViewModel.changeMainTheme(themeModelType: themeModelType, themeSegment: themeSegmented, view: view)
        TDViewModel.borderSolid(buttons: [calculatorButton,toDoButton,theNewsButton,tictactoeButton,drawingButton], cornerRadius: 5, borderWidth: 1, borderColor: UIColor.orange)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationController?.navigationBar.barTintColor = UIColor.orange
    }
    @IBAction func themeSegmentClick(_ sender: UISegmentedControl) {
        TDViewModel.changeMainTheme(themeModelType: sender.selectedSegmentIndex, themeSegment: themeSegmented, view: view)
        UserDefaults.standard.set(sender.selectedSegmentIndex, forKey: "themeModelType")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
