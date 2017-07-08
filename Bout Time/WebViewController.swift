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
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let url = URL(string: "https://www.google.co.uk")
        webView.loadRequest(URLRequest(url: url!))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

}
