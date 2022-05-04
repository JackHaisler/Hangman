import Curses

// Keeps track of hidden characters and displays only those characters which have
// been revealed, otherwise display an underscore
class WordDisplay {
    let word: String
    var isLetterRevealed: [Bool]

    init(word: String) {
        self.word = word
        self.isLetterRevealed = [Bool](repeating: false, count: word.count)
    }

    func writeToWindow(window: Window, at point: Point) {
        window.cursor.position = point
        
        var index = 0
        for letter in word {
            if isLetterRevealed[index] {
                window.write(" \(letter) ")
            } else {
                window.write(" _ ")
            }

            index += 1
        }
        var letterEntered:[String]{
            if letterEntered{
            }
        }
    }

    func revealLetter(at index: Int) {
        precondition(index < word.count, "index exceeds bounds of word")
        isLetterRevealed[index] = true
    }
}
