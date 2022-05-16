import Foundation

protocol LevelViewControllerDelegate: AnyObject {

    func userDidAnswer(_ answer:String)
}

class LevelView{
    static let instance: LevelView = LevelView()
    weak var delegate: LevelViewControllerDelegate?
    var question: Question?

    func loadLevelView(question: Question){
        self.question = question
        var endLevel = false
        repeat{
            ViewUtilities.clearScreem()
            var answers:[String] = [question.correct_answer]
            for answer in question.incorrect_answers{
                answers.append(answer)
            }
            answers.shuffle()
            printQuestion(availableAnswer: answers)
            guard let selectedOption = readLine() else {
                return
            }
            if optionIsValid(option: selectedOption){
                endLevel = true
                guard let selectedAnswer = Int(selectedOption) else {
                    return
                }
                let userAnswer = answers[selectedAnswer-1]
                guard let _ = readLine() else{
                    return
                }
                delegate?.userDidAnswer(userAnswer)
                print("Level 1")
            }else {
                print("Option is not available\n" + 
                      "Please input the number of the answer\n" + 
                      "Press enter to continue\n")
                guard let _ = readLine() else {
                    return
                }
            }
        }while endLevel == false
        guard let _ = readLine() else{
            return
        }
    }

    func printQuestion(availableAnswer: [String]){
       guard let validatedQuestion = self.question else {
           return
       }
        var questionformat = "***************************************************\n" +
                             "* \(validatedQuestion.question.description)\n" +
                             "* \n" 
        var answerNumber = 1
        for answer in availableAnswer{
            questionformat.append("* \(answerNumber)  \(answer)\n")
            answerNumber += 1
        }
        questionformat.append("*\n***************************************************")
        print(questionformat)
    }

    func optionIsValid(option: String) -> Bool{
        guard let _: Int = Int(option) else {
            return false
        }
        let optionsAvailables = "1234"
        let maxLengthOfAnswer = 1
        let optionIsAvailableAnswer = optionsAvailables.contains(option) && option.count == maxLengthOfAnswer
        if optionIsAvailableAnswer{
            return true
        }else{
            return false
        }
    }
}