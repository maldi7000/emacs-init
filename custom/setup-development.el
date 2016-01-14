;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tmadlener							     ;;
;; setup development stuff (project handling, semantic setup, etc... ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'setup-development)

;; official (stand alone) documentation of cedet states that this has to be
;; loaded before any other CEDET component!
(require 'cedet)

;; start garbage collection every 100 to improve emacs performance
(setq gc-cons-threshold 100000000)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: slime	       ;;
;; for common-lisp programming ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq inferior-lisp-program "/usr/bin/sbcl") ;; using steel bank common lisp compiler
(require 'slime-autoloads)
(add-to-list 'slime-contribs 'slime-fancy)

;; semantic setup
(require 'cc-mode)
(require 'semantic)
(require 'semantic/ia)
(require 'semantic/bovine/gcc) ;; automatically load headers found by gcc
(require 'company-semantic)

(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode 1) ;; cache done parsing
;; check if buffer is out of date automatically instead of waiting for command
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode 1)
;; enables automatic bookmarking of tags that you edited, so you can return to them later with the semantic-mrub-switch-tags command
(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode 1) 
;; activate highlighting of local names that are the same as name of tag under cursor
(add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode 1)
;; activate displaying of possible name completions in the idle time
;; (add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode 1) ;; slowing down emacs

;; (require 'stickyfunc-enhance)
;; (add-hook 'prog-mode-hook 'semantic-stickyfunc-mode)
;; apparently needs mor tweaking

(semantic-mode 1)


;; enable EDE (project management features)
(require 'ede)
(global-ede-mode 1)
(ede-enable-generic-projects) ;; enables generic projects in ede -> check if this actually enhances something!

;; copied from oliver frosts configurations
(global-set-key (kbd "C-c SPC") 'semantic-complete-analyze-inline)
(global-set-key (kbd "C-c RET") 'semantic-ia-complete-symbol) ;; more explicit version of the former
(global-set-key (kbd "C-c v") 'semantic-ia-show-variants)
(global-set-key (kbd "C-c i") 'semantic-ia-show-doc)
(global-set-key (kbd "C-c o") 'semantic-analyze-proto-impl-toggle)

;; compile settings
(require 'compile)
(setq compilation-ask-about-save nil ;; just save before compilation
      compilation-always-kill t ;; just kill old compile processes before starting the new one
      compilation-scroll-output 'first-error ;; scroll to first error automatically
      )

(global-set-key (kbd "<f5>") 'compile)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: python-mode		   ;;
;; open SCons files in python mode ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'auto-mode-alist '("SConstruct" . python-mode))
(add-to-list 'auto-mode-alist '("SConscript" . python-mode))

;; eldoc mode
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
