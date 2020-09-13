//
//  NewsViewModel.swift
//  OnNews
//
//  Created by Caner Onat on 1.09.2020.


import Foundation


struct NewsListViewModel {
    let newsModelList: [Article]
    
    func numberOfRowsInSection() -> Int {
         return self.newsModelList.count
     }
     
     func newsAtIndex(_ index: Int) -> NewsViewModel {
         let newsIndex = self.newsModelList[index]
         return NewsViewModel(newsIndex)
     }
}

struct NewsViewModel {
    let newsModel: Article
    
    init(_ news : Article) {
        self.newsModel = news
    }
    
    var title : String {
        return self.newsModel.title!
    }
}
