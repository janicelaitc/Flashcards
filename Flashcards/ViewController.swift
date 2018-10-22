//
//  ViewController.swift
//  Flashcards
//
//  Created by Janice Lai on 10/8/18.
//  Copyright © 2018 JaniceLai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var flashcardsController: ViewController!
    var alert: UIAlertController!
    
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var card: UIView!

    
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
        //we knwo the destination of the segue is the navigation controller
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
    func updateFlashcard(question: String, answer: String)  {
        frontLabel.text = question
        backLabel.text = answer
    
    }
    
    
    
    
}
    
    


