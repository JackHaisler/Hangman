;;; Directory Local Variables
;;; For more information see (info "(emacs) Directory Variables")

((swift-mode . 
  ((lsp-sourcekit-extra-args . (
	 "-Xlinker" "-L" "-Xlinker" "/usr/local/lib/merlin/ncurses-1.0.0/ncurses" "-Xswiftc" "-I" "-Xswiftc" "/usr/local/lib/merlin/ncurses-1.0.0/ncurses" 
	 "-Xlinker" "-L" "-Xlinker" "/usr/local/lib/merlin/Curses-1.0.5/Curses/.build/debug" "-Xswiftc" "-I" "-Xswiftc" "/usr/local/lib/merlin/Curses-1.0.5/Curses/.build/debug" 

)))))
