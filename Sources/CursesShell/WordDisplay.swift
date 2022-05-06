import Curses

// Keeps track of hidden characters and displays only those characters which have
// been revealed, otherwise display an underscore
class WordDisplay {
    let word: String
    var isLetterRevealed: [Bool]
    var guessedCharacters = [Character]() // Create new, empty array of characters 

    init(word: String) {
        self.word = word
        self.isLetterRevealed = [Bool](repeating: false, count: word.count)
    }

    func writeToWindow(window: Window, at point: Point) {
        window.cursor.position = point

        window.write("So far: ")

        // Display word, using dashes if letter has not yet been guessed 
        var index = 0
        for letter in word {
            if isLetterRevealed[index] {
                window.write(" \(letter) ")
            } else {
                window.write(" _ ")
            }

            
            index += 1
            
        }
                    window.write("\n")

        // Display guessed characters, separated by commas
        window.write(guessedCharacters.map {String($0)}.joined(separator: ","))
    }

    func handleGuess(character: Character) {
        guessedCharacters.append(character)
    }

    func revealLetter(at index: Int) {
        precondition(index < word.count, "index exceeds bounds of word")
        isLetterRevealed[index] = true
    }
}
