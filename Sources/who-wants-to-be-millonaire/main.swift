import Foundation

let main:Main = Main()


class Main{
    let homeViewController = HomeViewController.instance

    init(){
        homeViewController.start()
    }
    
}