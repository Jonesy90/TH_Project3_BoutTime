//
//  ViewController.swift
//  Bout Time
//
//  Created by Michael Jones on 02/07/2017.
//  Copyright © 2017 Michael Jones. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController {
    
    let events = Events()
    
    
    var randomNumber: Int = 0
    var repetitionStopper: [Int] = []
    var birthdaysInOrder: [Int] = []
    
    var years: [Int] = []
    var firstEventBirthday = 0
    var secondEventBirthday = 0
    var thirdEventBirthday = 0
    var fourthEventBirthday = 0
    
    
    //List of labels
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    @IBOutlet weak var labelFour: UILabel!
    
    
    //List of buttons
    @IBOutlet weak var downFullButton: UIButton!
    @IBOutlet weak var secondLabelHalfUp: UIButton!
    @IBOutlet weak var secondLabelHalfDown: UIButton!
    @IBOutlet weak var thirdLabelHalfUp: UIButton!
    @IBOutlet weak var thirdLabelHalfDown: UIButton!
    @IBOutlet weak var upFullButton: UIButton!
    
    
    //Giving each image provided it's own UIImage.
    let fullDownImage = UIImage(named: "down_full.png")
    let downHalfImage = UIImage(named: "down_half.png")
    let upHalfImage = UIImage(named: "up_half.png")
    let fullUpImage = UIImage(named: "up_full.png")
    
    
    //Giving the buttons the correct background images.
    func loadButtonBackgroundImage() {
        //allocating the images to each button.
        downFullButton.setBackgroundImage(fullDownImage, for: .normal)
        secondLabelHalfUp.setBackgroundImage(upHalfImage, for: .normal)
        secondLabelHalfDown.setBackgroundImage(downHalfImage, for: .normal)
        thirdLabelHalfUp.setBackgroundImage(upHalfImage, for: .normal)
        thirdLabelHalfDown.setBackgroundImage(downHalfImage, for: .normal)
        upFullButton.setBackgroundImage(fullUpImage, for: .normal)
        
        
        //Removing the title from each button.
        downFullButton.setTitle("", for: .normal)
        secondLabelHalfUp.setTitle("", for: .normal)
        secondLabelHalfDown.setTitle("", for: .normal)
        thirdLabelHalfUp.setTitle("", for: .normal)
        thirdLabelHalfDown.setTitle("", for: .normal)
        upFullButton.setTitle("", for: .normal)
    }
    
    //Generates a random number from the amount of events in the birthday events.
    func randomNumberGenerator() {
        randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: events.birthdays.count)
    }
    
    //FIXIT: displayEvents method isn't safely unwrapping the events.
    func displayEventsInLabels() {
        let labels = [labelOne, labelTwo, labelThree, labelFour]
        
        for _ in 0..<labels.count {
            randomNumberGenerator()
            while repetitionStopper.contains(randomNumber) {
                randomNumberGenerator()
            }
            repetitionStopper.append(randomNumber)
        }
        print(repetitionStopper)
        
        //Placing the names from the birthday array ditionary to the labels on the UI.
        let firstEvent = events.birthdays[repetitionStopper[0]]
        let secondEvent = events.birthdays[repetitionStopper[1]]
        let thirdEvent = events.birthdays[repetitionStopper[2]]
        let fourthEvent = events.birthdays[repetitionStopper[3]]
        
        //Stores the values each event birthday.
        firstEventBirthday = firstEvent["birthday_year"] as! Int
        secondEventBirthday = secondEvent["birthday_year"] as! Int
        thirdEventBirthday = thirdEvent["birthday_year"] as! Int
        fourthEventBirthday = fourthEvent["birthday_year"] as! Int
        
        update()
        let sortedYears = years.sorted()
        
        print("Years: \(years)")
        print("Sorted Years: \(sortedYears)")
        
        print("First Event: \(firstEvent)")
        print("Second Event: \(secondEvent)")
        print("Third Event: \(thirdEvent)")
        print("Fourth Event: \(fourthEvent)")
        
        //Displaying the names in the labels.
        
        if let firstEvent = firstEvent["name"] {
            labelOne.text = (firstEvent as! String)
        }
        
        if let secondEvent = secondEvent["name"] {
            labelTwo.text = (secondEvent as! String)
        }
        
        if let thirdEvent = thirdEvent["name"] {
            labelThree.text = (thirdEvent as! String)
        }
        
        if let fourthEvent = fourthEvent["name"] {
            labelFour.text = (fourthEvent as! String)
        }
        
    }
    
    func update() {
        years = [firstEventBirthday, secondEventBirthday, thirdEventBirthday, fourthEventBirthday]
    }
    
    
    //Swaping events when a button event happens.
    
    @IBAction func fullDownButtonAction(_ sender: Any) {
        swap(&labelOne.text, &labelTwo.text)
        swap(&firstEventBirthday, &secondEventBirthday)
        update()
        print("Updated Years: \(years)")
    }
    
    @IBAction func halfUpButtonActionOne(_ sender: Any) {
        swap(&labelOne.text, &labelTwo.text)
        swap(&firstEventBirthday, &secondEventBirthday)
        update()
        print("Updated Years: \(years)")
    }
    
    @IBAction func halfDownButtonActionOne(_ sender: Any) {
        swap(&labelTwo.text, &labelThree.text)
        swap(&secondEventBirthday, &thirdEventBirthday)
        update()
        print("Updated Years: \(years)")
    }
    
    @IBAction func halfUpButtonActionTwo(_ sender: Any) {
        swap(&labelTwo.text, &labelThree.text)
        swap(&secondEventBirthday, &thirdEventBirthday)
        update()
        print("Updated Years: \(years)")
    }
    
    @IBAction func halfDownButtonActionTwo(_ sender: Any) {
        swap(&labelThree.text, &labelFour.text)
        swap(&thirdEventBirthday, &fourthEventBirthday)
        update()
        print("Updated Years: \(years)")
    }
    
    @IBAction func fullUpButtonAction(_ sender: Any) {
        swap(&labelThree.text, &labelFour.text)
        swap(&thirdEventBirthday, &fourthEventBirthday)
        update()
        print("Updated Years: \(years)")
    }
    
    
    @IBAction func doneButton(_ sender: Any) {
        if years == years.sorted() {
            print("Sorted")
        } else {
            print("Not Sorted")
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadButtonBackgroundImage()
        displayEventsInLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

