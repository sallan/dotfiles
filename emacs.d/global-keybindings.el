(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "C-c %")   'replace-string)
(global-set-key (kbd "C-c s")   'shell)
(global-set-key (kbd "C-c e")   'eshell)
(global-set-key (kbd "C-c =")   'ediff-buffers)
(global-set-key (kbd "C-c o")   'occur)
(global-set-key (kbd "M-g")     'goto-line)
;;(global-set-key (kbd "C-c c")   'comment-region)
(global-set-key (kbd "C-x C-b") 'buffer-menu)
(global-set-key (kbd "C-c b")   'electric-buffer-list)
(global-set-key (kbd "M-/")     'hippie-expand)
;;(global-set-key (kbd "<f11>")   'delete-other-windows)
;;(global-set-key (kbd "<f12>")   'stevea-split-buffer)
;;(global-set-key (kbd "C-c l") 'org-store-link)
;;(global-set-key (kbd "C-c a") 'org-agenda)
;;(global-set-key (kbd "C-c b") 'org-iswitchb)
;;(global-set-key (kbd "C-c r") 'org-remember)
;; (global-set-key (kbd "C-x C-m") 'execute-extended-command)
;; (global-set-key (kbd "C-c C-m") 'execute-extended-command)
;; (global-set-key (kbd "C-w") 'backward-kill-word)
;; (global-set-key (kbd "C-x C-k") 'kill-region)
;; (global-set-key (kbd "C-c C-k") 'kill-region)
(global-set-key (kbd "M-s") 'isearch-forward-regexp)
(global-set-key (kbd "M-r") 'isearch-backward-regexp)
(global-set-key (kbd "M-.") 'find-tag)
(global-set-key (kbd "M-,") 'pop-tag-mark)
(global-set-key (quote [C-prior]) (quote scroll-other-window-down))
(global-set-key (quote [C-next]) (quote scroll-other-window))
(global-set-key "\C-cd" 'comment-line-and-duplicate)
(global-set-key [(f5)] 'speedbar-get-focus)
(global-set-key "\C-cd" 'comment-line-and-duplicate)

;; I sometimes accidentally type C-x f instead of C-x C-f
;; which calls the annoying set-fill-column function. Unbind
;; it.
(global-unset-key (kbd "C-x f"))
