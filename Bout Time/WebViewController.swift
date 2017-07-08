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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let movieURL = URL(fileURLWithPath: urlString)
        let movieURLRequest = URLRequest(url: movieURL)
        webView.loadRequest(movieURLRequest)
        print("URL String: \(urlString)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

}
