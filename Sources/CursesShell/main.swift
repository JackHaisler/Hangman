import Foundation
import Curses

// Define interrupt handler to terminate Curses with CTRL-C
class Handler : CursesHandlerProtocol {
    func interruptHandler() {
        screen.shutDown()
        print("Good bye!")
        exit(0)
    }

    func windowChangedHandler() {
    }
}

// Start up Curses
let screen = Screen.shared
screen.startUp(handler:Handler())

let game = Game(mainWindow: screen.window)
try game.run()

// Wait forever, or until the user presses CTRL-C
screen.wait()
