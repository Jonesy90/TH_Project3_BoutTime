//
//  GameOverViewController.swift
//  Bout Time
//
//  Created by Michael Jones on 07/07/2017.
//  Copyright © 2017 Michael Jones. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {
    
    var score = 0
    
    @IBOutlet weak var scoreLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Your score is \(score)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playAgain(_ sender: Any) {
        performSegue(withIdentifier: "playAgainSegue", sender: nil)
        
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
