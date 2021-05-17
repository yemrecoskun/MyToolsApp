//
//  Drawing.swift
//  MyToolsApp
//
//  Created by Yunus Emre Coşkun on 16.05.2021.
//

import Foundation
import UIKit

struct Drawing{
    var color: UIColor?
    var width: CGFloat?
    var opacity: CGFloat?
    var points: [CGPoint]?
    
    init(color: UIColor, points: [CGPoint]){
        self.color = color
        self.points = points
    }
}
