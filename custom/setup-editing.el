;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tmadlener			   ;;
;; setup things concerning editing ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'setup-editing)

;; set some variables here
(setq global-mark-ring-max 5000 ; increase mark ring capacity
      mark-ring-max 5000
      mode-require-final-newline t ; add newline to end of file
      ;; tab-width 4
      )

;; set variables concerning encoding
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)

(setq-default indent-tabs-mode nil)
(delete-selection-mode 1)
(global-set-key (kbd "RET") 'newline-and-indent)

;; kill ring behavior
(setq
 kill-ring-max 5000 ; increase kill-ring capacity
 ;; kill-whole-line t ; If non-nil, `kill-line' with no arg at start of line kills the whole line.
 )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Customized beginning of line function						      ;;
;; 											      ;;
;; toggles between beginning of line and first non-whitespace char			      ;;
;; from  http://emacsredux.com/blog/2013/05/22/smarter-navigation-to-the-beginning-of-a-line/ ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: smartparens                                     ;;
;; parenthesis support via smartparens (similar to paredit) ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'smartparens-config)
(smartparens-global-mode 1)
(show-smartparens-global-mode 1)

;; for c++ editing
(sp-with-modes '(c++-mode c-mode)
  (sp-local-pair "{" nil :post-handlers '(("||\n[i]" "RET"))))
(sp-local-pair 'c++-mode "/*" "*/" :post-handlers '((" | " "SPC")
                                                    ("* ||\N[i]" "RET")))


;; (re-)define some keybindings for hideshow functions
(global-set-key (kbd "C-c C-h") 'hs-toggle-hiding)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: highlight-symbol ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'highlight-symbol)
(setq highlight-symbol-mode t) ;; enable highlight-symbol-mode globally
(setq highlight-symbol-idle-delay 5)
;; TODO: think of some better keybindings for this maybe
(global-set-key (kbd "C-x w s") 'highlight-symbol-next)
(global-unset-key (kbd "C-x w r"))
(global-set-key (kbd "C-x w r") 'highlight-symbol-prev)
(global-set-key (kbd "M-s h d") 'highlight-symbol-remove-all)

