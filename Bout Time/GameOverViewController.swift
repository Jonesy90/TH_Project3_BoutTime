//
//  GameOverViewController.swift
//  Bout Time
//
//  Created by Michael Jones on 07/07/2017.
//  Copyright © 2017 Michael Jones. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {
    
    let viewController = ViewController()
    
    @IBOutlet weak var scoreLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        
//        scoreLabel.text = String(viewController.points)
        print("You scored: \(viewController.points)")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playAgain(_ sender: Any) {
        performSegue(withIdentifier: "playAgainSegue", sender: nil)
        viewController.points = 0
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}