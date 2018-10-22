# Lab 2 Feedback
**Please note that the README part of Lab2 is not updated, it is the same README as Lab1.**
## Instruciton manual (Required part)
- The wordings in the instruction manual is fine and i did not find any mistakes, but personally i think it will be better if the Pro tips can either have a bigger font or maybe a different font so it stands out more
- Overall there are a lot of information and words in this lab manual and i think that have more spacing/more small bullet points will help students better understanding the material, especially the fact that the labs are due the day of and they might not have enough time to read everything word to word 
- Also, since for this lab we are expected to run into some error messages and the following part of the manual will explain how to fix it. I think it will be great if there can be a reminder for students to read through/read ahead of the instruction manual first before starting the lab (I was very anxious when I ran into some error/bugs and spent some time trying to figure out the reason. But then realized the following step actually explains the problem and provided solution, therefore a reminder to read through the instruction before starting will be helpful)

## Instruciton manual (Optional part)
- Optional 1, part 2, 3rd screenshoot is a bit misleading since it is selected with "style.actionsheet", but we are actually required to select "alert". It will be easier to understand if the highlighted option can be "alert" instead
    - Also, I was experiencing some problem with the alert message showing up on the screen for 2-3 seconds which does not allow user to click ok. This is resolved by putting an else statement in the code, and i think it will be great if the manual can include the else statement so that students wont be confused with why the message is only appearing for a short period of time. I have included my code for your reference: 
    
        if questionText == nil||answerText == nil||questionText!.isEmpty||answerText!.isEmpty
        
        {let alert = UIAlertController(title: "Missing Text", message: "You need enter both a question and an answer", preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "Ok", style:.default)
            alert.addAction(okAction)}
        
        else { flashcardsController.updateFlashcard(question: questionText!, answer: answerText!)

        dismiss(animated: true)
        }
    
