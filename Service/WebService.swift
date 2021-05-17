//
//  WebService.swift
//  MyToolsApp
//
//  Created by Yunus Emre Coşkun on 13.05.2021.
//

import Foundation

class WebService{
    func GetTheNews(url: URL,completion: @escaping (TheNews?) -> ()){
        URLSession.shared.dataTask(with: url) { ( data, response, error) in
            if let error = error {
                completion(nil)
            }
            else if let data = data{
                let theNews = try? JSONDecoder().decode(TheNews.self, from: data)
                if let theNews = theNews{
                    completion(theNews)
                }
            }
        }.resume()
}
}
