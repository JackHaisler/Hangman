import Foundation
import Curses

class Game {
    let mainWindow: Window

    init(mainWindow: Window) {
        self.mainWindow = mainWindow
    }

    func run() throws {
        // Load dictionary
        mainWindow.write("Loading dictionary...")
        mainWindow.refresh()

        let dictionaryURL = URL.init(fileURLWithPath: "/usr/share/dict/words")
        let contents = try String(contentsOf: dictionaryURL, encoding: .utf8)
        let words = contents.split(separator: "\n")
        mainWindow.write("loaded \(words.count) words")
        mainWindow.refresh()

        // Dictionary is now loaded.  Filter words to include only those suitable.
        // We eliminate those words that have an apostrophe and also ensure that all words are lowercased
        var goodWords = [String]()
        for word in words {
            if !word.contains("'") {
                goodWords.append(word.lowercased())
            }
        }

        // Select a random word
        let randomWord = goodWords.randomElement()!
        mainWindow.write(" The randomly selected word is \(randomWord)")
        mainWindow.refresh()
        
        
        
        
        var shouldQuit = false
        
        repeat {
            mainWindow.write("Welcome to Hangman. Would you like to start a game? Input y/n")
            mainWindow.getStringFromTextField(at: Point(x: 10, y: 10),
                                              maxCharacters: 1,
                                              fieldColorPair: nil)
            

        } while !shouldQuit
    }
}
