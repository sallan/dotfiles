(add-to-list 'load-path "~/.emacs.d/vendor")

;;;; The order here is important
(load-file "~/.emacs.d/setvars.el")
(load-file "~/.emacs.d/load-libraries.el")
(load-file "~/.emacs.d/utils.el")
(load-file "~/.emacs.d/global-keybindings.el")
(load-file "~/.emacs.d/modes/cperl.el")
;;(load-file "~/.emacs.d/modes/iswitch.el")

(put 'dired-find-alternate-file 'disabled nil)
(global-auto-revert-mode 1)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
;; (server-start)
;; (eshell)

(setenv "P4EDITOR" "emacsclient")
