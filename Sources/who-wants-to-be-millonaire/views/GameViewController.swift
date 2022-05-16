import Foundation

class GameViewController {
    static let instance: GameViewController = GameViewController()
    let levelView = LevelView.instance
    let presenter = Presenter.instance
    var game = Game.instance
    
    func startGame(){
        do{
            try? game.questions = presenter.getAllQuestions()
        }catch Errors.InvalidJsonResponseTime{
            print("invalid json response time")
            return
        }
        var exit = false
        repeat{
            printLevels()
            guard let selectedOption = readLine() else {
                return
            }
            if optionIsValid(option: selectedOption){
                let isRestart = selectedOption == "2" && game.levelActual == 5
                let isExit = selectedOption == "1"
                if isRestart{
                    game.restart()
                }else if isExit{
                    exit = true
                }else{
                    guard let questions = game.questions else {
                        return
                    }
                    let levelQuestion = questions[game.levelActual]
                    levelView.loadLevelView(question: levelQuestion)
                    levelView.delegate = self
                }
            }else{
                print("Option is not available")
                guard let _ = readLine() else{
                    return
                }
            }
        }while exit == false
    }

    func printLevels(){
        ViewUtilities.clearScreem()
        var graphicLevesView = "****************************\n" +
                               "*          LEVELS          *\n" +
                               "*                          *\n" +
                               "*        level 1   \(game.levelStatus[0])      *\n" +
                               "*        level 2   \(game.levelStatus[1])      *\n" +
                               "*        level 3   \(game.levelStatus[2])      *\n" +
                               "*        level 4   \(game.levelStatus[3])      *\n" +
                               "*        level 5   \(game.levelStatus[4])      *\n" +
                               "*                          *\n" 
        let finisGame = game.levelActual == 5
        if (finisGame){
            graphicLevesView.append("* 🔙 1. Exit   Reset 2. 🔄 *\n")
        }else{
            graphicLevesView.append("* 🔙 1. Exit      Go 2. 🔜 *\n")
        }
        graphicLevesView.append("*         IQ🧠 \(game.score)          *\n" + 
                                "****************************\n")
        print(graphicLevesView)
    }

    func optionIsValid(option: String) -> Bool{
        guard let _: Int = Int(option) else {
            return false
        }
        let optionsAvailables = "12"
        let maxLengthOfAnswer = 1
        let optionIsAvailableAnswer = optionsAvailables.contains(option) && option.count == maxLengthOfAnswer
        if optionIsAvailableAnswer{
            return true
        }else{
            return false
        }
    }
}

extension GameViewController: LevelViewControllerDelegate{
    func userDidAnswer(_ answer: String) {
        guard let questions = game.questions else{
            return 
        }
        let actualLevelanswer = questions[game.levelActual].correct_answer
        let answerIsCorrect = answer == actualLevelanswer
        if answerIsCorrect{ 
            game.tickCorrectAnswer()
        }else{
            game.tickIncorrectAnswer()
        }
        game.levelActual += 1
    }
}