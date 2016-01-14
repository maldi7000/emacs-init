;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tmadlener: aim of this goal is to make emacs control matlab via matlab-emacs               ;;
;; sources: http://blogs.mathworks.com/community/2009/09/14/matlab-emacs-integration-is-back/ ;;
;; http://blog.angjookanazawa.com/post/8815280589/productivity-matlab-emacs-integration-more  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;;; Code:
;; (provide 'setup-matlab)

;; ;; add matlab-emacs to load path
;; (add-to-list 'load-path "~/.emacs.d/matlab-emacs")
;; (load-library "matlab-load")
;; (matlab-cedet-setup)

;; (custom-set-variables
;;  '(matlab-shell-command-switches '("-nodesktop -nosplash")))

;; ;; setup debugging key shortcuts (also valid for GDB)
;; (global-set-key (kbd "<f10>") 'gud-cont)
;; (global-set-key (kbd "<f9>") 'gud-step) ;; equiv matlab step
;; (global-set-key (kbd "<f8>") 'gud-next) ;; equiv matlab step
;; (global-set-key (kbd "<f7>") 'gud-finish) ;; equiv matlab step out

;; (provide 'setup-matlab)
;;; ends here
