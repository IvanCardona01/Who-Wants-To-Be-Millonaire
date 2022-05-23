import Foundation
import FoundationNetworking

class QuestionDataService {
    static let instance: QuestionDataService = QuestionDataService()

    func getAllQuestions(completion: @escaping (Result) -> ()) {
        
        guard let url = URL(string: "https://opentdb.com/api.php?amount=5&category=18&difficulty=medium&type=multiple") else{
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let urlSession = URLSession.shared

        let task = urlSession.dataTask(with: request){ (data, response, error) in

            guard let data = data else {
                return
            }
            DispatchQueue.global().async {
                let decodeData: Result = try! JSONDecoder().decode(Result.self, from: data)
                completion(decodeData)
            }
          
        }
        task.resume()

    }
    
}