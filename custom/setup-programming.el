;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tmadlener					     ;;
;; setup stuff concerning programming in this module ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'setup-programming)

;; enable line-numbers in programming-mode by default
(add-hook 'prog-mode-hook 'linum-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: flycheck & flycheck-tip								 ;;
;; flycheck for syntax checking. flycheck-tip for having a popup appear instead of the echo area ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
(require 'flycheck-tip)
(flycheck-tip-use-timer 'verbose)

(eval-after-load 'flycheck
  '(custom-set-variables
    '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))


;; whitespace setup (trailing whitespaces and max chars per line)
(require 'whitespace)
(setq whitespace-style '(face empty lines-tail trailing))
(setq whitespace-line-column 132) ;; mark lines with more than 132 chars (Belle2 limit)
(global-whitespace-mode 1)

;; hs-minor-mode for code folding
(add-hook 'prog-mode-hook 'hs-minor-mode)
(global-set-key (kbd "C-c f") 'hs-hide-block)
(global-set-key (kbd "C-c s") 'hs-show-block)

