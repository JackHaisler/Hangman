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
        mainWindow.write("loaded \(words.count) words...")
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
        mainWindow.write("selecting random word...")
        mainWindow.refresh()
        
        let randomWord = goodWords.randomElement()!
        let wordDisplay = WordDisplay(word: randomWord)
        
        mainWindow.write("word selected.  Ready to play!")
        mainWindow.refresh()
        
        var shouldQuit = false
        var yValue = 5        
        repeat {
            mainWindow.cursor.position = Point(x: 0, y: 5)
            mainWindow.write("Welcome to Hangman. Enter your guess: \n")
            let guess = mainWindow.getStringFromTextField(at: Point(x: 38, y: 5),
                                                          maxCharacters: 1,
                                                          fieldColorPair: nil)
            wordDisplay.handleGuess(character: Character(guess))
            
            mainWindow.cursor.position = Point(x: 0, y: 6)
            mainWindow.write("You guessed: \(guess)")

            wordDisplay.writeToWindow(window: mainWindow, at: Point(x: 0, y: 10 ))
            mainWindow.refresh()

        } while !shouldQuit
    }
}
