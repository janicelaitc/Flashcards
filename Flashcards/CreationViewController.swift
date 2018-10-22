//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Janice Lai on 10/21/18.
//  Copyright © 2018 JaniceLai. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {

    
    var flashcardsController: ViewController!
    var aler: UIAlertController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
   questionTextField.text = initialQuestion
        answerTextField.text = initialAnswer
    }

    
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)

    }
    @IBOutlet weak var questionTextField: UITextField!
    
    @IBOutlet weak var answerTextField: UITextField!
    var initialQuestion: String?
    var initialAnswer: String?
    
    @IBAction func didTapOnDone(_ sender: Any) {
        
        //get the text in the quesiton text field
        let questionText = questionTextField.text
        
        //get the text in the answer text field
        let answerText = answerTextField.text
        
        //check if empty
        
        if questionText == nil||answerText == nil||questionText!.isEmpty||answerText!.isEmpty
        
        {
          
        //show error

        let alert = UIAlertController(title: "Missing Text", message: "You need enter both a question and an answer", preferredStyle: UIAlertController.Style.alert)
        
             present(alert, animated: true)
            
        let okAction = UIAlertAction(title: "Ok", style:.default)
            alert.addAction(okAction)
    
        }
        
        else {
        
        //call the function to update the flashcard
        flashcardsController.updateFlashcard(question: questionText!, answer: answerText!)
        
        //dismiss
        dismiss(animated: true)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

