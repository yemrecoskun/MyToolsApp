//
//  TheNews.swift
//  MyToolsApp
//
//  Created by Yunus Emre Coşkun on 13.05.2021.
//

import Foundation

/*struct TheNewss : Decodable{
    let title: String
    let story: String
}*/

struct TheNews : Decodable{
    let articles: [Article]
}
struct Article: Decodable{
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let content: String?
}

