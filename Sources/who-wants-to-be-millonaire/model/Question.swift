struct Result: Codable {
    var results: [Question]
}

struct Question: Codable {
    var question: String
    var correct_answer: String
    var incorrect_answers: [String]
}