//
//  TicTacToeViewModel.swift
//  MyToolsApp
//
//  Created by Yunus Emre Coşkun on 16.05.2021.
//

import Foundation

class TicTacToeViewModel{
    var tictactoeModal : TicTacToe = TicTacToe.init()
    init(){
        self.tictactoeModal.tictactoe = ["n","n","n",
                                         "n","n","n",
                                         "n","n","n"]
        self.tictactoeModal.player = "X"
        if let xplayer = UserDefaults.standard.array(forKey: "xplayer"){
            if xplayer.isEmpty{
                self.tictactoeModal.xplayer = 0
                UserDefaults.standard.set(0, forKey: "xplayer")
            }
        }
        if let oplayer = UserDefaults.standard.array(forKey: "oplayer"){
            if oplayer.isEmpty{
                self.tictactoeModal.oplayer = 0
                UserDefaults.standard.set(0, forKey: "oplayer")
            }
        }
        
        self.tictactoeModal.xplayer = UserDefaults.standard.integer(forKey: "xplayer")
        self.tictactoeModal.oplayer = UserDefaults.standard.integer(forKey: "oplayer")
    }
    func ticTacToeClick(index: Int) -> String{
        if self.tictactoeModal.player=="X"{
            self.tictactoeModal.tictactoe[index]="X"
            self.tictactoeModal.player="O"
        }
        else {
            self.tictactoeModal.tictactoe[index]="O"
            self.tictactoeModal.player="X"
        }
        return gameControl()
    }
    
    func gameControl() -> String{
        var result = "not"
        for index in 0...2{
            if self.tictactoeModal.tictactoe[index+0]=="X" && self.tictactoeModal.tictactoe[index+3]=="X" && self.tictactoeModal.tictactoe[index+6]=="X"
            {
                result = "X Win"
            }
            else if self.tictactoeModal.tictactoe[index+0]=="O" && self.tictactoeModal.tictactoe[index+3]=="O" && self.tictactoeModal.tictactoe[index+6]=="O"{
                result = "O Win"
            }
            else if self.tictactoeModal.tictactoe[index*3+0]=="X" && self.tictactoeModal.tictactoe[index*3+1]=="X" && self.tictactoeModal.tictactoe[index*3+2]=="X"{
                result = "X Win"
            }
            else if self.tictactoeModal.tictactoe[index*3+0]=="O" && self.tictactoeModal.tictactoe[index*3+1]=="O" && self.tictactoeModal.tictactoe[index*3+2]=="O"{
                result = "O Win"
            }
        }
        if self.tictactoeModal.tictactoe[0]=="X" && self.tictactoeModal.tictactoe[4]=="X" && self.tictactoeModal.tictactoe[8]=="X"{
            result = "X Win"
        }
        if self.tictactoeModal.tictactoe[0]=="O" && self.tictactoeModal.tictactoe[4]=="O" && self.tictactoeModal.tictactoe[8]=="O"{
            result = "O Win"
        }
        if self.tictactoeModal.tictactoe[2]=="X" && self.tictactoeModal.tictactoe[4]=="X" && self.tictactoeModal.tictactoe[6]=="X"{
            result = "X Win"
        }
        if self.tictactoeModal.tictactoe[2]=="O" && self.tictactoeModal.tictactoe[4]=="O" && self.tictactoeModal.tictactoe[6]=="O"{
            result = "O Win"
        }
        if  self.tictactoeModal.tictactoe[0] != "n" && self.tictactoeModal.tictactoe[1] != "n" && self.tictactoeModal.tictactoe[2] != "n" && self.tictactoeModal.tictactoe[3] != "n" && self.tictactoeModal.tictactoe[4] != "n" && self.tictactoeModal.tictactoe[5] != "n" && self.tictactoeModal.tictactoe[6] != "n" && self.tictactoeModal.tictactoe[7] != "n" && self.tictactoeModal.tictactoe[8] != "n"{
            result = "No Win Player"
        }
        return result
    }
}
