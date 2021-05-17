//
//  WebViewController.swift
//  MyToolsApp
//
//  Created by Yunus Emre Coşkun on 15.05.2021.
//

import UIKit
import WebKit
class WebViewController: UIViewController {
    
    @IBOutlet var webView: WKWebView!
    var url : String!
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load(URLRequest(url: URL(string: url)!))
    }
}
