;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tmadlener				       ;;
;; setup misc stuff that doesnot fit elsewhere ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; saveplace remembers the location in a file when saving
(require 'saveplace)
(toggle-save-place-globally 1) ;; required in emacs > 24.4

;; go-to-address-mode, should make URLs clickable in a buffer
(add-hook 'prog-mode-hook 'goto-address-mode)
(add-hook 'text-mode-hook 'goto-address-mode)
(add-hook 'text-mode-hook 'flyspell-mode)

;; different packages that boost help from emacs
(require 'info+)
(require 'help+)
(require 'help-fns+)
(require 'help-mode+)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: AUCTeX                   ;;
;; usefull package for LaTeX editing ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load "auctex.el" nil t t) ;; load auctex on startup

(setq-default TeX-PDF-mode t)

(defun auctex-hook-function ()
  (setq TeX-auto-save t)
  (setq TeX-parse-self t) ;; parse document
  ;; (setq TeX-engine 'pdflatex)
  ;; (setq latex-run-command "pdflatex") ;; probably unnecessary -> AUCTeX seems to use this by default

  (setq-default TeX-master nil) ;; make AUCTex ask for a master (i.e. main file in which other files are included)
  ;; TODO: debug this
  (TeX-source-correlate-mode t) ;; synchronise evince and source (make pdf clickable to get to source)
  )

(add-hook 'LaTeX-mode-hook 'auctex-hook-function)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;; (add-hook 'LaTeX-mode-hook 'flymake-mode-on) ;; something is off with this thing

(require 'tex)
(TeX-global-PDF-mode t)
(setq TeX-save-query nil) ;; autosave on tex-command

(setq reftex-plug-into-AUCTeX t)

;; highlight some userdefined commands. using the auctex warning feature for this (NOTE: only keywords not
;; arguments are highlighted with this!)
;; a more sophisticated approach would be to define a face-lock for this, but that would probably be an overkill
(setq font-latex-match-warning-keywords
      '(
        ("citeme" "{")
        ("comment" "{")
        ("todo" "{")
        ("refmis" "{")
        ("rudiNote" "{")
        )
      )

(provide 'setup-misc)
;;; setup-misc.el  ends here
