(require 'dired-x)
(require 'ediff-hook)
(require 'find-lisp)
(require 'uniquify)
(setq uniquify-non-file-buffer-names t)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-after-kill-buffer-p t)

;; These are not guaranteed to be present so don't throw an error if
;; they can't be loaded.

;; TODO: Maybe these need to be in there own file so if they get
;; loaded we can customize them with hooks.
(require 'xml-lite nil t)
(require 'p4 nil t)

(add-to-list 'load-path "~/.emacs.d/vendor/magit-1.2.0")
(autoload 'magit-status "magit" nil t)

;;(require 'python-mode nil t)
;;(require 'w3m-load nil t)


;;using w3m from dired
;; (defun dired-w3m-find-file ()
;;   "Browse file at point in w3m"
;;   (interactive)
;;   (require 'w3m)
;;   (let ((file (dired-get-filename)))
;;     (when (y-or-n-p (format "Open 'w3m' %s " (file-name-nondirectory file)))
;;         (w3m-find-file file))))
;; (add-hook 'dired-mode-hook
;;           (lambda ()
;;             (define-key dired-mode-map (kbd "b") 'dired-w3m-find-file)))

