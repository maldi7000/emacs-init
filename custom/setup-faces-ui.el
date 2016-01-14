;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tmadlener					    ;;
;; setup ui and other stuff concerning apperearance ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'setup-faces-ui)

;; remove unnecessary stuff (scroll bars, tool bars)
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; turn of blinking cursor
(blink-cursor-mode -1)

;; scrolling behavior
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; more useful frame title that show either file or buffer name
;; from prelude-ui.el
(setq frame-title-format
      '("" invocation-name " - " (:eval (if (buffer-file-name)
					    (abbreviate-file-name (buffer-file-name))
					  "%b"))))

;; change font for better looking text
;; NOTE: this seems to only work for ui-version at the moment (this has something
;; to do with the terminal emulator rather than with emacs itself?)
(setq default-frame-alist '((font . "Inconsolata-11")))
;; provide font for italic
(set-face-attribute 'italic nil
		    :family "Inconsolata-Italic")

;; color themes
(require 'color-theme)
(load-theme 'monokai t) ;; monokai theme
