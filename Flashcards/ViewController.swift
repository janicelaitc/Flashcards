//
//  ViewController.swift
//  Flashcards
//
//  Created by Janice Lai on 10/8/18.
//  Copyright © 2018 JaniceLai. All rights reserved.
//

import UIKit

struct Flashcard {
    var question: String
    var answer: String
}

class ViewController: UIViewController {

    var flashcardsController: ViewController!
    var alert: UIAlertController!
    
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    
    @IBAction func didTapOnPrev(_ sender: Any) {
        currentIndex = currentIndex - 1
        updateLabels()
        updateNextPrevButtons()
        
    }
    
    @IBAction func didTapOnNext(_ sender: Any) {
        currentIndex = currentIndex + 1
        updateLabels()
        updateNextPrevButtons()
        
    }
    
    var flashcards = [Flashcard]()
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        card.layer.cornerRadius = 10.0
        //card.clipsToBounds = true
        card.layer.shadowRadius = 15.0
        card.layer.shadowOpacity = 5.2
        frontLabel.layer.cornerRadius = 10.0
        backLabel.layer.cornerRadius = 10.0
        frontLabel.clipsToBounds = true
        backLabel.clipsToBounds = true
        updateFlashcard(question: "What is the meaning of life 🤯?", answer: "To eat 🍜and to sleep😪")
        
    }

    @IBAction func didTapOnFlashCard(_ sender: Any) {
        if frontLabel.isHidden == false {
            frontLabel.isHidden = true}
        else {
            frontLabel.isHidden = false 
        }
    }
    
    override func prepare (for segue: UIStoryboardSegue, sender: Any?)
    {
        //we know the destination of the segue is the navigation controller
        let navigationController = segue.destination as! UINavigationController
        
        //we know the navigation controller only contains a creation view controller
        let creationController = navigationController.topViewController as! CreationViewController
        
        creationController.flashcardsController = self
        //we set the flashcardcontroller property to self
        if segue.identifier == "EditSegue"{
            creationController.initialQuestion = frontLabel.text
            creationController.initialAnswer = backLabel.text
            
        }
        
    }
    
    func updateLabels() {
        let currentFlashcard = flashcards [currentIndex]
        frontLabel.text = currentFlashcard.question
        backLabel.text = currentFlashcard.answer
        
    }
    func updateNextPrevButtons () {
        if currentIndex == flashcards.count - 1 {
            nextButton.isEnabled = false
        }
            else {
                nextButton.isEnabled = true
        }
        
        if currentIndex == 0 {
            prevButton.isEnabled = false
        }
        else {
            prevButton.isEnabled = true
        }
    }
    
    
    func updateFlashcard(question: String, answer: String)  {
        let flashcard = Flashcard (question: question, answer: answer)
        frontLabel.text = flashcard.question
        backLabel.text = flashcard.answer
        flashcards.append(flashcard)
        print ("🤩Added a new flashcard🤩")
        print ("🤩We now have \(flashcards.count) flashcards🤩")
        currentIndex = flashcards.count - 1
        print ("Our current index is \(currentIndex)")
        updateNextPrevButtons()
        updateLabels()
    
    }
    
    
    
    
}
    
    


