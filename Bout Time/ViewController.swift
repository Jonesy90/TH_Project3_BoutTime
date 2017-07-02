//
//  ViewController.swift
//  Bout Time
//
//  Created by Michael Jones on 02/07/2017.
//  Copyright © 2017 Michael Jones. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    //List of buttons
    @IBOutlet weak var downFullButton: UIButton!
    
    
    
    //Giving each image provided it's own UIImage.
    let fullDownImage = UIImage(named: "down_full.png")
    
    
    
    
    //Giving the buttons the correct background images.
    func loadButtonBackgroundImage() {
        //allocating the images to each button.
        downFullButton.setBackgroundImage(fullDownImage, for: .normal)
        
        
        
        //Removing the title from each button.
        downFullButton.setTitle("", for: .normal)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadButtonBackgroundImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

