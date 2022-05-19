import Foundation

class HomeViewController{
    static let instance: HomeViewController = HomeViewController()
    let gameViewController = GameViewController.instance

    func start() {
        var exit = false
        repeat{
            ViewUtilities.clearScreem()
            let menu: String = "************************\n" +
                               "*    Who wants to be   *\n" +
                               "*      Millonaire      *\n" +
                               "*                      *\n" +
                               "*       1. Play        *\n" +
                               "*       2. Exit        *\n" +
                               "*                      *\n" +
                               "************************\n"
            print(menu)
            guard let selectedOption = readLine() else{
                return
            }
            if optionIsValid(option: selectedOption) {
                switch selectedOption{
                    case "1":
                        gameViewController.startGame()
                        break
                    case "2":
                        exit = true
                        ViewUtilities.clearScreem()
                        break
                    default:
                        print("The validation system failed")
                        break
                }
            }else{
                print("Option is not available")
                guard let _ = readLine() else{
                    return
                }
            }
        }while !exit
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