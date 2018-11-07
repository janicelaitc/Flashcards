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
    var flashcards = [Flashcard]()
    var currentIndex = 0
    
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    
//    @IBAction func didTapOnDelete(_ sender: Any) {
//        func deleteCurrentFlashcard() {}
//
//        let alert = UIAlertController(title: "Delete flashcard", message: "Are you sure you want to delete it?", preferredStyle: .actionSheet)
//        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) {action in self.deleteCurrentFlashcard() }
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
//
//
//alert.addAction(deleteAction)
//    }
    
    
    @IBAction func didTapOnPrev(_ sender: Any) {
        currentIndex = currentIndex - 1
        print("current Index", currentIndex)
        updateLabels()
        updateNextPrevButtons()
        
    }
    
    @IBAction func didTapOnNext(_ sender: Any) {
        currentIndex = currentIndex + 1
        updateLabels()
        updateNextPrevButtons()
        
    }
    
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
        readSavedFlashcards()
        if flashcards.count==0{
           updateFlashcard(question: "What is the meaning of life 🤯?", answer: "To eat🍜and to sleep😪")
        }else {
            updateLabels()
            updateNextPrevButtons()
        }
        
        
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

    
    func saveAllFlashcardsTodisk (){
        let dictionaryArray = flashcards.map { (card) -> [String: String]  in
        return ["question": card.question,  "answer": card.answer]
        }
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcard")
        
        print("💪🏻Flashcards saved to UserDefaults")

}
    func readSavedFlashcards () {
        if let dictionaryArray = UserDefaults.standard.array (forKey: "flashcards") as? [[String:String]]{
        
            let savedCards = dictionaryArray.map{ dictionary -> Flashcard in return Flashcard(question:dictionary["question"]!, answer:dictionary["answer"]!)
                
            }
                flashcards.append(contentsOf: savedCards)
            }
    }
    

}

