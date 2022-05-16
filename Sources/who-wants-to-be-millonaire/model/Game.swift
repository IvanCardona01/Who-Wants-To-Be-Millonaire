import Foundation

class Game{
    static let instance: Game = Game()
    var levelActual: Int = 0
    var levelStatus: [String] = ["🔘","🔘","🔘","🔘","🔘"]
    var score = 10
    var questions: [Question]?

    func restart(){
        score = 10
        levelStatus = ["🔘","🔘","🔘","🔘","🔘"]
        levelActual = 0
    }

    func loadQuestion(questions: [Question]){
        self.questions = questions
    }

    func tickCorrectAnswer(){
        score += 20
        levelStatus[levelActual] = "🟢"
    }

    func tickIncorrectAnswer(){
        if score-10 < 0{
            score = 0
        }else{
            score -= 10
        }
        levelStatus[levelActual] = "🔴"
    }
}