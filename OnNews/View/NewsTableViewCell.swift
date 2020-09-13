//
//  NewsTableViewCell.swift
//  OnNews
//
//  Created by Caner Onat on 1.09.2020.
//

import UIKit
import Kingfisher
class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsDescriptionLabel: UILabel!
    @IBOutlet weak var newsPostDateLabel: UILabel!
    static let identifer = "NewsTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "NewsTableViewCell", bundle: nil)
    }
    
    public func configure(with news: NewsViewModel) {
        newsTitleLabel.text = news.title
        newsDescriptionLabel.text = news.newsModel.description
        newsPostDateLabel.text = news.newsModel.publishedAt
        let url = URL(string: news.newsModel.urlToImage ?? "")
        newsImageView.kf.setImage(with: url)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
}
