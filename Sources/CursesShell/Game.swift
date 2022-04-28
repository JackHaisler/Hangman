import Foundation
import Curses

class Game {
    let mainWindow: Window

    init(mainWindow: Window) {
        self.mainWindow = mainWindow
    }
    func printHangman(){
        print("________")
        print("\n)")
        print("|      |")
        print("|")
        print("|")
        print("|")
        print("|")
        print("|")

    }
    func run() throws {
        // Load dictionary
        mainWindow.write("Loading dictionary...")
        mainWindow.refresh()

        let dictionaryURL = URL.init(fileURLWithPath: "/usr/share/dict/words")
        let contents = try String(contentsOf: dictionaryURL, encoding: .utf8)
        let lines = contents.split(separator: "\n")
        mainWindow.write("loaded \(lines.count) words")
        mainWindow.refresh()

        // Dictionary is now loaded.  Filter words to include only those suitable.
        
        
        
        var shouldQuit = false
        
        repeat {
            mainWindow.write("Welcome to Hangman. Would you like to start a game? Input y/n")
            mainWindow.getStringFromTextField(at: Point(x: 10, y: 10),
                                              maxCharacters: 1,
                                              fieldColorPair: nil)
            printHangman()

        } while !shouldQuit
    }
}
