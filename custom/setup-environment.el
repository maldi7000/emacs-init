;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tmadlener				 ;;
;; set environment/appearance stuff here ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'setup-environment)

;; mandatory inhibiting of startup splash screen
(setq inhibit-startup-screen t)

;; set column number in mode bar
(column-number-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: golden ratio					      ;;
;; split windows in golden ratio making the active window the largest ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'golden-ratio)

;; ;; do not use golden-ratio on helm window
;; (defun pl/helm-alive-p()
;;   (if (boundp 'helm-alive-p)
;;       (symbol-value 'helm-alive-p)))

;; (add-to-list 'golden-ratio-inhibit-functions 'pl/helm-alive-p)

;; ;; do not enable golden-ratio in following modes
;; (setq golden-ratio-exclude-modes '("helm-mode"))

;; (golden-ratio-mode 1) ;; enable globally
