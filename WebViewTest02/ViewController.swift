//
//  ViewController.swift
//  WebViewTest02
//
//  Created by malgat on 2019. 9. 9..
//  Copyright © 2019년 201526109. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController, UISearchBarDelegate, WKNavigationDelegate {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var forwardButton: UIBarButtonItem!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UISearchBarDelegate 객체와 UIViewController 객체와의 연결
        searchBar.delegate = self
        webView.navigationDelegate = self
        
        indicator.isHidden = true
        
        let request = URLRequest(url : URL(string : "http://www.naver.com")!)
        webView.load(request)
        
    }

    @IBAction func backAction(_ sender: Any) {
        if self.webView.canGoBack {
           self.webView.goBack()
        }
    }
    @IBAction func forwardAction(_ sender: Any) {
        if self.webView.canGoForward {
            self.webView.goForward()
        }
    }
    
    //SearchbarDelegate Method 호출
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        let inputURL = searchBar.text!
        let request = URLRequest(url: URL(string: inputURL)!)
        webView.load(request)
    }
    //WKNavigationDelegate Method 호출
    //웹 받기 시작할 때
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        indicator.isHidden = false
        indicator.startAnimating()
    }
    //웹 받기 끝났을 때
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        backButton.isEnabled = webView.canGoBack
        forwardButton.isSpringLoaded = webView.canGoForward
        indicator.isHidden = true
        indicator.stopAnimating()
    }
}
