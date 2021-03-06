(line-number-mode 1)
(column-number-mode 1)
(display-time)
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
