import Curses

class Game {
    let mainWindow: Window

    init(mainWindow: Window) {
        self.mainWindow = mainWindow
    }

    func run() {
        var shouldQuit = false
        
        repeat {
            mainWindow.write("Welcome to Hangman. Would you like to start a game? Input y/n")
            mainWindow.getStringFromTextField(at: Point(x: 10, y: 10),
                                              maxCharacters: 1,
                                              fieldColorPair: nil)
            if 
        } while !shouldQuit
    }
}
