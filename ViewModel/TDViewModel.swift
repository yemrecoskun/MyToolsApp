//
//  TDViewModel.swift
//  MyToolsApp
//
//  Created by Yunus Emre Coşkun on 24.04.2021.
//

import Foundation
import UIKit

class TDViewModel : UIViewController {
    
    static func changeMainTheme(themeModelType : Int, themeSegment : UISegmentedControl, view : UIView){
        switch themeModelType {
        case 0:
        themeSegment.tintColor = .white
        view.backgroundColor = .white
        themeSegment.selectedSegmentIndex = themeModelType
            break
        case 1:
            themeSegment.tintColor = .black
            view.backgroundColor = .black
            themeSegment.selectedSegmentIndex = themeModelType
            break
        default:
            break
        }
    }
    static func changeTheme(themeModelType : Int, view : UIView){
        switch themeModelType {
        case 0:
        view.backgroundColor = .white
            break
        case 1:
            view.backgroundColor = .black
            break
        default:
            break
        }
    }
    static func borderSolid(buttons : [UIButton], cornerRadius: CGFloat, borderWidth: CGFloat, borderColor: UIColor){
        for button in buttons{
            button.layer.cornerRadius = cornerRadius
            button.layer.borderWidth = borderWidth
            button.layer.borderColor = borderColor.cgColor
        }
    }
    static func AlertView(title: String, message: String,actions: [UIAlertAction]) -> UIAlertController{
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        for action in actions{
            alert.addAction(action)
        }
        return alert
    }
    
}
