//
//  NewsFeed.swift
//  OnNews
//
//  Created by Caner Onat on 1.09.2020.
//

import Foundation

struct NewsFeed:Codable {
    var status:String = ""
    var totalResults:Int = 0
    var articles:[Article]
}
