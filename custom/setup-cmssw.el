;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tmadlener:                                                                           ;;
;; the aim of this file is to have as much definitions as possible for working in       ;;
;; CMSSW environments as possible in one file. This file is loaded globally in init.el, ;;
;; maybe there is some time in the future where this can be put more elegantly          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Code:
(setq cc-search-directories '("." "../interface" "../src"))
(global-set-key (kbd "C-c b") 'ff-find-other-file)

;; get some environment variables
(defcustom scram-arch (getenv "SCRAM_ARCH") "The scram architecture used in environment")
(defcustom cmssw-version (getenv "CMSSW_VERSION") "The used version of cmssw")
(defcustom cmssw-release-base (getenv "CMSSW_RELEASE_BASE") "The release base directory")
(defcustom cmssw-base (getenv "CMSSW_BASE") "The base directory of the currently used cmssw")
(defcustom cmssw-ede-file (concat cmssw-base "/src/.gitignore") "Default file needed for ede to hang project off of")
(defcustom cmssw-rootsys (getenv "ROOTSYS") "The directory to the root source code used by the cmssw version in use")

(defun setup-cmssw-ede-project ()
  "Setup the stuff cedet needs for cmssw"
  (interactive)
    (ede-cpp-root-project
     "cmssw"
     :name "CMS SoftWare"
     :file cmssw-ede-file
     :include-path '("../interface" "/interface" (concat cmssw-base "/src") (concat cmssw-release-base "/src"))
     :system-include-path
     (list
      ;; CMSSW
      (concat cmssw-release-base "/src")
      ;; ROOT
      (concat cmssw-rootsys "include")
      )
     :spp-table '()
     :compile-command "scramv1 b -j8 src"
     )
  (message (concat "setup ede-cpp-root-project for " cmssw-version)))

;; check if all environment variables that are needed are setup and setup the ede-project for cmssw
(if (and scram-arch cmssw-base cmssw-release-base cmssw-version)
    (setup-cmssw-ede-project)
  (message "cmssw environment not setup. Not setting up the cmssw ede project. Run cmsenv if you need this"))

;; define a minor-mode for cmssw
(define-minor-mode cmssw-devel-mode
  "minor mode for cmssw-development. Does not do really much besides defining some keys"
  :lighter " cmssw"
  :keymap '(( [f6] . next-error)
            ( [f7] . ede-compile-project ) ;; different keys for scram and make
            ( [f5] . compile) ;; for things that are not compiled with scram
            )
  )

;; define a hook-function that will be called on the c++-mode-hook
(defun cmssw-devel-mode-turn-on ()
  "Setup all that is needed for working with cmssw without checking if the environment is set correctly"
  (interactive)
  (if (and scram-arch cmssw-base cmssw-release-base cmssw-version cmssw-rootsys)
      (cmssw-devel-mode 1)
    (message "cmssw environment not set leaving cmssw-devel-mode off"))
  )

(add-hook 'c++-mode-hook 'cmssw-devel-mode-turn-on)
(add-hook 'nxml-mode-hook 'cmssw-devel-mode-turn-on) ;; turn on minor mode also in .xml files

;; TODO: make this check if this flag is available first.
;; disabled for the moment
;; (add-hook 'c++-mode-hook
;;           (lambda () (setq flycheck-gcc-language-standard "c++11"
;;                            flycheck-clang-language-standard "c++11")))

(provide 'setup-cmssw)
;;; setup-cmssw.el ends here
