# Lab 2 Feedback
**Please note that the README part of Lab2 is not updated, it is the same README as Lab1.**
## Instruciton manual (Required part)
- The wordings in the instruction manual is fine and i did not find any mistakes, but personally i think it will be better if the Pro tips can either have a bigger font or maybe a different font so it stands out more.
- Overall there are a lot of information and words in this lab manual and i think that having more spacing and more bullet points will help students better understanding the material. Especially the fact that the lab is due by the day of and stundets might just rush through reading the manual briefly and they might miss some important information.
- Also, since for this lab we are expected to run into some error messages in some parts and the following part will normally explain how to fix it. I think it will be great if there can be a reminder for students to read through the parts of the instruction manual before starting the lab so that they wont stuck on trying to solve the errors and realized that the upcoming bullet points actually provides the solution.

## Instruciton manual (Optional part)
- Optional 1, part 2, the 3rd screenshoot is a bit misleading since it is selected with "style.actionsheet", but we are actually required to select "alert". It will be easier to understand if the highlighted option can be selected with "alert" instead
    - Also, I was experiencing some problem with the alert message showing up on the screen for 2-3 seconds only which does not allow user to click ok since it just flashes on the screen for a short period of time. This is resolved by putting an else statement in the code, and i think it will be great if the manual can include the else statement so that students wont be confused with why the message is only appearing for a short period of time. I have included my code for your reference: 
    
        if questionText == nil||answerText == nil||questionText!.isEmpty||answerText!.isEmpty
        
        {let alert = UIAlertController(title: "Missing Text", message: "You need enter both a question and an answer", preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "Ok", style:.default)
            alert.addAction(okAction)}
        
        else { flashcardsController.updateFlashcard(question: questionText!, answer: answerText!)

        dismiss(animated: true)
        }
    
