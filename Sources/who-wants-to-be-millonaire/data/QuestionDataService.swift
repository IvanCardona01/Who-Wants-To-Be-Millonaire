import Foundation
import FoundationNetworking

class QuestionDataService {
    static let instance: QuestionDataService = QuestionDataService()

    public func getAllQuestions(completion: @escaping (Result) -> ()) {
        
        let url = URL(string: "https://opentdb.com/api.php?amount=5&category=18&difficulty=medium&type=multiple")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let urlSession = URLSession.shared

        let task = urlSession.dataTask(with: request){ (data, response, error) in

            guard let data = data else {
                return
            }
            do{
                let decodeData: Result = try JSONDecoder().decode(Result.self, from: data)
                print(decodeData)
                completion(decodeData)
            }catch {
                return
            }
          
        }.resume()

    }


    //UserDefaults
    
}