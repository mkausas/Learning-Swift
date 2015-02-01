//
//  ViewController.swift
//  Quiz
//
//  Created by Marty Kausas on 1/31/15.
//  Copyright (c) 2015 Marty Kausas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var QuestionLabel: UILabel!
    
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet var Button2: UIButton!
    @IBOutlet var Button3: UIButton!
    @IBOutlet var Button4: UIButton!
    
    @IBOutlet var isCorrectLabel: UILabel!
    var correctAnswer: Int = 0
    var lastQuestion: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RandomQuestions()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func RandomQuestions() {
        var randomNumber = arc4random() % 4
        randomNumber += 1
        
        println("random num = \(randomNumber)")
        switch(randomNumber) {
        case 1:
            QuestionLabel.text = "Hello World, What is my name?"
            Button1.setTitle("Marty", forState: UIControlState.Normal)
            Button2.setTitle("Alex", forState: UIControlState.Normal)
            Button3.setTitle("Haley", forState: UIControlState.Normal)
            Button4.setTitle("Mary", forState: UIControlState.Normal)
            correctAnswer = 1
            
        case 2:
            QuestionLabel.text = "Where are you from?"
            Button1.setTitle("San Fransisco", forState: UIControlState.Normal)
            Button2.setTitle("San Diego", forState: UIControlState.Normal)
            Button3.setTitle("Dallas", forState: UIControlState.Normal)
            Button4.setTitle("Sacramento", forState: UIControlState.Normal)
            correctAnswer = 2
            
        case 3:
            QuestionLabel.text = "Where do you go to school?"
            Button1.setTitle("Georgia Tech", forState: UIControlState.Normal)
            Button2.setTitle("Ohio State", forState: UIControlState.Normal)
            Button3.setTitle("Michigan", forState: UIControlState.Normal)
            Button4.setTitle("Purdue!", forState: UIControlState.Normal)
            correctAnswer = 4
        
        case 4:
            QuestionLabel.text = "Hm?"
            Button1.setTitle("yes", forState: UIControlState.Normal)
            Button2.setTitle("no", forState: UIControlState.Normal)
            Button3.setTitle("maybe", forState: UIControlState.Normal)
            Button4.setTitle("stfu", forState: UIControlState.Normal)
            correctAnswer = 3
        
        default:
            break
        }
        
        for index in 1...4 {
            changeButtonColor(index, color: UIColor.blueColor())
        }
        
        isCorrectLabel.hidden = true
        
    }
    
    func isCorrect(selected: Int) {
        if (selected == correctAnswer) {
            isCorrectLabel.text = "Correct!"
            changeButtonColor(selected, color: UIColor.greenColor())
            NSTimer.scheduledTimerWithTimeInterval(1.5, target: self, selector: Selector("RandomQuestions"), userInfo: nil, repeats: false)
        }
        else {
            isCorrectLabel.text = "Incorrect!"
            changeButtonColor(selected, color: UIColor.redColor())
        }
        isCorrectLabel.hidden = false
    }
    
    func changeButtonColor(button: Int, color: UIColor) {
        switch (button) {
        case 1:
            Button1.backgroundColor = color
        case 2:
            Button2.backgroundColor = color
        case 3:
            Button3.backgroundColor = color
        case 4:
            Button4.backgroundColor = color
        default:
            break
        }
        
    }
    
    @IBAction func Button1Action(sender: AnyObject) {
        isCorrect(1)
    }

    @IBAction func Button2Action(sender: AnyObject) {
        isCorrect(2)
    }
    
    @IBAction func Button3Action(sender: AnyObject) {
        isCorrect(3)
    }
    
    @IBAction func Button4Action(sender: AnyObject) {
        isCorrect(4)
    }
    
    @IBAction func nextButton(sender: AnyObject) {
        RandomQuestions()
    }
}

