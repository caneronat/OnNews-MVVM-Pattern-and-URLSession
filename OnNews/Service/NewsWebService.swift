//
//  NewsWebService.swift
//  OnNews
//
//  Created by Caner Onat on 1.09.2020.
//

import Foundation

class NewsWebService{
    
    func downloadNews(url:URL , completion: @escaping (NewsFeed?) -> ()){
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let  data = data {
                
                let newList = try? JSONDecoder().decode(NewsFeed.self, from: data)
                if let newList = newList {
                    completion(newList)
                }
           
            }
        }.resume()
    }
}
