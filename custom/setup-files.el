;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tmadlener                                                  ;;
;; setup basic file handling stuff (backup of files, etcc...) ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'setup-files)

;; change large file warning threshold to 100 MB
(setq large-file-warning-threshold 100000000)

;; collect all backups of files in one central directory
(defvar backup-directory "~/.backups.emacs")
(if (not (file-exists-p backup-directory))
    (make-directory backup-directory t))
(setq
 make-backup-files t ; backup a file the first time it is saved
 backup-directory-alist `((".*" . ,backup-directory)) ; save backup files in defined directory
 backup-by-copying t ; copy current file into backup directory
 version-control t ; version number for backup files
 delete-old-versions 6 ; oldest version to keep when a new numbered backup is made
 kept-new-versions 9 ; newest versions to keep when a new numbered backup is made
 auto-save-default t ; auto-save every buffer that visits a file
 auto-save-timeout 20 ; number of seconds idle time before auto-save
 auto-save-interval 200 ; number of keystrokes between autosaves
 )

(add-hook 'dired-mode-hook 'auto-revert-mode) ;; automatically refresh dired buffer on changes (on disk)
