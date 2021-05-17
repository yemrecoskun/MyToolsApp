//
//  TicTacToeViewController.swift
//  MyToolsApp
//
//  Created by Yunus Emre Coşkun on 15.05.2021.
//

import UIKit

class TicTacToeViewController: UIViewController {
    
    @IBOutlet var button0: UIButton!
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    @IBOutlet var button5: UIButton!
    @IBOutlet var button6: UIButton!
    @IBOutlet var button7: UIButton!
    @IBOutlet var button8: UIButton!
    @IBOutlet var xplayerLabel: UILabel!
    @IBOutlet var oplayerLabel: UILabel!
    var ticTacToeViewModel: TicTacToeViewModel = TicTacToeViewModel.init()
    var themeModelType = UserDefaults.standard.integer(forKey: "themeModelType")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        xplayerLabel.text = "X Player:"+String(self.ticTacToeViewModel.tictactoeModal.xplayer)
        oplayerLabel.text = "O Player:"+String(self.ticTacToeViewModel.tictactoeModal.oplayer)
        
        TDViewModel.changeTheme(themeModelType: themeModelType, view: view)
        TDViewModel.borderSolid(buttons: [button0,button1,button2,button3,button4,button5,button6,button7,button8], cornerRadius: 5, borderWidth: 1, borderColor: UIColor.orange)
    }
    @IBAction func button0Click(_ sender: Any) {
        if self.ticTacToeViewModel.tictactoeModal.tictactoe[0]=="n"{
            button0.setTitle(self.ticTacToeViewModel.tictactoeModal.player, for: .normal)
            ticTacToeClick(index: 0)
        }
    }
    @IBAction func button1Click(_ sender: Any) {
        if self.ticTacToeViewModel.tictactoeModal.tictactoe[1]=="n"{
            button1.setTitle(self.ticTacToeViewModel.tictactoeModal.player, for: .normal)
            ticTacToeClick(index: 1)
        }
    }
    @IBAction func button2Click(_ sender: Any) {
        if self.ticTacToeViewModel.tictactoeModal.tictactoe[2]=="n"{
            button2.setTitle(self.ticTacToeViewModel.tictactoeModal.player, for: .normal)
            ticTacToeClick(index: 2)
        }
    }
    @IBAction func button3Click(_ sender: Any) {
        if self.ticTacToeViewModel.tictactoeModal.tictactoe[3]=="n"{
            button3.setTitle(self.ticTacToeViewModel.tictactoeModal.player, for: .normal)
            ticTacToeClick(index: 3)
        }
    }
    @IBAction func button4Click(_ sender: Any) {
        if self.ticTacToeViewModel.tictactoeModal.tictactoe[4]=="n"{
            button4.setTitle(self.ticTacToeViewModel.tictactoeModal.player, for: .normal)
            ticTacToeClick(index: 4)
        }
    }
    @IBAction func button5Click(_ sender: Any) {
        if self.ticTacToeViewModel.tictactoeModal.tictactoe[5]=="n"{
            button5.setTitle(self.ticTacToeViewModel.tictactoeModal.player, for: .normal)
            ticTacToeClick(index: 5)
        }
    }
    @IBAction func button6Click(_ sender: Any) {
        if self.ticTacToeViewModel.tictactoeModal.tictactoe[6]=="n"{
            button6.setTitle(self.ticTacToeViewModel.tictactoeModal.player, for: .normal)
            ticTacToeClick(index: 6)
        }
    }
    @IBAction func button7Click(_ sender: Any) {
        if self.ticTacToeViewModel.tictactoeModal.tictactoe[7]=="n"{
            button7.setTitle(self.ticTacToeViewModel.tictactoeModal.player, for: .normal)
            ticTacToeClick(index: 7)
        }
    }
    @IBAction func button8Click(_ sender: Any) {
        if self.ticTacToeViewModel.tictactoeModal.tictactoe[8]=="n"{
            button8.setTitle(self.ticTacToeViewModel.tictactoeModal.player, for: .normal)
            ticTacToeClick(index: 8)
        }
    }
    func ticTacToeClick(index: Int){
        let result = self.ticTacToeViewModel.ticTacToeClick(index: index)
        if result != "not"{
            gameAlert(message: result)
        }
    }
    func gameAlert(message: String){
        var actions : [UIAlertAction] = []
        actions.append(UIAlertAction(title: "New Game", style: UIAlertAction.Style.default, handler:{UIAlertAction in
            self.WinPlayer()
            self.newGame()
        }))
        actions.append(UIAlertAction(title: "No", style: UIAlertAction.Style.cancel, handler: {UIAlertAction in
            self.WinPlayer()}))
        let alert = TDViewModel.AlertView(title: "GameOver", message: message, actions: actions)
        self.present(alert, animated: true)
    }
    func newGame(){
        self.ticTacToeViewModel.tictactoeModal.tictactoe =
                         ["n","n","n",
                          "n","n","n",
                          "n","n","n"]
        self.button0.setTitle("", for: .normal)
        self.button1.setTitle("", for: .normal)
        self.button2.setTitle("", for: .normal)
        self.button3.setTitle("", for: .normal)
        self.button4.setTitle("", for: .normal)
        self.button5.setTitle("", for: .normal)
        self.button6.setTitle("", for: .normal)
        self.button7.setTitle("", for: .normal)
        self.button8.setTitle("", for: .normal)
        self.ticTacToeViewModel.tictactoeModal.player = "X"
    }
    @IBAction func newGameButtonClick(_ sender: Any) {
        newGame()
    }
    @IBAction func clearCacheButton(_ sender: Any) {
        self.ticTacToeViewModel.tictactoeModal.xplayer=0
        self.ticTacToeViewModel.tictactoeModal.oplayer=0
        UserDefaults.standard.set(self.ticTacToeViewModel.tictactoeModal.xplayer, forKey: "xplayer")
        UserDefaults.standard.set(self.ticTacToeViewModel.tictactoeModal.oplayer, forKey: "oplayer")
        xplayerLabel.text = "X Player:"+String(self.ticTacToeViewModel.tictactoeModal.xplayer)
        oplayerLabel.text = "O Player:"+String(self.ticTacToeViewModel.tictactoeModal.oplayer)
        newGame()
    }
    func WinPlayer(){
        if self.ticTacToeViewModel.tictactoeModal.player == "O"{
            self.ticTacToeViewModel.tictactoeModal.xplayer+=1
            UserDefaults.standard.set(self.ticTacToeViewModel.tictactoeModal.xplayer, forKey: "xplayer")
            xplayerLabel.text = "X Player:"+String(self.ticTacToeViewModel.tictactoeModal.xplayer)
        }
        else if self.ticTacToeViewModel.tictactoeModal.player == "X"{
            self.ticTacToeViewModel.tictactoeModal.oplayer+=1
            UserDefaults.standard.set(self.ticTacToeViewModel.tictactoeModal.oplayer, forKey: "oplayer")
            oplayerLabel.text = "O Player:"+String(self.ticTacToeViewModel.tictactoeModal.oplayer)
        }
    }
}
