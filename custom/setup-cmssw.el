;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tmadlener:                                                                           ;;
;; the aim of this file is to have as much definitions as possible for working in       ;;
;; CMSSW environments as possible in one file. This file is loaded globally in init.el, ;;
;; maybe there is some time in the future where this can be put more elegantly          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'setup-cmssw)


(setq cc-search-directories '("." "../interface" "../src"))
(global-set-key (kbd "C-c b") 'ff-find-other-file)


