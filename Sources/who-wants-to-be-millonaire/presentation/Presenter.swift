import Foundation

class Presenter{
    static let instance: Presenter = Presenter()
    let questionDataService = QuestionDataService.instance
    var questions:[Question]?

    func getAllQuestions()throws -> [Question]{
        
        questionDataService.getAllQuestions(){ (result) in
            let res = result 
            self.questions = res.results
        }
        guard let validateQuestions = questions else {
            throw Errors.InvalidJsonResponseTime
        }
        return validateQuestions
    }

}