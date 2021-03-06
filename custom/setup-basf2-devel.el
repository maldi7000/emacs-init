;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tmadlener                                                                           ;;
;; aim of this file is to define a basf2 minor mode and a ede project that allows      ;;
;; for the use of code-completion and other usefull development / programming commands ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'setup-basf2-devel)

;; make environment variables available
;; (taken from oliver frosts configuration)
(defcustom belle2-externals-dir (getenv "BELLE2_EXTERNALS_DIR") "Location of the BASF2 externals")
(defcustom belle2-local-dir (getenv "BELLE2_LOCAL_DIR") "Location of the BASF2 local release")
(defcustom belle2-tools (getenv "BELLE2_TOOLS") "Location of the BASF2 tools")
(defcustom belle2-option (getenv "BELLE2_OPTION") "Major compilation mode of the BASF2 release")
(defcustom belle2-sconstruct (concat  belle2-local-dir "/SConstruct") "Major scons file for the basf2 project")

(if (file-exists-p belle2-sconstruct)
    (ede-cpp-root-project
     "basf2"
     :name "Belle2 Analysis Software Framework"
     :file belle2-sconstruct
     :include-path '("/include" "../include")
     :system-include-path
     (list
      ;; std library
      ;; as generated by g++ -E -x c++ - -v < /dev/null
      (concat belle2-tools "/gcc/include/c++/4.7.3")
      (concat belle2-tools "/gcc/include/c++/4.7.3/x86_64-unknown-linux-gnu")
      (concat belle2-tools "/gcc/include/c++/4.7.3/backward")
      (concat belle2-tools "/gcc/include")
      (concat belle2-tools "/gcc/lib/gcc/x86_64-unknown-linux-gnu/4.7.3/include-fixed")
      "usr/local/include"
      "usr/include"

      ;; python
      (concat belle2-tools "/python/include/python2.7")

      ;; externals (only added things necessary for me here
      (concat belle2-externals-dir "/include")
      (concat belle2-externals-dir "/include/boost")
      (concat belle2-externals-dir "/include/root")
      (concat belle2-externals-dir "/root/Linux_x86_64/opt/include")

      )

     :spp-table'()
     :compile-command "scons -j4 -D"
     )
  ;; add else statement to if, becaus if (file-exists-p foo) evaluates to nil and there is no
  ;; else statement the then statement will be executed -> error in concat
  (message "SConstruct file not found. Cannot setup basf2 properly in emacs. To set-up start from terminal with basf2 setup")
  )

;; adjust the search path for header / source files to the basf2 folder structure
( setq cc-search-directories '("." "/usr/include" "/usr/local/include/*" "../include" "../src"))
(global-set-key (kbd "C-c b")'ff-find-other-file)

;; define a basf2 minor mode, that gets activated if in a basf2 environment
(define-minor-mode basf2-devel-mode
  "Short cuts for compilation and testing of the basf2 release"
  :lighter " basf2"
  :keymap '(( [f3] . next-error )
            ( [f5] . compile )
            )
  )

;; turn on basf2 minor mode only when under the release directory
(defun basf2-minor-mode-turn-on
    (cond ((string-match (concat "^" belle2-local-dir) (file-truename buffer-file-name))
           (basf2-devel-mode 1))))

(add-hook 'c++-mode-hook 'basf2-minor-mode-turn-on)
