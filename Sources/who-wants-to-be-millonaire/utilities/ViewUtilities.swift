class ViewUtilities{
    static let instance:ViewUtilities = ViewUtilities()
    
    func clearScreem(){
        print("\u{1B}[1;1H", "\u{1B}[2J")
    }
}