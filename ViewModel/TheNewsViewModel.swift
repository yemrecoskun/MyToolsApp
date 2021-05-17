//
//  TheNewsViewModel.swift
//  MyToolsApp
//
//  Created by Yunus Emre Coşkun on 13.05.2021.
//

import Foundation
import UIKit

struct TheNewsViewModel {
    
    let theNews : TheNews
    func numberOfRowsInSection() -> Int {
        return self.theNews.articles.count
    }
    func newsAtIndexPath(_ index: Int)-> TheNewsModel {
        let article = self.theNews.articles[index]
        return TheNewsModel(article: article, theNews: self.theNews)
    }
}

struct TheNewsModel {
    let article : Article
    var theNews : TheNews
    var articles: [Article]?{
        return self.theNews.articles
    }
}

extension UIImageView{
    func load(urlString: String){
        guard let url = URL(string: urlString) else{
            return
        }
        DispatchQueue.global().async {[weak self] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
