;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tmadlener: module provides some convenience stuff			        ;;
;; NOTE: the packages have to be installed				        ;;
;; COULDDO: automate this somehow (look in prelude source how it is done there) ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'setup-convenience) ;; make available via require in init.el

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: helm				      ;;
;; tutorial stuff on: tuhdo.github.io/helm-intro.html ;;
;; also inspired by that			      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'helm)
(require 'helm-config)

;; default "C-c c" is quite close to "C-c C-x", which quits emacs
;; changed to "C-c h". Has to be set globally since 'helm-command-prefix-key'
;; cannot be changed once 'helm-config' is loaded
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persisten action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal (?)
(define-key helm-map (kbd "C-z") 'helm-select-action) ; list actions using C-z

(define-key minibuffer-local-map (kbd "C-c C-l") 'helm-mini-buffer-history) ; helm interface to minibuffer history

(setq helm-split-window-in-side-p t ; open helm buffer inside current window
      ;; move to end or beginning of source when reaching top or bottom of source
      helm-move-to-line-cycle-in-source t
      ;; search for library in 'require and 'declare-function sexp
      helm-ff-search-library-in-sexp t
      helm-scroll-amount 8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

;; turn on helm-mode everywhere
(helm-mode 1)

;; define size of helm-window (set to equal values for min and max for constant
;; size of window
(helm-autoresize-mode t)
(setq helm-autoresize-max-height 30
      helm-autoresize-min-height 30)

(global-set-key (kbd "M-x") 'helm-M-x) ;; bind M-x to helm-M-x
;; allow for cycling the kill-ring with helm
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini) ;; helm-mini for buffer switching
(global-set-key (kbd "C-x C-f") 'helm-find-files) ;; use helm for find-file
(global-set-key (kbd "C-c h o") 'helm-occur) ;; shorter kbd for helm-occur
(global-set-key (kbd "C-c h g") 'helm-do-grep) ;; shorter kbd for grep with helm
(global-set-key (kbd "C-c h x") 'helm-register) ;; helm for emacs registers

;; get man pages at point via C-c h m -> ('helm-command-prefix m)
(add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)

;; helm-descbinds for having a helm interface to descbinds describing the current
;; key bindings
;; usage: <prefix> C-h lists all key-bindings that begin with <prefix>
;; NOTE: replaces a built-in command that does approx. the same
(require 'helm-descbinds)
(helm-descbinds-mode -1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END HELM ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; update changes on file on disk to the current buffer
(global-auto-revert-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Hippie Expand							       ;;
;; hippie-expand is a better version of dabbrev-expand (includes more sources) ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "M-/") 'hippie-expand) ;; replace dabbrev-expand
(setq
 hippie-expand-try-functions-list
 '(try-expand-dabbrev ;; Try to expand word "dynamically", searching current buffer
   try-expand-dabbrev-all-buffers ;; same as above with all buffers
   try-expand-dabbrev-from-kill ;; search the kill ring for expansions
   try-complete-file-name-partially ;; complete text as a file name, as many chars as unique
   try-complete-file-name ;; try to complete text as a file name
   try-expand-all-abbrevs ;; try to expand word before point accordint to all abbrev tables
   try-expand-list ;; try to complete current line to an entire line in the buffer
   try-complete-lisp-symbol-partially ;; try to complete as an emacs lisp symbol
   try-complete-lisp-symbol) ;; try to complete word as an emacs lisp symbol
 )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ibuffer							      ;;
;; basic settings: display in other window and change point to buffer ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq ibuffer-use-other-window t)
(setq ibuffer-auto-buffers-changed t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: company						       ;;
;; "complete anything" has pluggable back-ends to retrieve and display ;;
;; completion candidates					       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'company)
(add-hook 'after-init-hook 'global-company-mode) ;; enable global company mode

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: company-c-headers		   ;;
;; make header-files available for company ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'company-c-headers)
(add-to-list 'company-backends 'company-c-headers)
;; enable c++ header completion
(add-to-list 'company-c-headers-path-system "/usr/include/c++/4.8")
