;;; package --- Setting up org-mode
;;; Commentary:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tmadlener                                                                      ;;
;; org-mode setup: following mostly conventions from                              ;;
;; http://koenig-haunstetten.de/2016/06/11/orgmode-tutorial-episode-01/#more-6062 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Code:
(require 'org-install)
(require 'org-capture)

;; TODO: setup-agenda file

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(provide 'setup-org)
;;; setup-org.el ends here
