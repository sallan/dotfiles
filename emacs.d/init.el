;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(cond ((>= emacs-major-version 25)
       (require 'package)
       (add-to-list 'package-archives
		    '("melpa" . "https://melpa.org/packages/"))
       (package-initialize)))

;; end of package.el junk

;;;; Variable settings
(setq custom-file "~/.emacs.d/custom.el")
(setq inhibit-startup-message t)
(setq make-backup-files nil)
(setq visible-bell t)
(setq font-lock-maximum-decoration t)
(setq display-time-day-and-date t)
(setq dabbrev-case-replace nil)
(setq dired-recursive-deletes (quote top))
(setq scroll-conservatively 1)
(setq scroll-step 1)
(setq transient-mark-mode t)
(setq indent-tabs-mode nil)
(setq archive-zip-use-pkzip nil)
(setq large-file-warning-threshold nil)

(line-number-mode 1)
(column-number-mode 1)
(display-time)
(global-auto-revert-mode 1)

(setenv "P4CONFIG" ".p4config")
(setenv "P4EDITOR" "emacsclient")

;;;; Global key bindings
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "C-c %")   'replace-string)
(global-set-key (kbd "C-c s")   'shell)
(global-set-key (kbd "C-c e")   'eshell)
(global-set-key (kbd "C-c i")   'imenu)
(global-set-key (kbd "C-c =")   'ediff-buffers)
(global-set-key (kbd "C-c o")   'occur)
(global-set-key (kbd "M-g")     'goto-line)
(global-set-key (kbd "C-c m")   'manual-entry)
(global-set-key (kbd "C-x C-b") 'buffer-menu)
(global-set-key (kbd "C-c b")   'electric-buffer-list)
(global-set-key (kbd "M-/")     'hippie-expand)
(global-set-key (kbd "M-s") 'isearch-forward-regexp)
(global-set-key (kbd "M-r") 'isearch-backward-regexp)
(global-set-key (kbd "M-.") 'find-tag)
(global-set-key (kbd "M-,") 'pop-tag-mark)
(global-set-key (quote [C-prior]) (quote scroll-other-window-down))
(global-set-key (quote [C-next]) (quote scroll-other-window))
(global-set-key "\C-cd" 'comment-line-and-duplicate)
(global-set-key [(f5)] 'speedbar-get-focus)
(global-set-key "\C-cd" 'comment-line-and-duplicate)
(global-set-key (kbd "C-c 1")   'delete-other-windows)
(global-set-key (kbd "C-c 2")   'stevea-split-buffer)

;; I sometimes accidentally type C-x f instead of C-x C-f
;; which calls the annoying set-fill-column function. Unbind
;; it.
(global-unset-key (kbd "C-x f"))

;; Remap right option key on Mac to ctr
(if (eq system-type 'darwin)
    (setq ns-right-alternate-modifier 'control))

;; Remap right command key on Mac to Alt - no more accidently exiting emacs!!
(if (eq system-type 'darwin)
    (setq ns-right-command-modifier 'meta))

;;;; File modes
(setq auto-mode-alist 
      (append '(("\\.xml$" . xml-lite-mode)
		("\\.mak$" . makefile-mode)
		("\\.def$" . makefile-mode)
		("\\.def.inc$" . makefile-mode)
		("\\.rb$"  . ruby-mode)
		("rakefile" . ruby-mode)
                ("\\.pl$"  . cperl-mode)
                ("\\.pm$"  . cperl-mode)
                ("\\.t$"   . cperl-mode)
                ("\\.cpp$" . c++-mode)
		("\\.py$"  . python-mode)
		("\\.pod$" . pod-mode)
		("\\.bat$" . bat-mode)) auto-mode-alist))


;; TODO: Fix this
(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/dotfiles/emacs.d/vendor")

;;;; Load and configure useful libraries
(require 'dired-x)
(require 'ediff-hook)
(require 'find-lisp)
(require 'uniquify)
(setq uniquify-non-file-buffer-names t)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-after-kill-buffer-p t)

;;;; The order here is important
;;(load-file "~/.emacs.d/setvars.el")
;;(load-file "~/.emacs.d/load-libraries.el")
(load-file "~/.emacs.d/utils.el")
;;(load-file "~/.emacs.d/global-keybindings.el")
;;(load-file "~/.emacs.d/modes/cperl.el")
;;(load-file "~/.emacs.d/modes/iswitch.el")

;;;; Org mode settings
(add-hook 'org-mode-hook
	  (lambda ()
	    (progn
	      (auto-fill-mode 1))))


;; What does this do? Do I need it?
;;(put 'dired-find-alternate-file 'disabled nil)


;; (setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
(server-start)

;;;; Stuff specific to this Mac.  Refactor this
(require 'xml-lite nil t)
(require 'p4 nil t)
(p4-set-p4-executable "/usr/local/bin/p4")

;; Start in the work directory
(dired "~/Work")
;;(eshell)
