//
//  NewsDetailViewController.swift
//  OnNews
//
//  Created by Caner Onat on 1.09.2020.
//

import UIKit
import WebKit

class NewsDetailViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    var newsUrl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsUrl =  newsUrl?.replacingOccurrences(of: " ", with:"")
        newsUrl =  newsUrl?.replacingOccurrences(of: "\n", with:"")
        webView.load(URLRequest(url: URL(string: newsUrl! as String)!))
        
    }
 
    @IBAction func dismissTappedButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
