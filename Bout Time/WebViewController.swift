//
//  WebViewController.swift
//  Bout Time
//
//  Created by Michael Jones on 08/07/2017.
//  Copyright © 2017 Michael Jones. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    var urlString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebsite()
        print("URL String: \(urlString)")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadWebsite() {
        let movieURL = URL(fileURLWithPath: urlString)
        webView.loadRequest(URLRequest(url: movieURL))
    }
    

}
