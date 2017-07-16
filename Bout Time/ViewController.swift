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
    
    let commicMovies = ComicMovies()
    var timer = Timer()
    
    
    var randomNumber: Int = 0
    var repetitionStopper: [Int] = []
    var birthdaysInOrder: [Int] = []
    var currentNumberOfRounds = 0
    let numberOfRounds = 6
    var points = 0
    
    var years: [Int] = []
    var firstYearOfRelease = 0
    var secondYearOfRelease = 0
    var thirdYearOfRelease = 0
    var fourthYearOfRelease = 0
    
    var urlLinks: [String] = []
    var firstLink = ""
    var secondLink = ""
    var thirdLink = ""
    var fourthLink = ""
    var destinationURL = ""
    
    var timerNumber = 60
    
    //MARK: Labels
    //List of labels
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    @IBOutlet weak var labelFour: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    //MARK: Buttons
    //List of buttons
    @IBOutlet weak var downFullButton: UIButton!
    @IBOutlet weak var secondLabelHalfUp: UIButton!
    @IBOutlet weak var secondLabelHalfDown: UIButton!
    @IBOutlet weak var thirdLabelHalfUp: UIButton!
    @IBOutlet weak var thirdLabelHalfDown: UIButton!
    @IBOutlet weak var upFullButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    
    
    //MARK: Assigning images to UIImages.
    //Giving each image provided it's own UIImage.
    let fullDownImage = UIImage(named: "down_full.png")
    let downHalfImage = UIImage(named: "down_half.png")
    let upHalfImage = UIImage(named: "up_half.png")
    let fullUpImage = UIImage(named: "up_full.png")
    
    let nextRoundSuccessImage = UIImage(named: "next_round_success")
    let nextRoundFailImage = UIImage(named: "next_round_fail")
    
    let downFullSelected = UIImage(named: "down_full_selected")
    let downHalfSelected = UIImage(named: "down_half_selected")
    let upHalfSelected = UIImage(named: "up_half_selected")
    let upFullSelected = UIImage(named: "up_full_selected")
    
    
    //Giving the buttons the correct background images.
    func loadButtonBackgroundImage() {
        //allocating the images to each button.
        downFullButton.setBackgroundImage(fullDownImage, for: .normal)
        secondLabelHalfUp.setBackgroundImage(upHalfImage, for: .normal)
        secondLabelHalfDown.setBackgroundImage(downHalfImage, for: .normal)
        thirdLabelHalfUp.setBackgroundImage(upHalfImage, for: .normal)
        thirdLabelHalfDown.setBackgroundImage(downHalfImage, for: .normal)
        upFullButton.setBackgroundImage(fullUpImage, for: .normal)
        
        downFullButton.setBackgroundImage(downFullSelected, for: .highlighted)
        secondLabelHalfUp.setBackgroundImage(upHalfSelected, for: .highlighted)
        secondLabelHalfDown.setBackgroundImage(downHalfSelected, for: .highlighted)
        thirdLabelHalfUp.setBackgroundImage(upHalfSelected, for: .highlighted)
        thirdLabelHalfDown.setBackgroundImage(downHalfSelected, for: .highlighted)
        upFullButton.setBackgroundImage(upFullSelected, for: .highlighted)
        
        
        //Removing the title from each button.
        downFullButton.setTitle("", for: .normal)
        secondLabelHalfUp.setTitle("", for: .normal)
        secondLabelHalfDown.setTitle("", for: .normal)
        thirdLabelHalfUp.setTitle("", for: .normal)
        thirdLabelHalfDown.setTitle("", for: .normal)
        upFullButton.setTitle("", for: .normal)
        doneButton.setTitle("", for: .normal)
        
    }
    
    //Generates a random number from the amount of events in the birthday events.
    func randomNumberGenerator() {
        randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: commicMovies.movies.count)
    }
    
    func reset() {
        repetitionStopper = []
        doneButton.isHidden = true
        descriptionLabel.text = "Shake to Complete"
        timerLabel.text = String("0:\(timerNumber)")
        startTimer()
        loadButtonBackgroundImage()
        timerLabel.isHidden = false
        
    }
    
    //FIXIT: displayEvents method isn't safely unwrapping the events.
    func displayEventsInLabels() {
        reset()
        
        
        print("displayEventInLabels Points:  \(points)")
        print("displayEventInLabels: \(currentNumberOfRounds) out of \(numberOfRounds)")
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
        let firstEvent = commicMovies.movies[repetitionStopper[0]]
        let secondEvent = commicMovies.movies[repetitionStopper[1]]
        let thirdEvent = commicMovies.movies[repetitionStopper[2]]
        let fourthEvent = commicMovies.movies[repetitionStopper[3]]
        
        //Stores the values each event birthday.
        firstYearOfRelease = firstEvent["yearOfRelease"] as! Int
        secondYearOfRelease = secondEvent["yearOfRelease"] as! Int
        thirdYearOfRelease = thirdEvent["yearOfRelease"] as! Int
        fourthYearOfRelease = fourthEvent["yearOfRelease"] as! Int
        
        firstLink = firstEvent["IMDBLink"] as! String
        secondLink = secondEvent["IMDBLink"] as! String
        thirdLink = thirdEvent["IMDBLink"] as! String
        fourthLink = fourthEvent["IMDBLink"] as! String
        
        years = [firstYearOfRelease, secondYearOfRelease, thirdYearOfRelease, fourthYearOfRelease]
        urlLinks = [firstLink, secondLink, thirdLink, fourthLink]
        
        let sortedyearOfRelease = years.sorted()
        
        print("Years: \(years)")
        print("Sorted Years: \(sortedyearOfRelease)")
        
        //Displaying the names in the labels.
        
        if let firstEvent = firstEvent["moviename"] {
            labelOne.text = (firstEvent as! String)
        }
        
        if let secondEvent = secondEvent["moviename"] {
            labelTwo.text = (secondEvent as! String)
        }
        
        if let thirdEvent = thirdEvent["moviename"] {
            labelThree.text = (thirdEvent as! String)
        }
        
        if let fourthEvent = fourthEvent["moviename"] {
            labelFour.text = (fourthEvent as! String)
        }
        
    }
    
    //MARK: Button Events.
    
    //Swaping events when a button event happens.
    
    @IBAction func fullDownButtonAction(_ sender: Any) {
        swap(&labelOne.text, &labelTwo.text)
        swap(&years[0], &years[1])
        swap(&urlLinks[0], &urlLinks[1])
        print("Updated Years: \(years)")
    }
    
    @IBAction func halfUpButtonActionOne(_ sender: Any) {
        swap(&labelOne.text, &labelTwo.text)
        swap(&years[0], &years[1])
        swap(&urlLinks[0], &urlLinks[1])
        print("Updated Years: \(years)")
    }
    
    @IBAction func halfDownButtonActionOne(_ sender: Any) {
        swap(&labelTwo.text, &labelThree.text)
        swap(&years[1], &years[2])
        swap(&urlLinks[1], &urlLinks[2])
        print("Updated Years: \(years)")
    }
    
    @IBAction func halfUpButtonActionTwo(_ sender: Any) {
        swap(&labelTwo.text, &labelThree.text)
        swap(&years[1], &years[2])
        swap(&urlLinks[1], &urlLinks[2])
        print("Updated Years: \(years)")
    }
    
    @IBAction func halfDownButtonActionTwo(_ sender: Any) {
        swap(&labelThree.text, &labelFour.text)
        swap(&years[2], &years[3])
        swap(&urlLinks[2], &urlLinks[3])
        print("Updated Years: \(years)")
    }
    
    @IBAction func fullUpButtonAction(_ sender: Any) {
        swap(&labelThree.text, &labelFour.text)
        swap(&years[2], &years[3])
        swap(&urlLinks[2], &urlLinks[3])
        print("Updated Years: \(years)")
    }
    
    //MARK: Shake Event.
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        //Once user shakes device, it will show that they've completed the task.
        descriptionLabel.text = "Tap events to know more"
        doneButton.isHidden = false
        //TODO: - Stop timer.
        stopAndResetTime()
        timerLabel.isHidden = true
        swapButtonsUnclickable()
        sortChecker()
        
    }
    
    @IBAction func labelButtonOneAction(_ sender: Any) {
        destinationURL = urlLinks[0]
        print("Destination URL: \(destinationURL)")
    }
    @IBAction func labelButtonTwoAction(_ sender: Any) {
        performSegue(withIdentifier: "urlSegue", sender: nil)
        destinationURL = urlLinks[1]
    }
    @IBAction func labelButtonThreeAction(_ sender: Any) {
        performSegue(withIdentifier: "urlSegue", sender: nil)
        destinationURL = urlLinks[2]
    }
    @IBAction func labelButtonFourAction(_ sender: Any) {
        performSegue(withIdentifier: "urlSegue", sender: nil)
        destinationURL = urlLinks[3]
    }
    
    
    
    
    //MARK: - TIMER
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.counter), userInfo: nil, repeats: true)
    }
    
    func counter() {
        timerNumber -= 1
        timerLabel.text = String("0:\(timerNumber)")
        
        if timerNumber == 0 {
            timer.invalidate()
            swapButtonsUnclickable()
            timerLabel.isHidden = true
            doneButton.isHidden = false
            sortChecker()
            stopAndResetTime()
        }
    }
    
    func sortChecker() {
        if years == years.sorted() {
            doneButton.setBackgroundImage(nextRoundSuccessImage, for: .normal)
            print("Current Round: \(currentNumberOfRounds)")
        } else {
            doneButton.setBackgroundImage(nextRoundFailImage, for: .normal)
            print("Current Round: \(currentNumberOfRounds)")
        }
    }
    
    func swapButtonsUnclickable() {
        downFullButton.isEnabled = false
        secondLabelHalfUp.isEnabled = false
        secondLabelHalfDown.isEnabled = false
        thirdLabelHalfUp.isEnabled = false
        thirdLabelHalfDown.isEnabled = false
        upFullButton.isEnabled = false
    }
    
    func swapButtonsClickable() {
        downFullButton.isEnabled = true
        secondLabelHalfUp.isEnabled = true
        secondLabelHalfDown.isEnabled = true
        thirdLabelHalfUp.isEnabled = true
        thirdLabelHalfDown.isEnabled = true
        upFullButton.isEnabled = true
    }
    
    func stopAndResetTime() {
        timer.invalidate()
        timerNumber = 60
        timerLabel.text = String("0:\(timerNumber)")
    }
    
    @IBAction func doneAction(_ sender: Any) {
        currentNumberOfRounds += 1
        if doneButton.currentBackgroundImage == nextRoundSuccessImage {
            print("doneAction: \(currentNumberOfRounds) out of \(numberOfRounds)")
            points += 1
            print("Success")
            swapButtonsClickable()
            nextRound()
        } else if doneButton.currentBackgroundImage == nextRoundFailImage {
            print("doneAction: \(currentNumberOfRounds) out of \(numberOfRounds)")
            print("Fail")
            swapButtonsClickable()
            nextRound()
        }
    }
    
    func nextRound() {
        if currentNumberOfRounds == numberOfRounds {
            print("nextRound: \(currentNumberOfRounds) out of \(numberOfRounds)")
            print("Game Over")
            performSegue(withIdentifier: "gameOverSegue", sender: nil)
            doneButton.isEnabled = false
        } else if currentNumberOfRounds < numberOfRounds {
            displayEventsInLabels()
        }
    }
    
    
    //MARK: ViewDiDLoad Function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        displayEventsInLabels()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gameOverSegue" {
            if let totalScore = segue.destination as? GameOverViewController {
                totalScore.score = points
                totalScore.totalRounds = numberOfRounds
            }
        }
}

    

}

