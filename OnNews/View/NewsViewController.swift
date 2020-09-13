//
//  NewsViewController.swift
//  OnNews
//
//  Created by Caner Onat on 1.09.2020.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var newsModelList: NewsListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "OnNews"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewsTableViewCell.nib(), forCellReuseIdentifier: NewsTableViewCell.identifer)
        getdata()
    }

    
    private func getdata(){
        let url = URL(string:"http://newsapi.org/v2/top-headlines?country=tr&apiKey=044f83f4423847ae8e3c0cce56f28b94")!
        
        NewsWebService().downloadNews(url: url) { (newsTableList) in

            if let newsTableList = newsTableList {
                self.newsModelList = NewsListViewModel(newsModelList: newsTableList.articles)
                DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
            }
        }
    }
}



extension NewsViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsModelList == nil ? 0 : self.newsModelList.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newsCell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell") as! NewsTableViewCell
        let newsViewModelCell = self.newsModelList.newsAtIndex(indexPath.row)
        newsCell.configure(with: newsViewModelCell)
       
        return newsCell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newsViewModelCell = self.newsModelList.newsAtIndex(indexPath.row)
        var newsDetailController = NewsDetailViewController()
        newsDetailController.newsUrl = newsViewModelCell.newsModel.url
        
        newsDetailController.modalPresentationStyle = .fullScreen
        self.present(newsDetailController, animated: false, completion: nil)
        return
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
}

extension NewsViewController:UITableViewDelegate{
    
    
}


