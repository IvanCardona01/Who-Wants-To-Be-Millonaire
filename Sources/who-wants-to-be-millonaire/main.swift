import Foundation

let main:Main = Main()


class Main{
    let questionDataService = QuestionDataService.instance
    let viewUtilities = ViewUtilities.instance

    init() {
        var exit = false
        repeat{
            viewUtilities.clearScreem()
            let menu: String = "************************\n" +
                               "*    Who wants to be   *\n" +
                               "*      Millonaire      *\n" +
                               "*                      *\n" +
                               "*       1. Play        *\n" +
                               "*       2. Exit        *\n" +
                               "*                      *\n" +
                               "************************\n"
            print(menu)
            let selectedOption = readLine()!
            let optionIsValid: Bool = validateSelectedOption(option: selectedOption)
            if optionIsValid {
                switch selectedOption{
                    case "1":
                        //Init game
                        break
                    case "2":
                        exit = true
                        viewUtilities.clearScreem()
                        break
                    default:
                        print("The validation system failed")
                        break
                }
            }else{
                print("Option is not available \nPress enter to continue")
                readLine()!
            }
        }while exit == false
    }

    func validateSelectedOption(option: String) -> Bool{
        guard let optionInt: Int = Int(option) else {
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