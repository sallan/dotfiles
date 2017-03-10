
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/vendor")

;;;; The order here is important
(load-file "~/.emacs.d/setvars.el")
(load-file "~/.emacs.d/load-libraries.el")
(load-file "~/.emacs.d/utils.el")
(load-file "~/.emacs.d/global-keybindings.el")
(load-file "~/.emacs.d/modes/cperl.el")
(load-file "~/.emacs.d/modes/iswitch.el")

(put 'dired-find-alternate-file 'disabled nil)
(global-auto-revert-mode 1)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
(server-start)

(setenv "P4EDITOR" "emacsclient")

;; Start in the work directory
(dired "~/Work")
;;(eshell)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
